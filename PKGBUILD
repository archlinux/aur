# Maintainer: Lukas1818 aur at lukas1818 dot de

_pkgtag=Beta_30_1_Build1 #auto updated by CI
#tags are sadly not very consistent #current tag    (original tag)      -> new tag
pkgver=${_pkgtag/Beta_/0_}          #Beta_25_5      (Beta_25_5)         -> 0_25_5
pkgver=${pkgver/Beta/0_}            #Beta28_Build2  (Beta28_Build2)     -> 0_28_Build2
pkgver=${pkgver/_Build-/_Build}     #0_26_1_Build-5 (Beta_26_1_Build-5) -> 0_26_1_Build5
pkgver=${pkgver/_Build/_}           #0_27_Build3    (Beta27_Build3)     -> 0_27_3
pkgver=${pkgver//_/.}               #0_26_1_5       (Beta_26_1_Build-5) -> 0.26.1.5

pkgname=commander-wars
pkgrel=1
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-declarative' 'qt6-multimedia')
makedepends=('clang' 'cmake' 'ninja' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz"
        '0001-fix-QStandardPaths-include.patch')
sha512sums=('fcb95390f7905fb70721cbc93b2c262bf5ec18e22a273d712719314864a6df7cae1b4fa6f813658113fc2dd0d6aa0142f775475710663498a6c108120cea7cb9'
            '2de911786944e44a18f524508827805992a02a6890638a0e24bfcbac02374df90e8334376973263492ea04454b9ac368e71d3aa91d4b7b33a0bbc5af661bfcc2')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	patch -N -p1 -i "$srcdir/0001-fix-QStandardPaths-include.patch"
	sed -i '/RPATH/d' CMakeLists.txt #remove insecure RPATH '/../'
	mkdir -p build
}

build()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	cd build

	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSEAPPCONFIGPATH=ON \
		-DOPENSSL_USE_STATIC_LIBS=OFF

	ninja
}

package()
{
	cd "$srcdir/Commander_Wars-$_pkgtag/build"

	DESTDIR="$pkgdir" ninja install
	echo "remove qt libs"
	rm -rf "$pkgdir/usr/lib" #qt libarys are not needed, if the qt package is installed; addr2line binary is not used on linux
}
