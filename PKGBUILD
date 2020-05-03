# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
_pkgver_major=5
_pkgver_minor=5
_pkgver_patch=5
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('protobuf' 'qt5-base' 'hdf5')
makedepends=('asio' 'cmake' 'doxygen' 'git' 'graphviz' 'simpleini' 'spdlog' 'tclap')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz
        arch-linux-compat.diff)
sha256sums=('35c58f8f22a2743d976484b6b2284542bdc21103c197cf8e816ea81658bbc061'
            '5681be1564c288f5ad0afb0aef1c10c848b77a2f6a198a673a401d5271989ffa')
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
