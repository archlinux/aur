# Maintainer: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=4.2.1
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64 i686)
url='http://linphone.org'
license=(GPL)
depends=(qt5-quickcontrols2 qt5-graphicaleffects qt5-svg qt5-tools mediastreamer belcard liblinphone)
makedepends=(cmake python-pystache doxygen nasm yasm python-six)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-do-not-build-linphone-sdk.patch
        0002-Fix-building-out-of-git.patch
)
sha512sums=('4014960bb69cc1e6a9c2132d590600f2ebd5a820209bbbd76266f2ada7c2474c058c0a1c943fea1ffca20c64a6653ad8b8844326bdca35fa07999f05c68d1f8e'
            '7f1c080d99d24765582d68782c9c20cca6c311990f17a5109a710174405790ff69b1320dc983d1ea605afd064f14f857bf03d1acbd9847b1cea3c99b475eee5d'
            'ea4c21c162f672f897c5a62ec8b51dd88fcc226e68b23148b4d3ed1bcdd69171a5995f3be1022f56cd48d6fdfca6455cda46e11306db60df3e63087b3f96e9e8')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i ../0001-do-not-build-linphone-sdk.patch
	patch -Np1 -i ../0002-Fix-building-out-of-git.patch
}

build() {   
	mkdir -p build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release "../$pkgname-$pkgver"
    make

    sed '/linphone-sdk/d' -i linphone-app/cmake_builder/linphone_package/cmake_install.cmake
    sed "s|$srcdir/build/OUTPUT|$pkgdir/usr|" -i cmake_install.cmake
}

package() {
	make -C build install
	rm "$pkgdir/usr/bin/qt.conf"
}
