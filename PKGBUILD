# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=pdfalto
pkgver=0.4
pkgrel=3
pkgdesc='PDF to XML ALTO file converter'
arch=('x86_64')
url='https://github.com/kermitt2/pdfalto'
license=('GPL2')
depends=('libtiff' 'freetype2' 'icu' 'libpng14' 'libxml2' 'zlib')
makedepends=('cmake' 'gcc12')
source=("git+https://github.com/kermitt2/${pkgname}.git#tag=${pkgver}"
        "pdfalto-use-system-libs.patch"
        "pdfalto-compilation-fixes.patch"
        "pdfalto-c++17.patch")
md5sums=('3ab6d630f542e95b63a664ccad5d17a4'
         '6d1ef0ea61e4ec3f65bca9c5a78fa62f'
         '8cb9aeb09a45f860ae0b793ce329a425'
         '5ebbed5a08f7d6fd67fa5dcd3c5ceca2')

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

	patch -Np1 -i "$srcdir/pdfalto-compilation-fixes.patch"

	# ICU increased the minimal level of C++ standard required
	# to include their header files (and use the library)
	patch -Np1 -i "$srcdir/pdfalto-c++17.patch"
	
	cd ../..
}

build()
{
	rm -rf "$srcdir"/build
	mkdir "$srcdir"/build
	cd "$srcdir"/build
	export CC=gcc-12
	export CXX=g++-12
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
