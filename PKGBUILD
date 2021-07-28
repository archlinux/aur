# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=stag-git
pkgver=v1.0.r1.g0a158e7
pkgrel=1
pkgdesc="A public domain ncurses based audio file tagger"
arch=('i686' 'x86_64')
url="https://github.com/smabie/stag"
license=('custom')
depends=('ncurses' 'taglib')
makedepends=('git')
conflicts=('stag')
source=(git+https://github.com/smabie/stag)
sha256sums=('SKIP')

pkgver() {
	cd stag
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd stag
	sed -n '/Released into the public domain/p' README > LICENSE
	export CFLAGS="$CFLAGS -ansi -pedantic -Wall -D_DEFAULT_SOURCE"
	export LDFLAGS="${LDFLAGS/--as-needed,/} -L/usr/lib `taglib-config --libs` -ltag_c -lstdc++"
	export CPPFLAGS="-I/usr/include `taglib-config --cflags`"
	make
}

package() {
	cd stag
	install -Dm755 stag "$pkgdir"/usr/bin/stag
	install -Dm644 stag.1 "$pkgdir"/usr/share/man/man1/stag.1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/stag/LICENSE
}
