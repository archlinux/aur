# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray"
pkgver=0.1.4
pkgrel=1
pkgdesc="A lightweight netctl tray app with notifications"
arch=('any')
url="https://github.com/PonasKovas/netctl-tray"
license=('MIT')
makedepends=('cargo')
depends=('libnotify'
		 'qt5-base'
     'polkit')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PonasKovas/netctl-tray/archive/${pkgver}.tar.gz")
md5sums=('2f5e9409484bb474fdbe5ff691b1c603')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray"
  install -Dm755 scripts/netctltray "${pkgdir}/etc/netctl/hooks/netctltray"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm755 scripts/netctltray "${pkgdir}/usr/share/netctl-tray/netctltray"
  install -Dm755 scripts/connect "${pkgdir}/usr/share/netctl-tray/connect"
  install -Dm755 scripts/disconnect "${pkgdir}/usr/share/netctl-tray/disconnect"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
  install -Dm750 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctl-tray.rules"
}