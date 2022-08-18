# Contributor: Sean Haugh <seanphaugh@gmail.com>
# Contributor: Frank Lenormand <lenormf@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=dvtm
_owner=wurosh
pkgname=dvtm-git
pkgver=0.15.67.g1cee8c3
pkgrel=1
pkgdesc='Dynamic virtual terminal manager'
arch=('i686' 'x86_64')
url="https://github.com/$_owner/$_pkgname"
license=('MIT')
depends=('sh')
makedepends=('git')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=('dvtm')
source=("git+https://github.com/$_owner/$_pkgname")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//; s/-/./g'
}

prepare() {
	cd "$_pkgname"
	[[ -e "$srcdir/config.h" ]] && cp "$srcdir/config.h" .

	sed -i"" 's/CFLAGS =/CFLAGS +=/' config.mk
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	msg "Removing /usr/share/terminfo for compatibility with ncurses..."
	rm -rv "$pkgdir/usr/share/terminfo"
}
# vim: set ts=2 sw=2 noet:
