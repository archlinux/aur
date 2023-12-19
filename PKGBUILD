# Maintainer: Sir-Photch <sir-photch@posteo.me>

pkgname=notesock
pkgver=0.1.2
pkgrel=1
pkgdesc="Yet another terminal pastebin server"
arch=(any)
url="https://github.com/Sir-Photch/notesock"
license=(AGPL3)
makedepends=(git cargo)
optdepends=('nginx: reverse proxy')
install=notesock.install
backup=(etc/notesock/notesock.env)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Sir-Photch/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname.install"
	"sysusers-$pkgname.conf"
	"tmpfiles-$pkgname.conf"
)

sha256sums=('0e0caf6f083befe478780716f0527bc6b675cbd2e6bca10b0721fe3e0667a097'
            'd0a96a5ed09ff4f4495c51b95e5da6a7755f105b8b3f7ff9ec6f5038d1425f03'
            'e7be2fb5db531367a9c45363ed46bfee783a3be24e99ce3631c6627825e47c89'
            '509f304e8f912f31ed010a46fb3c542b37fa1327a176e066f3c9cab9d16439a0')

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
	
	install -Dm644 "nginx/example.conf" "$pkgdir/usr/share/doc/$pkgname/nginx-example.conf"
	install -Dm640 "systemd/$pkgname.env" "$pkgdir/etc/$pkgname/notesock.env"
	install -Dm644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
