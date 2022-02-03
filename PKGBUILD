# Maintainer: MGislv <mgislv at ceppo.xyz>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=stag-git
pkgver=v1.0.r1.g0a158e7
pkgrel=2
pkgdesc='Ncurses based audio file tagger'
arch=('i686' 'x86_64')
url='https://github.com/smabie/stag'
license=('custom')
depends=('ncurses' 'taglib')
makedepends=('git')
conflicts=('stag')
source=("git+$url.git"
        'libs.patch')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd stag
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd stag
	patch --forward --strip=1 --input="$srcdir"/libs.patch
}

build() {
	cd stag
	sed -n '/Released into the public domain/p' README > LICENSE
	export LDFLAGS="${LDFLAGS/--as-needed,/}"
	make
}

package() {
	cd stag
	install -Dm755 stag "$pkgdir/usr/bin/stag"
	install -Dm644 stag.1 "$pkgdir/usr/share/man/man1/stag.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
