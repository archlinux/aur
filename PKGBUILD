# Maintainer:  Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.5.1'
pkgrel='3'
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/releases/download/v${pkgver}/sile-${pkgver}.tar.bz2")
depends=('fontconfig'
         'harfbuzz>=1.2.6'
         'icu'
         'lua-cosmo'
         'lua-expat'
         'lua-filesystem'
         'lua-lpeg'
         'lua-penlight'
         'lua-socket'
         'lua-sec'
         'lua-zlib'
         'ttf-gentium-plus')
sha512sums=('7d83e7737668471f637a59036abe029299148783f87e29e3dd2833d02038bf1aecdf6fc35e36569eaba2cc18f9049d49257a03af4fbab6bceea7898fcb8508d1')

prepare () {
	cd "$pkgname-$pkgver"
	sed 's/rm -f core/rm -f/' -i configure
}

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"

	# Documentation and examples
	for file in README.md ROADMAP documentation/sile.pdf ; do
		install -Dm644 "$file" \
			"$pkgdir/usr/share/doc/$pkgname/$file"
	done
	cp -ar examples "$pkgdir/usr/share/doc/$pkgname"

	# License
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
