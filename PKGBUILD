# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cpu
pkgver=1.4.0
pkgrel=10
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
  # CPU-only: no GPU environment variables set
  # Force CMake to use system Python (patch sets PYTHON_EXECUTABLE, but FindPython still searches PATH)
  # Enable CPU optimizations: Release build with native CPU architecture optimizations
  export CMAKE_ARGS="-DPYTHON_EXECUTABLE=/usr/bin/python -DPython3_EXECUTABLE=/usr/bin/python -DCMAKE_BUILD_TYPE=Release"
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



  # 1) Remove any bundled GPU driver libraries (CPU package should not have these)

  if [ -d "$_libs_dir" ]; then

    # Check for any GPU driver libraries (should not be present in CPU build)

    _driver_libs=$(find "$_libs_dir" -name "libcuda*.so*" -o -name "libhsa-runtime64*.so*" -o -name "librocm_smi64*.so*" 2>/dev/null | grep -v "libcudart" || true)

    if [ -n "$_driver_libs" ]; then

      echo "WARNING: Found GPU driver libraries in CPU-only package: $_driver_libs"

      # Remove them to be safe

      find "$_libs_dir" -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true

      find "$_libs_dir" -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true

      find "$_libs_dir" -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true

      find "$_site_packages" -maxdepth 1 -name "libcuda*.so*" -type f ! -name "libcudart*" -delete 2>/dev/null || true

      find "$_site_packages" -maxdepth 1 -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true

      find "$_site_packages" -maxdepth 1 -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true

      

      # Only do replace-needed if we actually found driver libs (unlikely for CPU build)

      local f needed

      for f in $_binary_so "$_libs_dir"/*.so*; do

        [ -f "$f" ] || continue

        for needed in $(patchelf --print-needed "$f" 2>/dev/null || true); do

          case "$needed" in

            libcuda-*.so* )

              echo "Patching $f: replace-needed $needed -> libcuda.so.1"

              patchelf --replace-needed "$needed" "libcuda.so.1" "$f" 2>/dev/null || true

              ;;

            libhsa-runtime64-*.so* )

              echo "Patching $f: replace-needed $needed -> libhsa-runtime64.so.1"

              patchelf --replace-needed "$needed" "libhsa-runtime64.so.1" "$f" 2>/dev/null || true

              ;;

            librocm_smi64-*.so* )

              echo "Patching $f: replace-needed $needed -> librocm_smi64.so.1"

              patchelf --replace-needed "$needed" "librocm_smi64.so.1" "$f" 2>/dev/null || true

              ;;

          esac

        done

      done

    fi

  fi




}

