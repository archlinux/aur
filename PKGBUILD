# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

_pkgname=system76
_pkgbase=system76-power
pkgname=system76-power
pkgver=1.0.1
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install="${pkgname}.install"
depends=(
  'dbus'
  'systemd'
  'system76-dkms'
)
makedepends=('rust')
source=(
"https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
'use-mkinitcpio.patch'
)
sha1sums=(
'f2e361bf8c42d2453c3c61ddf3c6c7b929dbc4ea'
'39969f4afb7bc50c4545f44a79529a62ebb37ef2'
)

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i ${srcdir}/use-mkinitcpio.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Build and install base package
  cargo build --release
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Install daemons
  install -Dm755 target/release/system76-power ${pkgdir}/usr/bin/system76-power

  # Install systemd unit files
  install -Dm644 debian/system76-power.service ${pkgdir}/usr/lib/systemd/system/system76-power.service

  # Install scripts and configuration
  install -Dm755 data/system76-power.conf ${pkgdir}/usr/share/dbus-1/system.d/system76-power.conf
}
