# Maintainer: Saren Arterius <saren@wtako.net>
# Upstream maintainer: Dmytro Kostiuchenko <edio@archlinux.us>
# Upstream Contributor: Gilrain <pierre.buard+aur gmail com>

pkgname=prismatik-psieg-git
pkgver=5.11.2.9.r0.g0951be3
pkgrel=1
pkgdesc="A controller for usb driven LED backlights. An unofficial fork."
arch=('i686' 'x86_64')
url="https://github.com/psieg/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'libxkbcommon-x11')
makedepends=('git' 'libusb' 'pkg-config' 'qt5-base')
provides=('lightpack' 'prismatik')
conflicts=('prismatik' 'prismatik-git')
install='prismatik.install'
source=('git://github.com/psieg/Lightpack.git')
sha256sums=('SKIP')

pkgver() {
  cd Lightpack
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd Lightpack/Software
  mv res/translations/ru_RU.ts res/translations/ru_RU.qm
  mv res/translations/uk_UA.ts res/translations/uk_UA.qm
  qmake-qt5 -recursive
  make
}

check() {
  cd Lightpack/Software
  make check
}

package() {
  cd Lightpack
  install -Dm755 "Software/bin/Prismatik" "${pkgdir}/usr/bin/prismatik"
  install -Dm644 "Software/dist_linux/deb/etc/udev/rules.d/93-lightpack.rules" "${pkgdir}/etc/udev/rules.d/93-lightpack.rules"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/prismatik/README.md"
  install -Dm644 "Software/CHANGELOG" "${pkgdir}/usr/share/doc/prismatik/CHANGELOG"
}
