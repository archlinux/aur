# Maintainer:  Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=sile
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.9.5.1
pkgrel=4
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/releases/download/v${pkgver}/sile-${pkgver}.tar.bz2")
_lua_deps=('cosmo' 'expat' 'filesystem' 'lpeg' 'sec' 'zlib')
depends=('fontconfig' 'harfbuzz>=1.2.6' 'icu' "${_lua_deps[@]/#lua-}" 'ttf-gentium-plus')
checkdepends=('lua-busted')
sha512sums=('7d83e7737668471f637a59036abe029299148783f87e29e3dd2833d02038bf1aecdf6fc35e36569eaba2cc18f9049d49257a03af4fbab6bceea7898fcb8508d1')

prepare () {
	cd "$pkgname-$pkgver"
	sed -i -e 's/rm -f core/rm -f/' configure
}

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check () {
	cd "$pkgname-$pkgver"
    # make test
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"

	for file in README.md ROADMAP documentation/sile.pdf ; do
		install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
	done
	cp -ar examples "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
