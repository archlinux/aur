# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=lamax-instakid-printer-git
_pkgname=lamax-instakid-printer
pkgver=r4.dae8429
pkgrel=1
pkgdesc="CUPS driver and CLI for the thermal printer of the LAMAX InstaKid2 Plus camera (Bluetooth LE)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/jose1711/lamax-instakid-printer"
license=('MIT')
depends=('bluez' 'cups' 'cups-filters' 'ghostscript' 'python' 'python-bleak'
         'python-dbus-fast' 'python-pillow')
makedepends=('git' 'cups')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make CFLAGS="${CFLAGS} ${LDFLAGS}"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm755 instakid_print.py "${pkgdir}/usr/bin/instakid-print"
  install -Dm644 docs/protocol.md "${pkgdir}/usr/share/doc/${_pkgname}/protocol.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 examples/test.png "${pkgdir}/usr/share/doc/${_pkgname}/test.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
