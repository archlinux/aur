# Maintainer: Sir-Photch <sir-photch@posteo.me>

pkgname=dab-rs
pkgver=0.3.0
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

sha512sums=('1ea5bd1ae2ea74d859045b3801372e6ca18dd9c9a40ee10e29d55f2870bfc333dfbda79c2fc68aa37cc09c0d767563a837427de28caf338d719853f11754b018'
            'fad6d2eae7f5e06afbe63bf41a62eee0327290355ffd5662f7472d6e737af627a3b738055b5dba51895b8bb71fbd1806f8d47c15461a01da3b1debaec734c50d'
            'db962f08a4d40dc4b5893590d5538ad9937a53681b85d51e15185a55106f2e2cfd6305aeeb1d72aaba4678119c7f917d20021dd4479ff35e677e3ff4d6ed44c6'
            'a11cbcadb260a16ad4b4b269c753c208fe2c143f7d6930427a072c59042298bf88c251fce2391270fcee0725d834427606f6e16742746b3754cdf35ae44dfa05'
            'c62743413f379c0d3e8b64a61d2abecba4e20348b7d3caecccb5cff13ca6c7b9bd06a45ca3126af29e92ac69f086878cf62ee684a49fdfc1b0c91a8cf7e2791d'
            '2736f6d2a07c345f65a8df770b4ff72857b239b3f219d495adbef63f6ffd910d633e7e31e0f2b2cc427bb1c473851b9e782b9bb88943041ecef6fae0960c5cb4')

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
