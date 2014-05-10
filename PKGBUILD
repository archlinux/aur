# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: winlu

pkgname=shairplay
_gitname=shairplay
pkgver=20140422
pkgrel=2
pkgdesc='Apple airplay and raop protocol server'
arch=('i686' 'x86_64')
url='https://github.com/juhovh/shairplay'
license=('custom')
depends=('libao')
optdepends=('avahi: to run the server')
makedepends=('git')
source=("$_gitname::git://github.com/juhovh/shairplay.git#commit=64d59e3087f829006d091fa0d114efb50972a2bf"
	'shairplay.service')
sha256sums=('SKIP'
	'f0a176539a6c5be46dc832d054be2f18c3256e5fd34c5f1416c9463bd75c82b3')
options=(!libtool)

build() {
	cd $_gitname

	# installing airport.key to /etc/shairplay/
	sed 's/airport.key/\/etc\/shairplay\/airport.key/' -i "$srcdir/$_gitname"/src/shairplay.c

	./autogen.sh
	./configure --prefix=/usr/
	make
}


package() {
	cd $_gitname
	make DESTDIR="$pkgdir" install

	# install systemd service file
	install -Dm644 "$srcdir/shairplay.service" "$pkgdir/usr/lib/systemd/system/shairplay.service"

	# install key file
	install -Dm644 airport.key "$pkgdir/etc/shairplay/airport.key"

	# install license file
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# install documentation
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
