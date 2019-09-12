# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
pkgver=5.3.5
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('protobuf' 'qt5-base')
makedepends=('asio' 'cmake' 'doxygen' 'graphviz' 'simpleini' 'tclap')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz)
sha256sums=('bdadb3427e044f60c4c3f183ff276ad21921c08c7cb76d93cedfc7ae1969603c')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

build() {
	cd $pkgname-$pkgver
	sed -i /set\(eCAL_VERSION_MAYOR\ /s/\$\{GIT_REVISION_MAYOR\}/"5"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_MINOR\ /s/\$\{GIT_REVISION_MINOR\}/"3"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_PATCH\ /s/\$\{GIT_REVISION_PATCH\}/"5"/g CMakeLists.txt
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
        mv "$pkgdir/usr/etc" "$pkgdir/etc"	
}
