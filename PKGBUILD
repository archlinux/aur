pkgname=marmot
pkgver=2.9.12
pkgrel=2
pkgdesc="A distributed SQLite server with MySQL wire compatible interface"
arch=(any)
url="https://github.com/maxpert/marmot"
license=(MIT)
makedepends=('go' 'toml-cli')
backup=('etc/marmot/config.toml')
source=("https://github.com/maxpert/marmot/archive/refs/tags/v${pkgver}-beta.tar.gz"
	"marmot.service")

sha256sums=('a8e281a58727433b0ca6c49ae8b790b8a31bb17da2f8f099ae29b6b6ae6b8f6b'
            '87ef91c653307f985d160c2047b1f64f39eaf654635f75b623455fd27de5ee56')

build() {
	cd $srcdir/$pkgname-${pkgver}-beta
	GOOS=linux CGO_ENABLED=1 go build -tags sqlite_preupdate_hook -o dist/$pkgname
}

package() {
	toml-cli set $srcdir/$pkgname-${pkgver}-beta/config.toml data_dir /var/lib/marmot > $srcdir/config.toml
	install -o root -g root -m755 -D $srcdir/$pkgname-${pkgver}-beta/dist/$pkgname $pkgdir/usr/bin/$pkgname
	install -o root -g root -m644 -D $srcdir/config.toml $pkgdir/etc/$pkgname/config.toml
	install -o root -g root -m644 -D $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
