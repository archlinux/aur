# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx
pkgver=1.7.0
pkgrel=1
pkgdesc='VP8 and VP9 codec'
arch=('x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('lib32-gcc-libs' 'libvpx')
makedepends=('git' 'yasm')
provides=('libvpx.so')
source=("libvpx-${pkgver}.tar.gz::https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz")
sha256sums=('1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238')

build() {
  cd libvpx-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --target='x86-linux-gcc' \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-pic \
    --disable-install-{bins,docs,srcs} \
    --enable-vp8 \
    --enable-postproc \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-experimental \
    --enable-spatial-svc
  make
}

package() {
  cd libvpx-${pkgver}

  make DIST_DIR="${pkgdir}/usr" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libvpx "${pkgdir}"/usr/share/licenses/lib32-libvpx
}

# vim: ts=2 sw=2 et:
