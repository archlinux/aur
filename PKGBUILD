# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=vllm-xpu
pkgver=0.32.0
pkgrel=1
pkgdesc="vLLM optimized for Intel Arc GPUs"
arch=('x86_64')
url="https://github.com/vllm-project/vllm"
license=('Apache-2.0')
# python311 is required because vLLM and Triton XPU explicitly reject Python 3.14
depends=('python311' 'intel-compute-runtime' 'level-zero-loader' 'intel-gmmlib' 'intel-deep-learning-essentials')
makedepends=('python311' 'cmake' 'ninja' 'gcc' 'curl')
provides=('vllm')
conflicts=('vllm')
source=("vllm-${pkgver}.tar.gz::https://github.com/vllm-project/vllm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf592c132f27bbb5f65cff0bbd2ee873eae722b79c8286934fd5b5cf88b43d61')

build() {
  cd "vllm-${pkgver}"

  # Source Intel OneAPI environment for the SYCL compiler
  if [ -f /opt/intel/oneapi/setvars.sh ]; then
    source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1 || true
  else
    echo "ERROR: /opt/intel/oneapi/setvars.sh not found."
    echo "Please ensure intel-deep-learning-essentials is fully installed."
    exit 1
  fi

  # Set XPU target and limit RAM usage (MAX_JOBS)
  export VLLM_TARGET_DEVICE=xpu
  export MAX_JOBS=${MAX_JOBS:-$(nproc)}

  # Fix for setuptools-scm failing on GitHub release tarballs (missing .git folder)
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

package() {
  cd "vllm-${pkgver}"

  # Re-source OneAPI for the package step
  if [ -f /opt/intel/oneapi/setvars.sh ]; then
    source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1 || true
  fi

  export VLLM_TARGET_DEVICE=xpu
  export MAX_JOBS=${MAX_JOBS:-$(nproc)}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  # Create an isolated virtual environment directly in the install prefix.
  # We use --without-pip just in case Arch's python311 split package removed ensurepip.
  # This perfectly bypasses PEP 668 (EXTERNALLY-MANAGED) restrictions!
  /usr/bin/python3.11 -m venv --without-pip "$pkgdir/opt/vllm-xpu"

  # Download and install pip directly into the isolated venv
  curl -sS https://bootstrap.pypa.io/get-pip.py | "$pkgdir/opt/vllm-xpu/bin/python"

  local _pip="$pkgdir/opt/vllm-xpu/bin/python -m pip"

  # Upgrade pip and wheel
  $_pip install --upgrade pip wheel setuptools

  # Find the correct XPU requirements file (vLLM changed its folder structure recently)
  local _req_file=""
  if [ -f requirements-xpu.txt ]; then
    _req_file="requirements-xpu.txt"
  elif [ -f requirements/xpu.txt ]; then
    _req_file="requirements/xpu.txt"
  fi

  # Install XPU specific requirements.
  # We force the extra index URL to guarantee pip finds triton==3.7.2+xpu!
  if [ -n "$_req_file" ]; then
    $_pip install -v --extra-index-url https://wheels.vllm.ai/xpu/ -r "$_req_file"
  fi

  # Build and install vLLM
  $_pip install -v --extra-index-url https://wheels.vllm.ai/xpu/ .

  # Create wrapper scripts in /usr/bin
  install -d "$pkgdir/usr/bin"

  # Wrapper for OpenAI API server
  cat <<'EOF' > "$pkgdir/usr/bin/vllm-xpu"
#!/bin/bash
[ -f /opt/intel/oneapi/setvars.sh ] && source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1 || true
exec /opt/vllm-xpu/bin/python -m vllm.entrypoints.openai.api_server "$@"
EOF
  chmod +x "$pkgdir/usr/bin/vllm-xpu"

  # Wrapper for vllm CLI (e.g. vllm serve)
  cat <<'EOF' > "$pkgdir/usr/bin/vllm-serve-xpu"
#!/bin/bash
[ -f /opt/intel/oneapi/setvars.sh ] && source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1 || true
exec /opt/vllm-xpu/bin/vllm "$@"
EOF
  chmod +x "$pkgdir/usr/bin/vllm-serve-xpu"
}
