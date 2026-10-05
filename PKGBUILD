# Maintainer: lucas <lucaszhou007@163.com>
pkgname=llama-prism-rocm-bin
pkgver=b10754
_commit=2459f68
_rocmver=7.2
pkgrel=1
pkgdesc="llama.cpp Prism fork - LLM inference in C/C++ (prebuilt ROCm / HIP binaries for AMD GPUs)"
arch=('x86_64')
url="https://github.com/PrismML-Eng/llama.cpp"
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'openssl'
  'hip-runtime-amd'
  'rocblas'
  'hipblas'
)
optdepends=(
  'rocm-smi-lib: query GPU status while running'
)
makedepends=('patchelf')
provides=('llama-cpp')
conflicts=('llama-cpp' 'llama-cpp-rocm-git' 'llama-prism-cuda')
options=('!strip' '!debug')

_asset="llama-prism-${pkgver}-${_commit}-bin-ubuntu-rocm-${_rocmver}-x64.tar.gz"
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/prism-${pkgver}-${_commit}/${_asset}")
sha256sums=('7a4fd4978340101d15eb0f8351563d52302fbb5c3bb112eb5f25fe66666a02f3')

package() {
  local _srcdir="$srcdir/llama-prism-${pkgver}-${_commit}"
  local _libdir="/usr/lib/${pkgname}"

  # The upstream binaries are built with DT_RUNPATH=$ORIGIN and load their
  # private shared libraries from the directory they live in, so install the
  # whole payload into a private libdir and expose launchers via symlinks.
  install -d "$pkgdir$_libdir"
  cp -a "$_srcdir"/. "$pkgdir$_libdir"/

  # Upstream hardcodes /opt/rocm-7.2.1/lib in libggml-hip.so's RUNPATH, a path
  # that does not exist on Arch (ROCm is found via ld.so.conf), so reduce it to
  # $ORIGIN to drop the insecure absolute path.
  patchelf --set-rpath '$ORIGIN' "$pkgdir$_libdir/libggml-hip.so"

  # Drop the bundled license file from the runtime dir and install it properly.
  rm -f "$pkgdir$_libdir/LICENSE"
  install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # Symlink every executable (not the shared objects) into /usr/bin.
  install -d "$pkgdir/usr/bin"
  local _exe
  while IFS= read -r -d '' _exe; do
    ln -s "$_libdir/$(basename "$_exe")" "$pkgdir/usr/bin/$(basename "$_exe")"
  done < <(find "$pkgdir$_libdir" -maxdepth 1 -type f -executable ! -name '*.so' ! -name '*.so.*' -print0)
}
