# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
pkgver=5.4.0
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('protobuf' 'qt5-base')
makedepends=('asio' 'cmake' 'doxygen' 'graphviz' 'simpleini' 'tclap')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz)
sha256sums=('2ad2bace30e26754996ae3f3754083a6921af91034c3dc90e945c40a5e2419c6')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

build() {
	cd $pkgname-$pkgver
	sed -i /set\(eCAL_VERSION_MAYOR\ /s/\$\{GIT_REVISION_MAYOR\}/"5"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_MINOR\ /s/\$\{GIT_REVISION_MINOR\}/"4"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_PATCH\ /s/\$\{GIT_REVISION_PATCH\}/"0"/g CMakeLists.txt
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
