# Maintainer: Yunxiang Li <shironeko@waifu.club>

pkgname=system76-power-openrc
pkgver=1.1.5
pkgrel=2
pkgdesc="System76 Power Management - with OpenRC init"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install="${pkgname%-*}.install"
depends=(
'dbus'
'openrc'
'system76-dkms'
)
makedepends=('rust')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(
"https://github.com/pop-os/${pkgname%-*}/archive/${pkgver}.tar.gz"
'system76-power'
'use-mkinitcpio.patch'
)
sha256sums=(
'3e95ea9935f3c8efdb425d9993c56684b05c8eb9eb2d302b32b8301220f56be3'
'1479ddfdf1f6c477b1361c3ebe429bc0d5d32b5bc68e4c5addca0cb095519f93'
'6d59cb091858b65a0ad6682dda29ec1d970066f67a7b50430960989f6c428891'
)

prepare() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/use-mkinitcpio.patch
}

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  # Build and install base package
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  # Install daemons
  install -Dm755 target/release/system76-power "${pkgdir}/usr/bin/system76-power"

  # Install init files
  install -Dm755 "${srcdir}"/system76-power "${pkgdir}/etc/init.d/system76-power"

  # Install scripts and configuration
  install -Dm755 data/system76-power.conf "${pkgdir}/usr/share/dbus-1/system.d/system76-power.conf"
}
