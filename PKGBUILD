# Maintainer: Michal Donat <donny579@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libvpx-1.6
pkgver=1.6.1
pkgrel=3
pkgdesc='VP8 and VP9 codec'
arch=('x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('glibc' 'gcc-libs')
makedepends=('yasm' 'git')
conflicts=('libvpx=1.6')
provides=('libvpx=1.6')
source=("libvpx-${pkgver}.tar.gz::https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz")
sha256sums=('cda8bb6f0e4848c018177d3a576fa83ed96d762554d7010fe4cfb9d70c22e588')

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

  ln -rs "${pkgdir}"/opt/"${pkgname}"/lib/libvpx.so.4 "${pkgdir}"/usr/lib/libvpx.so.4
  ln -rs "${pkgdir}"/usr/lib/libvpx.so.4 "${pkgdir}"/usr/lib/libvpx.so.4.1
  ln -rs "${pkgdir}"/usr/lib/libvpx.so.4 "${pkgdir}"/usr/lib/libvpx.so.4.1.0

  install -Dm 644 LICENSE -t "${pkgdir}"/opt/${pkgname}/licenses/libvpx-1.6/
}
