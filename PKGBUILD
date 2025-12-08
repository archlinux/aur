# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-rocm
pkgver=1.4.0
pkgrel=8
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

  

  # Figure out where site-packages landed

  local _python_version

  _python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  local _site_packages="$pkgdir/usr/lib/python$_python_version/site-packages"

  local _libs_dir="$_site_packages/pywhispercpp.libs"

  local _binary_so="$_site_packages/_pywhispercpp.cpython-*-linux-gnu.so"



  # 1) Remove bundled ROCm driver libraries (we must use system libraries)

  if [ -d "$_libs_dir" ]; then

    find "$_libs_dir" -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true

    find "$_libs_dir" -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true

    find "$_site_packages" -maxdepth 1 -name "libhsa-runtime64*.so*" -type f -delete 2>/dev/null || true

    find "$_site_packages" -maxdepth 1 -name "librocm_smi64*.so*" -type f -delete 2>/dev/null || true

  fi



  # 2) Fix any DT_NEEDED entries that still reference private libhsa-runtime64-*.so or librocm_smi64-*.so

  local f needed

  for f in $_binary_so "$_libs_dir"/*.so*; do

    [ -f "$f" ] || continue

    for needed in $(patchelf --print-needed "$f" 2>/dev/null || true); do

      case "$needed" in

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



  # 3) Ensure RPATH includes /usr/lib and /opt/rocm/lib

  for f in $_binary_so; do

    [ -f "$f" ] || continue

    local _current_rpath

    _current_rpath=$(patchelf --print-rpath "$f" 2>/dev/null || echo "")

    if [ -n "$_current_rpath" ]; then

      local _new_rpath="$_current_rpath"

      [[ "$_new_rpath" != *"/usr/lib"* ]] && _new_rpath="$_new_rpath:/usr/lib"

      [[ "$_new_rpath" != *"/opt/rocm/lib"* ]] && _new_rpath="$_new_rpath:/opt/rocm/lib"

      patchelf --set-rpath "$_new_rpath" "$f" 2>/dev/null || true

    else

      patchelf --set-rpath "/usr/lib:/opt/rocm/lib" "$f" 2>/dev/null || true

    fi

  done

}

