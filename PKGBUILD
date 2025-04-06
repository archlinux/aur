# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=notesock
pkgver=1.0.0
pkgrel=1
pkgdesc="Yet another terminal pastebin server"
arch=(any)
url="https://git.sr.ht/~shtrophic/notesock"
license=(AGPL-3.0-or-later)
makedepends=(cargo)
optdepends=('nginx: reverse proxy')
install=notesock.install
backup=(etc/notesock/notesock.env)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
	"$pkgname.install"
	"sysusers-$pkgname.conf"
	"tmpfiles-$pkgname.conf"
)

sha256sums=('a07e9e1401c9857a679296561fe109d5a7d84985f3b072cdf2f1f3f00f5831cb'
            'SKIP'
            'd0a96a5ed09ff4f4495c51b95e5da6a7755f105b8b3f7ff9ec6f5038d1425f03'
            'e7be2fb5db531367a9c45363ed46bfee783a3be24e99ce3631c6627825e47c89'
            '509f304e8f912f31ed010a46fb3c542b37fa1327a176e066f3c9cab9d16439a0')

validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
    	cd "$pkgname-$pkgver"

    	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	
	install -Dm644 "contrib/nginx-example.conf" "$pkgdir/usr/share/doc/$pkgname/nginx-example.conf"
	install -Dm644 "contrib/fail2ban-example.conf" "$pkgdir/usr/share/doc/$pkgname/fail2ban-example.conf"
	install -Dm640 "contrib/systemd-example.env" "$pkgdir/etc/$pkgname/notesock.env"
	install -Dm644 "contrib/systemd-example.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
