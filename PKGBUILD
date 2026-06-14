pkgname=mollysocket
pkgdesc='MollySocket allows getting Signal notifications via UnifiedPush.'
url="https://github.com/mollyim/mollysocket"
license=("AGPL-3.0")
arch=(x86_64 aarch64)
pkgver=1.7.1
pkgrel=1
makedepends=(cargo clang toml-cli)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	"$pkgname.service")
sha256sums=('b380faf8ca526e92bcbc121d8ac35b88945a6f62b4602dea0df6f7c1f6bfaac7'
            'f6d64321c1031956e30f9fca51512f04aa8b40cbe56b2c5333793d505bde7185')
options=(!lto !debug)
backup=("etc/mollysocket/config.toml")

function prepare() {
	cd $srcdir/$pkgname-$pkgver
	cargo fetch --locked
}

function build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --frozen --release --locked
}

function package() {
	toml-cli set $srcdir/$pkgname-$pkgver/config-sample.toml db /var/lib/mollysocket/mollysocket.db > $srcdir/config.toml
	install -o root -g root -m755 -D $srcdir/$pkgname-$pkgver/target/release/$pkgname $pkgdir/usr/bin/$pkgname
	install -o root -g root -m644 -D $srcdir/config.toml $pkgdir/etc/$pkgname/config.toml
	install -o root -g root -m644 -D $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
        # install -o root -g root -m644 -D $srcdir/$pkgname-$pkgver/$pkgname-vapid.service $pkgdir/usr/lib/systemd/system/$pkgname-vapid.service
}
