# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cuda
pkgver=1.4.0
pkgrel=11
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
  
  # Detect CUDA version and set architectures accordingly
  # CUDA 13.0+ only supports 7.5+ (removed Pascal 6.0, Volta 7.0)
  # CUDA 12.x supports 6.0+ (Pascal through Hopper)
  local cuda_version
  cuda_version=$("${CUDACXX:-nvcc}" --version | grep -oP 'release \K[0-9]+\.[0-9]+' | head -1 || echo "13.0")
  local cuda_major
  cuda_major=$(echo "$cuda_version" | cut -d. -f1)
  
  local cuda_archs
  if [ "$cuda_major" -ge 13 ]; then
    # CUDA 13.0+: 7.5 (Turing), 8.0 (Ampere), 8.6 (Ada), 8.9 (Blackwell), 9.0 (Hopper)
    cuda_archs="75;80;86;89;90"
  else
    # CUDA 12.x and earlier: include older architectures for compatibility
    cuda_archs="70;75;80;86;89;90"
  fi
  
  # Force CMake to use system Python (patch sets PYTHON_EXECUTABLE, but FindPython still searches PATH)
  export CMAKE_ARGS="-DPYTHON_EXECUTABLE=/usr/bin/python -DPython3_EXECUTABLE=/usr/bin/python -DCMAKE_CUDA_ARCHITECTURES=$cuda_archs"
  python -m build --wheel
}

package() {
  cd "$srcdir/pywhispercpp"

  python -m installer --destdir="$pkgdir" dist/*.whl

  

  # Figure out where site-packages landed

  local _python_version

  _python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  local _site_packages="$pkgdir/usr/lib/python$_python_version/site-packages"

  local _libs_dir="$_site_packages/pywhispercpp.libs"

  local _binary_so="$_site_packages/_pywhispercpp.cpython-*-linux-gnu.so"



  # 1) Remove bundled libcuda*.so* (we must use system libcuda.so.1)

  if [ -d "$_libs_dir" ]; then

    find "$_libs_dir" -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true

    find "$_site_packages" -maxdepth 1 -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true

  fi



  # 2) Fix any DT_NEEDED entries that still reference private libcuda-*.so

  local f needed

  for f in $_binary_so "$_libs_dir"/*.so*; do

    [ -f "$f" ] || continue

    for needed in $(patchelf --print-needed "$f" 2>/dev/null || true); do

      case "$needed" in

        libcuda-*.so* )

          echo "Patching $f: replace-needed $needed -> libcuda.so.1"

          patchelf --replace-needed "$needed" "libcuda.so.1" "$f" 2>/dev/null || true

          ;;

      esac

    done

  done



  # 3) Ensure RPATH includes /usr/lib (optional but harmless)

  for f in $_binary_so; do

    [ -f "$f" ] || continue

    local _current_rpath

    _current_rpath=$(patchelf --print-rpath "$f" 2>/dev/null || echo "")

    if [ -n "$_current_rpath" ]; then

      if [[ "$_current_rpath" != *"/usr/lib"* ]]; then

        patchelf --set-rpath "$_current_rpath:/usr/lib" "$f" 2>/dev/null || true

      fi

    else

      patchelf --set-rpath "/usr/lib" "$f" 2>/dev/null || true

    fi

  done

}

