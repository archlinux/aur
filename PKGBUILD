# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=system76-power
pkgver=1.1.18
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
source=(
"https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
'use-mkinitcpio.patch'
'makefile.patch'
'rust-toolchain'
)
sha256sums=('7a6b8b18b28948808b3c51f732c42e72797f8eddd79fa57f4285689087d781cd'
            '2ead269c71919c220a7880b0036c6d62aadeae3d6cde769029784d3565686539'
            '97deb1f9cf6a312e8378bb96a4a83dae2498a4936c130e2ef5b125d13b92bb65'
            'f6a0b9759d1af128dd09bb3f49812c052c89168e7b159e6d269036a2faba3260')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/use-mkinitcpio.patch
  # fix makefile
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/makefile.patch

  cp "${srcdir}"/rust-toolchain .
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make sysconfdir="/usr/lib" DESTDIR="${pkgdir}" install
}
