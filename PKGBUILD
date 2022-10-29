# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributer: JP-Ellis <josh@jpellis.me>

pkgname=mivisionx
pkgver=5.3.0
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence libraries, utilities"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('miopen-hip' 'migraphx' 'protobuf' 'opencv' 'ffmpeg4.4' 'qt5-base')
makedepends=('rocm-cmake')
_git='https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('58e68f1c78bbe5694e42bf61be177f9e94bfd3e0c113ec6284493c8684836c58')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.3/page/Appendix_A.html
  ROCM_PATH=/opt/rocm \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none -isystem /usr/include/ffmpeg4.4" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DCMAKE_PREFIX_PATH=/opt/rocm \
    -DBACKEND=HIP
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
