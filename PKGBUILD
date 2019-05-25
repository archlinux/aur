# Maintainer:  Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.5.1'
_libtexpdf_ver='50f0d788c358eb6e1953185f91817f885dc19649'
pkgrel='2'
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license=('MIT')
source=("https://github.com/simoncozens/sile/archive/v$pkgver.tar.gz"
	    "https://github.com/simoncozens/libtexpdf/archive/$_libtexpdf_ver.tar.gz")
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
sha512sums=('b716a880aa610977d54a8086aac8e31e1b17e16a315e460efd0b732c4f4c82bb6cc616c485f0abd18e446317708c3349c69be0f2be19ae8cbe3321630c9c37c4'
            '4dd2df1ff4027634f8c5e4ccbfb661229c0f6bf7e4f8e739dcb737f0af0d30570d92321781ab34e61a2f660c225715e569506b825a83744c244dfe9a956c8727')

prepare () {
	cd "$pkgname-$pkgver"
	rm -rf libtexpdf
	cp -a ../libtexpdf-"$_libtexpdf_ver" libtexpdf
	autoreconf --install
	(cd libtexpdf && autoreconf -I m4)
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
