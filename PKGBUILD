# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
pkgver=5.3.4.4
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armhf')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('protobuf' 'qt5-base')
makedepends=('asio' 'cmake' 'doxygen' 'graphviz' 'simpleini' 'tclap')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz)
sha256sums=('8036130e84191618e9d6f056101b5c9f70c03fdbd97adbcd2bca741f0ce08fb1')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

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
	if [ -d "$pkgdir/usr/lib64/" ]; then
		mv "$pkgdir/usr/lib/cmake/"* "$pkgdir/usr/lib64/cmake/"
		rm -r "$pkgdir/usr/lib"
		mv "$pkgdir/usr/lib64/" "$pkgdir/usr/lib"
	fi
        mv "$pkgdir/usr/etc" "$pkgdir/etc"	
}
