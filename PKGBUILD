# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
_pkgver_major=5
_pkgver_minor=5
_pkgver_patch=3
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=4
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('protobuf' 'qt5-base' 'hdf5')
makedepends=('asio' 'cmake' 'doxygen' 'graphviz' 'simpleini' 'spdlog' 'tclap')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz
        arch-linux-compat.diff)
sha256sums=('ba95e707c69a0eb4b65f897bd34fc1d9c3c2d342d7685450960cc61435c3e613'
            'c01b56b234f3e2b105e10e3850ee568dc33f728efebedc768a3b0dc0e4b6e835')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input="../arch-linux-compat.diff"
}

build() {
	cd $pkgname-$pkgver
	sed -i /set\(eCAL_VERSION_MAJOR\ /s/\$\{GIT_REVISION_MAYOR\}/"$_pkgver_major"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_MINOR\ /s/\$\{GIT_REVISION_MINOR\}/"$_pkgver_minor"/g CMakeLists.txt
	sed -i /set\(eCAL_VERSION_PATCH\ /s/\$\{GIT_REVISION_PATCH\}/"$_pkgver_patch"/g CMakeLists.txt
	mkdir -p _build
	cd _build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=Release \
		 -DECAL_THIRDPARTY_BUILD_PROTOBUF=OFF \
		 -DECAL_THIRDPARTY_BUILD_SPDLOG=OFF
	make
}

package() {
	cd $pkgname-$pkgver
	cd _build
	DESTDIR="$pkgdir" make install
        mv "$pkgdir/usr/etc" "$pkgdir/etc"	
}
