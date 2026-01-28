pkgname=marmot
pkgver=2.8.0
pkgrel=1
pkgdesc="A distributed SQLite server with MySQL wire compatible interface"
arch=(any)
url="https://github.com/maxpert/marmot"
license=(MIT)
makedepends=('go' 'toml-cli')
backup=('etc/marmot/config.toml')
source=("https://github.com/maxpert/marmot/archive/refs/tags/v$pkgver.tar.gz"
	"marmot.service")

sha256sums=('54b2529996706653b3059933f948c99a2d05195a4261b8c957134acf289ac462'
            '87ef91c653307f985d160c2047b1f64f39eaf654635f75b623455fd27de5ee56')

build() {
	cd $srcdir/$pkgname-$pkgver
	GOOS=linux CGO_ENABLED=1 go build -tags sqlite_preupdate_hook -o dist/$pkgname
}

package() {
	toml-cli set $srcdir/$pkgname-$pkgver/config.toml data_dir /var/lib/marmot > $srcdir/config.toml
	install -o root -g root -m755 -D $srcdir/$pkgname-$pkgver/dist/$pkgname $pkgdir/usr/bin/$pkgname
	install -o root -g root -m644 -D $srcdir/config.toml $pkgdir/etc/$pkgname/config.toml
	install -o root -g root -m644 -D $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -o nobody -g nobody -m755 -d $pkgdir/var/lib/marmot $pkgdir/var/log/marmot
}
