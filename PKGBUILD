# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=system76-power
pkgver=1.1.23
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install="${pkgname}.install"
depends=(
'dbus'
'libusb'
'polkit'
)
optdepends=(
'system76-acpi-dkms: some systems might need this driver'
'system76-dkms: some systems might need this driver'
'system76-io-dkms: some systems might need this driver'
)
makedepends=('rust')
options=('!lto') # see https://aur.archlinux.org/packages/system76-power#comment-846879
source=(
"https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
'use-mkinitcpio.patch'
)
sha256sums=('3b172029a561670c62f82ecbf4c49be339380c0380931d06e47722428f4c9804'
            'a6f45126461f22b47ac9671280e2cf2fbd52e389642d8dd865844bf2b7d43715')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/use-mkinitcpio.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make sysconfdir="/usr/lib" DESTDIR="${pkgdir}" install
}
