# Maintainer: mortzu <mortzu@gmx.de>
pkgname="netctl-auto-tray"
pkgver=r22.99abf4d
pkgrel=1
pkgdesc="A lightweight netctl tray app with notifications (for netctl-auto)"
arch=('x86_64')
url="https://github.com/mortzu/netctl-tray"
license=('MIT')
makedepends=('cargo')
depends=('libnotify' 'qt5-base' 'polkit')
conflicts=('netctl-tray')
provides=('netctl-tray')
source=("${pkgname}::git+https://github.com/mortzu/netctl-tray.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray"
  install -Dm755 scripts/netctltray "${pkgdir}/etc/netctl/hooks/netctltray"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm755 scripts/netctltray "${pkgdir}/usr/share/netctl-tray/netctltray"
  install -Dm755 scripts/connect "${pkgdir}/usr/share/netctl-tray/connect"
  install -Dm755 scripts/disconnect "${pkgdir}/usr/share/netctl-tray/disconnect"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
  install -dm0750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -Dm0644 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctltray.rules"
}
