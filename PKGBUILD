# Maintainer: Yunxiang Li <shironeko@waifu.club>

pkgname=system76-power-openrc
pkgver=1.1.6
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
'use-mkinitcpio.patch'
'system76-power'
)
sha256sums=(
'3b05850fe1f0af36cf8699bd7d13eea141b89d6fa386cb3997d79932daea82f6'
'6d59cb091858b65a0ad6682dda29ec1d970066f67a7b50430960989f6c428891'
'bf21e08d5be367d0bbff359877cf7ab36b5df2151aee760e5ce5b1cb001d2f1d'
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
