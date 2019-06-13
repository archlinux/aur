# Maintainer: Tobias Borgert <tobias.borgertt@gmail.com>

pkgname=ecal
pkgver=5.3.2
pkgrel=7
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('asio' 'protobuf' 'qt5-base' 'tclap')
makedepends=('cmake' 'doxygen' 'graphviz' 'simpleini')
optdepends=()
source=(https://github.com/continental/ecal/archive/v$pkgver.tar.gz
        ecal-v5.3.2-archlinux-fabs.patch)
sha256sums=('cde3b92df167640e94e60bd0a6eff4f6520b43b27059568694283b07250f892c'
            'bbbb519e72f177c03a10a6d5fc820e4aebba91de965ccf3e8176ea1851e427c6')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input="../ecal-v5.3.2-archlinux-fabs.patch"
}

build() {
	cd $pkgname-$pkgver
	sed -i /set\(eCAL_VERSION_STRING\ /s/\$\{eCAL_VERSION_MAYOR\}.\$\{eCAL_VERSION_MINOR\}.\$\{eCAL_VERSION_PATCH\}/"$pkgver"/g CMakeLists.txt
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
	mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        mv "$pkgdir/usr/etc" "$pkgdir/etc"	
}
