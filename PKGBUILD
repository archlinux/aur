# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cpu
pkgver=1.4.0
pkgrel=7
pkgdesc="Python bindings for whisper.cpp (CPU-only variant)"
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
)
optdepends=(
  'python-sounddevice: run pywhispercpp examples that capture audio'
  'python-webrtcvad: run VAD-based examples'
  'python-pyqt5: run GUI example'
)
provides=('python-pywhispercpp')
conflicts=('python-pywhispercpp' 'python-pywhispercpp-cuda' 'python-pywhispercpp-rocm')
source=("git+https://github.com/Absadiki/pywhispercpp.git#commit=4ab96165f84e8eb579077dfc3d0476fa5606affe")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/pywhispercpp"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/pywhispercpp"
  # CPU-only: no GPU environment variables set
  python -m build --wheel
}

package() {
  cd "$srcdir/pywhispercpp"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Verify no driver libraries are bundled (CPU package should not have GPU driver libs)
  local _python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local _site_packages="$pkgdir/usr/lib/python$_python_version/site-packages"
  local _libs_dir="$_site_packages/pywhispercpp.libs"
  
  if [ -d "$_libs_dir" ]; then
    # Check for any GPU driver libraries (should not be present in CPU build)
    _driver_libs=$(find "$_libs_dir" -name "libcuda*.so*" -o -name "libhsa-runtime64*.so*" -o -name "librocm_smi64*.so*" 2>/dev/null | grep -v "libcudart" || true)
    if [ -n "$_driver_libs" ]; then
      echo "WARNING: Found GPU driver libraries in CPU-only package: $_driver_libs"
      # Remove them to be safe
      find "$_libs_dir" -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true
      find "$_libs_dir" -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true
      find "$_libs_dir" -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true
    fi
  fi
}

