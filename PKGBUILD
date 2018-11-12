# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Michal Donat <donny579@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libvpx-1.7
pkgver=1.7.0
pkgrel=1
pkgdesc='VP8 and VP9 codec'
arch=('x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('glibc' 'gcc-libs')
makedepends=('yasm' 'git')
conflicts=('libvpx=1.7')
provides=('libvpx=1.7')
source=("libvpx-${pkgver}.tar.gz::https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz")
sha256sums=('1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238')

build() {
  cd libvpx-${pkgver}

  ./configure \
    --prefix='/usr' \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-pic \
    --disable-install-docs \
    --disable-install-srcs \
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

  mkdir -p "${pkgdir}"/opt/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/lib

  make DIST_DIR="${pkgdir}"/opt/"${pkgname}" install

  ln -rs "${pkgdir}"/opt/"${pkgname}"/lib/libvpx.so.5 "${pkgdir}"/usr/lib/libvpx.so.5
  ln -rs "${pkgdir}"/usr/lib/libvpx.so.5 "${pkgdir}"/usr/lib/libvpx.so.5.0
  ln -rs "${pkgdir}"/usr/lib/libvpx.so.5 "${pkgdir}"/usr/lib/libvpx.so.5.0.0

  install -Dm 644 LICENSE -t "${pkgdir}"/opt/${pkgname}/licenses/libvpx-1.7/
}
