# Maintainer: Thai „RPGReki“ Chung <rpgreki@reki.wtf>
pkgname=obs-aitum-stream-suite
pkgver=1.2.5
pkgrel=2
pkgdesc="Plugin for OBS Studio to add Aitum"
url="https://aitum.tv/products/stream-suite"
license=('GPL-2.0')
arch=('x86_64')
depends=(
  'obs-studio'
)
makedepends=(
  'cmake'
)

source=("git+https://github.com/Aitum/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cmake -B pkg -S ${srcdir}/${pkgname} \
    -DBUILD_OUT_OF_TREE=On \
    -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cmake --build pkg
}

package() {
  DESTDIR="${pkgdir}" cmake --install pkg

  # Copy to OBS 33 locations, if needed
  [ -f ${pkgdir}/usr/lib/obs-modules/plugins/aitum-stream-suite.so ] && echo 'Plugin present at OBS 33+ Plugin Location; tell RPGReki to remove code'

  [ -d ${pkgdir}/usr/lib/obs-modules/plugins ] || mkdir -p ${pkgdir}/usr/lib/obs-modules/plugins
  [ -f ${pkgdir}/usr/lib/obs-modules/plugins/aitum-stream-suite.so ] || cp ${pkgdir}/usr/lib/obs-plugins/aitum-stream-suite.so ${pkgdir}/usr/lib/obs-modules/plugins/aitum-stream-suite.so
  [ -d ${pkgdir}/usr/share/obs/obs-modules/plugins ] || mkdir -p ${pkgdir}/usr/share/obs/obs-modules/plugins
  [ -d ${pkgdir}/usr/share/obs/obs-modules/plugins/aitum-stream-suite ] || cp -r ${pkgdir}/usr/share/obs/obs-plugins/aitum-stream-suite ${pkgdir}/usr/share/obs/obs-modules/plugins/
}
