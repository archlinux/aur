pkgname="netctl-tray-auto-noping"
pkgver=0.2.3
pkgrel=1
pkgdesc="A lightweight netctl tray app with notifications (for netctl-auto, without ping)"
arch=('x86_64')
url="https://github.com/mortzu/netctl-tray"
license=('MIT')
makedepends=('rustup'
             'cmake')
depends=('qt5-base'
         'polkit')
conflicts=("netctl-tray" "netctl-tray-auto")
install=".install"
source=("netctl-tray-${pkgver}.tar.gz::https://github.com/mortzu/netctl-tray/archive/${pkgver}.tar.gz")
md5sums=('d2c5f2744cffeb450d0a82f58fb80a59')

build () {
  cd "$srcdir/netctl-tray-$pkgver"
  rustup toolchain install nightly
  rustup update
  RUSTUP_TOOLCHAIN=nightly \
    RUSTFLAGS="-Ctarget-cpu=native" cargo +nightly build --release --features "auto"
}

package() {
  cd "$srcdir/netctl-tray-$pkgver"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray-auto"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
  install -dm0750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -Dm0644 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctltray.rules"
}
