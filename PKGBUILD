# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
_pkgver_major=5
_pkgver_minor=6
_pkgver_patch=0
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('curl' 'protobuf' 'qt5-base' 'hdf5')
makedepends=('asio' 'cmake' 'doxygen'  'fineftp-server' 'git' 'graphviz' 'gtest' 'simpleini' 'spdlog' 'tclap' 'tinyxml2')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz
        arch-linux-compat.diff)
sha256sums=('9f36eaf456a5840e2417561842a0161d55b85511f47eb1848b2aad969eb8eb92'
            '44a534b6c2b1bbc615a1f878c569d44c4919f0085df496224286921dc877ce28')
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
		 -DECAL_THIRDPARTY_BUILD_SPDLOG=OFF \
		 -DECAL_THIRDPARTY_BUILD_TINYXML2=OFF \
		 -DECAL_THIRDPARTY_BUILD_FINEFTP=OFF \
		 -DECAL_THIRDPARTY_BUILD_CURL=OFF \
		 -DECAL_THIRDPARTY_BUILD_GTEST=OFF \
		 -DECAL_THIRDPARTY_BUILD_HDF5=OFF
	make
}

package() {
	cd $pkgname-$pkgver
	cd _build
	DESTDIR="$pkgdir" make install
        mv "$pkgdir/usr/etc" "$pkgdir/etc"	
}
