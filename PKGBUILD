# Maintainer: Ryan Jacobs <ryan@rmj.us>
pkgname=azure-kinect-sensor-sdk-git
pkgver=v1.2.0.beta.1.r5.aebb27ac
pkgrel=1
pkgdesc="A cross platform user mode SDK to read data from Azure Kinect devices."
arch=("x86_64")
url="https://github.com/microsoft/Azure-Kinect-Sensor-SDK"
license=("MIT")
depends=("libsoundio" "libxinerama" "libxrandr" "libglvnd" "libxcursor" "systemd-libs")
makedepends=("git" "cmake")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("azure-kinect-sensor-sdk::git+https://github.com/microsoft/Azure-Kinect-Sensor-SDK")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
	make -C ./build DESTDIR="$pkgdir/" install

    # install udev rule
    install -v -Dm644 ./scripts/99-k4a.rules "$pkgdir/usr/lib/udev/rules.d/99-k4a.rules"
}
