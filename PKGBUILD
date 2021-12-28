# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=tiscamera
pkgver=0.14.0
pkgrel=1
pkgdesc="The Linux SDK for The Imaging Source cameras."
arch=(x86_64)
url="https://github.com/TheImagingSource"
license=(APACHE)
depends=(libzip gobject-introspection)
checkdepends=()
provides=()
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname/archive/refs/tags/v-tiscamera-$pkgver.tar.gz")
md5sums=(63bf7759737ae69fa0a79f4a8001a116)

build() {
	cd "$pkgname-v-$pkgname-$pkgver/"
	sed -i 's,set(TCAM_INSTALL_UDEV "/etc/udev/rules.d",set(TCAM_INSTALL_UDEV "/usr/lib/udev/rules.d",' CMakeLists.txt
	sed -i 's,set(TCAM_INSTALL_SYSTEMD "/lib/systemd/system/",set(TCAM_INSTALL_SYSTEMD "/usr/lib/systemd/system/",' CMakeLists.txt
	patch -ui ../../gstmetatcamstatistics.cpp.patch src/gstreamer-1.0/gstmetatcamstatistics.cpp
	rm -rf build 2>> /dev/null
        mkdir build && cd build
        cmake -DCMAKE_CXX_FLAGS="-Wno-error" -DBUILD_ARAVIS=ON ..
	make
}

package() {
	cd "$pkgname-v-$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
