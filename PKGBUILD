# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=nifticlib
pkgver=2.0.0
pkgrel=1
pkgdesc='Collection of i/o routines for the nifti1 neuroimage data format'
arch=('any')
url='https://nifti.nimh.nih.gov/'
license=('custom:public domain')
depends=()
makedepends=('cmake')
optdepends=()
provides=('nifticlib')
source=('http://downloads.sourceforge.net/project/niftilib/nifticlib/nifticlib_2_0_0/nifticlib-2.0.0.tar.gz')
md5sums=('425a711f8f92fb1e1f088cbc55bea53a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# make it position independent
	sed -i \
		'13iSET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")' \
		CMakeLists.txt

	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make all
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"

	make install

	install -D -m644 \
		"$srcdir/$pkgname-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
