# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray"
pkgver=0.3.0
pkgrel=1
pkgdesc="A lightweight netctl tray app with notifications"
arch=('x86_64')
url="https://github.com/DanielcoderX/netctl-tray"
license=('MIT')
makedepends=('rustup'
			 'cmake')
depends=('qt5-base'
     	 'polkit')
conflicts=("netctl-tray-auto")
install=".install"
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/DanielcoderX/netctl-tray/archive/v${pkgver}.tar.gz")
md5sums=('c9f341daa27b7fa9096a187d02fed2e8')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  rustup toolchain install nightly
  rustup update
  RUSTUP_TOOLCHAIN=nightly \
    RUSTFLAGS="-Ctarget-cpu=native" cargo +nightly build --release -j$(nproc)
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
  install -dm0750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -Dm0644 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctltray.rules"
}
