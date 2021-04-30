# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=system76-power
pkgver=1.1.16
pkgrel=3
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install="${pkgname}.install"
depends=(
'dbus'
'libusb'
'polkit'
'systemd'
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
)
sha256sums=(
'56b33e6d41dd07892b73aca8d1da32a552bf644e986c657abbddd83e2071ea79'
'6d59cb091858b65a0ad6682dda29ec1d970066f67a7b50430960989f6c428891'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/use-mkinitcpio.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Build and install base package
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install daemons
  install -Dm755 target/release/system76-power "${pkgdir}/usr/bin/system76-power"

  # Install systemd unit files
  install -Dm644 debian/system76-power.service "${pkgdir}/usr/lib/systemd/system/system76-power.service"

  # Install scripts and configuration
  install -Dm644 data/system76-power.conf "${pkgdir}/usr/share/dbus-1/system.d/system76-power.conf"
  install -Dm644 data/com.system76.powerdaemon.policy "${pkgdir}/usr/share/polkit-1/actions/com.system76.powerdaemon.policy"
}
