# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lms
pkgver=3.27.0
pkgrel=1
pkgdesc='Lightweight Music Server. Access your self-hosted music using a web interface'
arch=('x86_64')
url='https://github.com/epoupon/lms'
install=lms.install
license=('GPL3')
depends=('ffmpeg'
         'libconfig'
         'taglib'
         'wt')
makedepends=('cmake' 
             'wt'
             'boost'
             'graphicsmagick')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/epoupon/lms/archive/v${pkgver}.tar.gz"
        "0001-fix-missing-includes.patch")
sha256sums=('98be611c05cb2a034c38623d1b739ea3e34760da04be8b0b3ba7e0fbb3baedc1'
            '5a8a64753158fdf0f38f177e14f7df76f2260fa61ca633542c8effb4d398a91a')

prepare() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  patch -s -p1 < "${srcdir}"/0001-fix-missing-includes.patch
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make 
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}/usr/share/lms/lms.conf" -t "${pkgdir}/etc/"
  install -Dm644 "${pkgdir}/usr/share/lms/default.service" "${pkgdir}/usr/lib/systemd/system/lms.service"  
}
# vim:set ts=2 sw=2 et:
