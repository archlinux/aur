pkgname=marmot
pkgver=2.9.10
_pkgver=2.9.10-beta
pkgrel=1
pkgdesc="A distributed SQLite server with MySQL wire compatible interface"
arch=(any)
url="https://github.com/maxpert/marmot"
license=(MIT)
makedepends=('go' 'toml-cli')
backup=('etc/marmot/config.toml')
source=("https://github.com/maxpert/marmot/archive/refs/tags/v$_pkgver.tar.gz"
	"marmot.service")

sha256sums=('86fa8e63a22946848b5215f538ed562d4869d4200b0c628cf8d2ac54164786ba'
            '87ef91c653307f985d160c2047b1f64f39eaf654635f75b623455fd27de5ee56')

build() {
	cd $srcdir/$pkgname-$_pkgver
	GOOS=linux CGO_ENABLED=1 go build -tags sqlite_preupdate_hook -o dist/$pkgname
}

package() {
	toml-cli set $srcdir/$pkgname-$_pkgver/config.toml data_dir /var/lib/marmot > $srcdir/config.toml
	install -o root -g root -m755 -D $srcdir/$pkgname-$_pkgver/dist/$pkgname $pkgdir/usr/bin/$pkgname
	install -o root -g root -m644 -D $srcdir/config.toml $pkgdir/etc/$pkgname/config.toml
	install -o root -g root -m644 -D $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -o nobody -g nobody -m755 -d $pkgdir/var/lib/marmot $pkgdir/var/log/marmot
}
