# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributer: JP-Ellis <josh@jpellis.me>

pkgname=mivisionx
pkgver=5.2.1
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence libraries, utilities"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('rocm-core' 'rocm-cmake' 'miopengemm' 'miopen' 'protobuf' 'opencv' 'ffmpeg4.4' 'qt5-base')
makedepends=('cmake')
_git='https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('201996b31f59a8d5e4cc3f17d17a5b81158a34d2a1c833b65ccc3dceb21d176f')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.2/page/Appendix_A.html
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none -isystem /usr/include/ffmpeg4.4" \
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/mivisionx \
        -DBACKEND=HIP
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in mv_compile runvx; do
    ln -s "/opt/rocm/mivisionx/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
