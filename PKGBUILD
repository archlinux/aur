# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
pkgver=5.3.4.3
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('protobuf' 'qt5-base')
makedepends=('asio' 'cmake' 'doxygen' 'graphviz' 'simpleini' 'tclap')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz)
sha256sums=('89c9e303a63ce4dba576d45464e9e08325f2697fb9717b1174d170b0f0a3e9c7')

build() {
	cd $pkgname-$pkgver
	sed -i /set\(eCAL_VERSION_MAYOR\ /s/\$\{GIT_REVISION_MAYOR\}/"5"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_MINOR\ /s/\$\{GIT_REVISION_MINOR\}/"3"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_PATCH\ /s/\$\{GIT_REVISION_PATCH\}/"4"/g CMakeLists.txt
	mkdir -p _build
	cd _build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=Release \
		 -DECAL_THIRDPARTY_BUILD_PROTOBUF=OFF
	make
}

package() {
	cd $pkgname-$pkgver
	cd _build
	DESTDIR="$pkgdir" make install
	mv "$pkgdir/usr/lib/cmake/"* "$pkgdir/usr/lib64/cmake/"
	rm -r "$pkgdir/usr/lib"
	mv "$pkgdir/usr/lib64/" "$pkgdir/usr/lib"
        mv "$pkgdir/usr/etc" "$pkgdir/etc"	
}
