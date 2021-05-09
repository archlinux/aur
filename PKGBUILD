# Maintainer: Dan Johansen <strit83 at gmail dot com>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname=opentracker
pkgver=2021.05.09
pkgrel=1
_libowfat=0.31
pkgdesc="A free and open torrent tracker"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://erdgeist.org/arts/software/opentracker/"
license=('Beerware')
backup=('etc/opentracker/opentracker.conf')
makedepends=('git')
install="$pkgname.install"
source=('git://erdgeist.org/opentracker'
		"https://www.fefe.de/libowfat/libowfat-$_libowfat.tar.xz"
        "opentracker.service")
md5sums=('SKIP'
         '120798fab86cfd72dc6b12284d248dd0'
         'a50d9ccbcf820cff15d082e9bc447bf1')

pkgver() {
  cd "$srcdir/opentracker"
  git log -n 1 --pretty=format:"%cd" --date=short | sed "s/-/./g"
}

build() {
	# We build libowfat ourselves (0.32 does not work yet either), since the libowfat AUR package does not work for this
	ln -sf libowfat-$_libowfat libowfat
	cd libowfat
	make
	cd ..
	cd opentracker
	make

}

package() {
	install -Dm755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm755 $srcdir/$pkgname/$pkgname.conf.sample $pkgdir/etc/$pkgname/$pkgname.conf
	install -Dm0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
