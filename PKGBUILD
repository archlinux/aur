# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=tiscamera
pkgver=1.0.0
pkgrel=1
pkgdesc="The Linux SDK for The Imaging Source cameras."
arch=(x86_64)
url="https://github.com/TheImagingSource"
license=(APACHE)
depends=(libzip gobject-introspection-git)
checkdepends=()
provides=()
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname/archive/refs/tags/v-tiscamera-$pkgver.tar.gz")
md5sums=(c597a4a6569d0d0f49a563b00ca797d0)

build() {
	cd "$pkgname-v-$pkgname-$pkgver/"
	sed -i 's,set(TCAM_INSTALL_UDEV "/lib/udev/rules.d",set(TCAM_INSTALL_UDEV "/usr/lib/udev/rules.d",' CMakeInstall.cmake
	sed -i 's,set(TCAM_INSTALL_SYSTEMD "/lib/systemd/system/",set(TCAM_INSTALL_SYSTEMD "/usr/lib/systemd/system/",' CMakeInstall.cmake
	patch -ui ../../force_qt5.patch tools/tcam-capture/CMakeLists.txt
	rm -rf build 2>> /dev/null
	mkdir build && cd build
	cmake -DCMAKE_CXX_FLAGS="-Wno-error" -DTCAM_BUILD_ARAVIS=ON ..
	make
}

package() {
	cd "$pkgname-v-$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
