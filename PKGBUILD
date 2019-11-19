# Maintainer: Jeremy Attali <jeremy.attali[at]gmail[dot]com>

pkgname=drevo-power-console-git
_pkgname=drevo-power-console
pkgver=9.ee15513
pkgrel=1
pkgdesc="The Drevo Power Console (DPC) for Linux"
arch=(x86_64)
url="https://www.drevo.net/dpc"
depends=(qt5-base libusb gcc-libs glibc libpng)
makedepends=(git make)
optdepends=('systemd: for custom udev rules for wheel group')
source=($pkgname::git+https://github.com/lanyu7/dpc_linux.git#branch=master
        77-drevo-usb-allow-wheel.rules
        ${_pkgname}.desktop
        ${_pkgname}.png)
sha256sums=('SKIP'
            '91441de4d41da914ed3420ec9dabd046b61aaacd79a6064eacda48b823ad7831'
            '80580a90cf0fdd37ad522b73d73de8d554149e6e54ec477e4af55e9070081d70'
            '452b2883243cd43ca5961889eeca0c98b2a2b5bf2321cb57b0d8950ddd4ea814')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd $pkgname
  qmake -makefile DrevoPowerConsole.pro
  make
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/udev/rules.d"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"

  install -m644 "${srcdir}/77-drevo-usb-allow-wheel.rules" "${pkgdir}/usr/lib/udev/rules.d/77-drevo-usb-allow-wheel.rules"
  install -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -m755 "${srcdir}/${pkgname}/DrevoPowerConsole" "${pkgdir}/usr/bin/${_pkgname}"
}
