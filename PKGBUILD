# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=pdfalto
pkgver=0.6.2
pkgrel=1
pkgdesc='PDF to XML ALTO file converter'
arch=('x86_64')
url='https://github.com/kermitt2/pdfalto'
license=('GPL2')
depends=('libtiff' 'freetype2' 'icu' 'libpng14' 'libxml2' 'zlib' 'fontconfig' 'libpaper')
makedepends=('cmake' 'gcc12' 'git')
source=("pdfalto-${pkgver}.tar.gz::https://github.com/kermitt2/pdfalto/archive/refs/tags/v${pkgver}.tar.gz"
        "pdfalto-libpaper-from-system.patch")
md5sums=('fedd74cba332d31f456cc28c9c47a61a'
         'f5af9f957d51267405017f1b3be20877')

prepare()
{
	cd "$srcdir"/$pkgname-$pkgver

	# submodules don't work in the tarball, fetch directly
	git clone https://github.com/lfoppiano/xpdf-4.05.git
	
	# libpaper missing, linking against the system library -lpaper
	patch -Np1 -i "$srcdir/pdfalto-libpaper-from-system.patch"

	cd ../..
}

build()
{
	cd "$srcdir"/$pkgname-$pkgver

	export CC=gcc-12
	export CXX=g++-12
	cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
	cd ../..
}

package()
{
	cd "$srcdir"/$pkgname-$pkgver

	# Install pdfalto binary
	install -Dm775 pdfalto "$pkgdir"/usr/bin/pdfalto

	# Additional files
	install -Dm644 "$srcdir"/pdfalto-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
