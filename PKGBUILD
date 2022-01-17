# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=pdfalto
pkgver=0.4
pkgrel=1
pkgdesc='PDF to XML ALTO file converter'
arch=('x86_64')
url='https://github.com/kermitt2/pdfalto'
license=('GPL2')
depends=('libtiff' 'freetype2' 'icu' 'libpng14' 'libxml2' 'zlib')
makedepends=('cmake')
source=("git+https://github.com/kermitt2/${pkgname}.git#tag=${pkgver}"
        "pdfalto-use-system-libs.patch")
md5sums=('SKIP'
         '6d1ef0ea61e4ec3f65bca9c5a78fa62f')

prepare()
{
	cd "$srcdir"/$pkgname

	# external references to subproject should not point to clone URLs which
	# force the user to log in
	sed -i 's|git@github.com:kermitt2|https://github.com/kermitt2|' .gitmodules
	git submodule init
	git submodule update
	
	# Do NOT inject local includes and static libraries!
	patch -Np1 -i "$srcdir/pdfalto-use-system-libs.patch"
	rm -rf "$srcdir/pdfalto/libs/"
	
	cd ../..
}

build()
{
	rm -rf "$srcdir"/build
	mkdir "$srcdir"/build
	cd "$srcdir"/build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$pkgname"
	make
	cd ../..
}

package()
{
	cd "$srcdir"/build

	# Install pdfalto binary
	install -Dm775 pdfalto "$pkgdir"/usr/bin/pdfalto

	# Additional files
	install -Dm644 "$srcdir"/pdfalto/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
