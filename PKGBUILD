# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cuda
pkgver=1.4.0
pkgrel=7
pkgdesc="Python bindings for whisper.cpp with CUDA support (NVIDIA GPU)"
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
  'cuda'
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
  'cuda'
  'patchelf'
)
optdepends=(
  'python-sounddevice: run pywhispercpp examples that capture audio'
  'python-webrtcvad: run VAD-based examples'
  'python-pyqt5: run GUI example'
)
provides=('python-pywhispercpp')
conflicts=('python-pywhispercpp' 'python-pywhispercpp-cpu' 'python-pywhispercpp-rocm')
source=("git+https://github.com/Absadiki/pywhispercpp.git#commit=4ab96165f84e8eb579077dfc3d0476fa5606affe")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/pywhispercpp"
  git submodule update --init --recursive
  
  # Fix CMake Python interpreter detection: use system Python instead of isolated env
  # The isolated build environment's Python can't be executed by CMake
  python << 'EOF'
import re
_system_python = "/usr/bin/python"  # System Python path
with open("setup.py", "r") as f:
    content = f.read()
# Replace sys.executable with system Python path
content = re.sub(
    r'f"-DPYTHON_EXECUTABLE=\{sys\.executable\}"',
    f'f"-DPYTHON_EXECUTABLE={_system_python}"',
    content
)
with open("setup.py", "w") as f:
    f.write(content)
EOF
}

build() {
  cd "$srcdir/pywhispercpp"
  # Set CUDA environment variables for GPU acceleration
  export GGML_CUDA=ON
  export PATH="/opt/cuda/bin:$PATH"
  export CUDACXX="${CUDACXX:-/opt/cuda/bin/nvcc}"
  # Force CMake to use system Python (patch sets PYTHON_EXECUTABLE, but FindPython still searches PATH)
  export CMAKE_ARGS="-DPYTHON_EXECUTABLE=/usr/bin/python -DPython3_EXECUTABLE=/usr/bin/python"
  python -m build --wheel
}

package() {
  cd "$srcdir/pywhispercpp"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Remove bundled libcuda*.so* - must use system /usr/lib/libcuda.so.1
  local _python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local _site_packages="$pkgdir/usr/lib/python$_python_version/site-packages"
  local _libs_dir="$_site_packages/pywhispercpp.libs"
  local _binary_so="$_site_packages/_pywhispercpp.cpython-*-linux-gnu.so"
  
  if [ -d "$_libs_dir" ]; then
    # Remove bundled driver libraries
    find "$_libs_dir" -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true
    find "$_site_packages" -maxdepth 1 -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true
  fi
  
  # Fix binary rpath to include /usr/lib so it can find system libcuda.so.1
  # The binary has rpath [$ORIGIN/pywhispercpp.libs], we add /usr/lib to search system libraries
  for _binary in $_binary_so; do
    if [ -f "$_binary" ]; then
      # Get current rpath
      _current_rpath=$(patchelf --print-rpath "$_binary" 2>/dev/null || echo "")
      if [ -n "$_current_rpath" ]; then
        # Add /usr/lib to rpath if not already present
        if [[ "$_current_rpath" != *"/usr/lib"* ]]; then
          patchelf --set-rpath "$_current_rpath:/usr/lib" "$_binary" 2>/dev/null || true
        fi
      else
        # No rpath set, add /usr/lib
        patchelf --set-rpath "/usr/lib" "$_binary" 2>/dev/null || true
      fi
    fi
  done
}

