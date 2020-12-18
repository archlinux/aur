# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
pkgver=5.8.0
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('curl' 'protobuf' 'qt5-base' 'hdf5')
makedepends=('cmake' 'doxygen' 'git' 'graphviz')
optdepends=()
source=(git+https://github.com/continental/ecal.git)
sha256sums=('SKIP')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

prepare() {
    cd $pkgname
    git checkout v${pkgver}
    git submodule init
    git submodule update
}

build() {
	cd $pkgname
	mkdir -p _build
	cd _build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		     -DCMAKE_BUILD_TYPE=Release \
		     -DECAL_THIRDPARTY_BUILD_PROTOBUF=OFF \
		     -DECAL_THIRDPARTY_BUILD_CURL=OFF \
		     -DECAL_THIRDPARTY_BUILD_HDF5=OFF \
             -DCMAKE_INSTALL_SYSCONFDIR=/etc
	make
}

package() {
	cd $pkgname
	cd _build
	DESTDIR="$pkgdir" make install
}
