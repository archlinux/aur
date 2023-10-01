# Maintainer: Sir-Photch <sir-photch@posteo.me>

pkgname=dab-rs
pkgver=0.3.1
pkgrel=1
pkgdesc="Announcement Bot for Discord, implemented in Rust"
arch=(any)
url="https://github.com/Sir-Photch/dab-rs"
license=(AGPL3)
depends=(
	opus
	ffmpeg
	postgresql
)
makedepends=(cargo)
install=dab-rs.install
backup=(etc/dab-rs/Settings.toml)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Sir-Photch/$pkgname/archive/v$pkgver.tar.gz"
	Settings.toml
	dab-rs.service
	dab-rs.install
	sysusers-dab-rs.conf
	tmpfiles-dab-rs.conf
)

sha512sums=('25afb03bb408ef25582005ac10ff500c281edff61f4a040a3fb5aa0fb0b606b05b7bb4aff85a39b66794170debb049538138c942a5c3e48cb5f1ba90226c7cd7'
            'fad6d2eae7f5e06afbe63bf41a62eee0327290355ffd5662f7472d6e737af627a3b738055b5dba51895b8bb71fbd1806f8d47c15461a01da3b1debaec734c50d'
            'db962f08a4d40dc4b5893590d5538ad9937a53681b85d51e15185a55106f2e2cfd6305aeeb1d72aaba4678119c7f917d20021dd4479ff35e677e3ff4d6ed44c6'
            'e0f8e4f6d6979e2b17b315dcad1b69025ed6b89398efb34069e6e76f6062e714e2f436bdc26a6e63d0a9dfe3b81931326bae1bef79b940c20b1843a15082c6e3'
            'c62743413f379c0d3e8b64a61d2abecba4e20348b7d3caecccb5cff13ca6c7b9bd06a45ca3126af29e92ac69f086878cf62ee684a49fdfc1b0c91a8cf7e2791d'
            '2907773134b7a5b097892bc0451bf52560c3de302cadfb91c7cd4c23afdf1f45f1f29d50451b0d5888d73ffc44d1f6801601861051aede092d57a02dba3a22c7')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
	
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r resources "$pkgdir/usr/share/$pkgname"

	install -Dm640 "$srcdir/Settings.toml" "$pkgdir/etc/$pkgname/Settings.toml"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
