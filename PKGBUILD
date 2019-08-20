# Maintainer: Ryan Jacobs <ryan@rmj.us>
pkgname=azure-kinect-sensor-sdk-git
pkgver=v1.2.0.beta.1.r4.4b37ca7d
pkgrel=1
pkgdesc="A cross platform user mode SDK to read data from Azure Kinect devices."
arch=("x86_64")
url="https://github.com/microsoft/Azure-Kinect-Sensor-SDK"
license=("MIT")
depends=("libsoundio" "libxinerama" "libxrandr" "libglvnd" "libxcursor" "systemd-libs")
makedepends=("git" "cmake" "ninja")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("azure-kinect-sensor-sdk::git+https://github.com/microsoft/Azure-Kinect-Sensor-SDK")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cp -v ../50-kinect-azure.rules .
}

build() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build
    cmake ..
    make -j$(nproc)
}

package() {
	cd "$srcdir/${pkgname%-git}"

    # make install
    cd build
	make DESTDIR="$pkgdir/" install
    cd ../../

    # install udev rule
    mkdir -p "$pkgdir/udev/rules.d"
    cp -v 50-kinect-azure.rules "$pkgdir/udev/rules.d/"
}
