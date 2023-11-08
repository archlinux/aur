# Maintainer: nezu <nezu@nezu.cc>
pkgname=aero2solver
pkgver="0.2.0"
pkgrel=1
pkgdesc="Solve Aero2 captchas automatically using the magic of machine learning and computer vision"
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dumbasPL/aero2solver"
license=('MIT')
makedepends=('cargo' 'cmake' 'clang')
provides=('aero2solver')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.service"
	"$pkgname.sysusers"
)
sha256sums=('0bac09f6ebe91c09afd1d047c8bdcd6296a4d0ef37ca8b1b2567d540ec597c4c'
            '04e89d56ab4cd3eaf1271c829b562606bfd57b63d0346b2773266cb5c0c1eca6'
            '4a39fe28d2dccb6defecbd38331269ca124b73553d420b101a0d8443db77b94b')

build() {
	cd "$pkgname-$pkgver"
	MODEL_PATH=/usr/share/$pkgname/model cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "model/captcha.cfg" "$pkgdir/usr/share/$pkgname/model/captcha.cfg"
	install -Dm644 "model/captcha.names" "$pkgdir/usr/share/$pkgname/model/captcha.names"
	install -Dm644 "model/captcha.weights" "$pkgdir/usr/share/$pkgname/model/captcha.weights"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
