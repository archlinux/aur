# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
pkgname="byedpi"
pkgver=0.12
pkgrel=1
# epoch=
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=('x86_64')
url="https://github.com/hufrea/byedpi"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("byedpi-conf.d"
        "byedpi.service"
        "${url}/raw/main/LICENSE"
        "${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3dae0ba370e2b37192676e20d6dfe027'
         '1a858d0bb64fa7d58e9afad9b8e68bec'
         '20705d22c5efeef4fb304664c0e1b799'
         '7f9d1d02664f052059f5526c41bd7b72')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LDFLAGS="-Wl,-z,relro,-z,now"
  make all
}

package() {
  cd "${srcdir}"
  install -Dm 644 byedpi-conf.d "${pkgdir}/etc/conf.d/byedpi"
  install -Dm 644 byedpi.service "${pkgdir}/usr/lib/systemd/system/byedpi.service"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 ciadpi "${pkgdir}/usr/bin/ciadpi"
}
