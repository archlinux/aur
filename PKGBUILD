# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-rocm
pkgver=1.4.0
pkgrel=7
pkgdesc="Python bindings for whisper.cpp with ROCm support (AMD GPU)"
arch=('x86_64')
url="https://github.com/Absadiki/pywhispercpp"
license=('MIT')
options=('!strip')
depends=(
  'python'
  'python-numpy'
  'python-requests'
  'python-tqdm'
  'python-platformdirs'
  'rocm-hip-runtime<7'
)
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'git'
  'rocm-hip-sdk<7'
  'rocm-opencl-sdk<7'
  'patchelf'
)
optdepends=(
  'python-sounddevice: run pywhispercpp examples that capture audio'
  'python-webrtcvad: run VAD-based examples'
  'python-pyqt5: run GUI example'
)
provides=('python-pywhispercpp')
conflicts=('python-pywhispercpp' 'python-pywhispercpp-cpu' 'python-pywhispercpp-cuda')
source=("git+https://github.com/Absadiki/pywhispercpp.git#commit=4ab96165f84e8eb579077dfc3d0476fa5606affe")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/pywhispercpp"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/pywhispercpp"
  # Set ROCm environment variables for GPU acceleration
  export ROCM_PATH="${ROCM_PATH:-/opt/rocm}"
  export PATH="$ROCM_PATH/bin:$PATH"
  export GGML_HIPBLAS=ON
  export GGML_HIP=ON
  export GGML_ROCM=1
  export CMAKE_PREFIX_PATH="$ROCM_PATH"
  python -m build --wheel
}

package() {
  cd "$srcdir/pywhispercpp"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Remove bundled ROCm driver libraries - must use system libraries
  local _python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local _site_packages="$pkgdir/usr/lib/python$_python_version/site-packages"
  local _libs_dir="$_site_packages/pywhispercpp.libs"
  local _binary_so="$_site_packages/_pywhispercpp.cpython-*-linux-gnu.so"
  
  if [ -d "$_libs_dir" ]; then
    # Remove bundled ROCm driver libraries (keep runtime libraries like libhip*)
    find "$_libs_dir" -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true
    find "$_libs_dir" -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true
    find "$_site_packages" -maxdepth 1 -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true
    find "$_site_packages" -maxdepth 1 -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true
  fi
  
  # Fix binary rpath to include /usr/lib and /opt/rocm/lib so it can find system ROCm libraries
  for _binary in $_binary_so; do
    if [ -f "$_binary" ]; then
      # Get current rpath
      _current_rpath=$(patchelf --print-rpath "$_binary" 2>/dev/null || echo "")
      if [ -n "$_current_rpath" ]; then
        # Add system library paths if not already present
        _new_rpath="$_current_rpath"
        [[ "$_new_rpath" != *"/usr/lib"* ]] && _new_rpath="$_new_rpath:/usr/lib"
        [[ "$_new_rpath" != *"/opt/rocm/lib"* ]] && _new_rpath="$_new_rpath:/opt/rocm/lib"
        patchelf --set-rpath "$_new_rpath" "$_binary" 2>/dev/null || true
      else
        # No rpath set, add system paths
        patchelf --set-rpath "/usr/lib:/opt/rocm/lib" "$_binary" 2>/dev/null || true
      fi
    fi
  done
}

