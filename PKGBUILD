# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=game-devices-udev
pkgver=1.0
pkgrel=0.1
pkgdesc="Udev rules for controllers"
url='https://codeberg.org/fabiscafe/game-devices-udev'
arch=('any')
license=('MIT')
depends=('udev')
makedepends=(
  'git'
  'meson'
)
provides=('nintendo-udev')
install="install"
source=("git+${url}.git?signed#tag=$pkgver"
        "uinput.conf")
b2sums=('73ad6a33feb1199bac8d13b35d338039c13b4cb0948fcbb405e2fe5c4ddeaa3bda5030937beecd6bee0c8faceeb696975910e4c21d05d2308a8707b414825353'
        '4f298ba1d1fdc19f5b90ea8d9292be9a44c85567995ea14136e401d39ce3c159b43be50f0043d1f10bed6892d24d8f7a6bf04f5a448ee2044f43b07c4c66cee0')

validpgpkeys=(6E58E886A8E07538A2485FAED6A4F386B4881229) #Fabian Bornschein <fabiscafe-at-mailbox-dot-org>

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
    # start uinput at boot
    install -Dm 644 "${srcdir}/uinput.conf" \
        "${pkgdir}/usr/lib/modules-load.d/uinput.conf"

    # install license
    install -Dm 644 "${srcdir}/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install udev rules
    meson install -C build --destdir "$pkgdir"
}
