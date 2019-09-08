# Maintainer: Ryan Jacobs <ryan@rmj.us>
pkgname=azure-kinect-sensor-sdk-git
pkgver=v1.2.0.beta.1.r27.467d8272
pkgrel=7
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
	pushd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build
    cmake ..
    make -j$(nproc)
    popd

    # Reassemble and decompress libdepthengine.so.20
    # AUR has a 200 KB blob limit...
    cat ../libdepthengine.so.2.0.xz-part-{1,2,3} > libdepthengine.so.2.0.xz
    xz -df libdepthengine.so.2.0.xz
}

package() {
	pushd "$srcdir/${pkgname%-git}"
	make -C ./build DESTDIR="$pkgdir/" install
    install -v -Dm644 ./scripts/99-k4a.rules "$pkgdir/usr/lib/udev/rules.d/99-k4a.rules"
    popd

    install -v -Dm644 libdepthengine.so.2.0 "$pkgdir/usr/local/lib64/libdepthengine.so.2.0"

    # symlink the .so files to the standard /usr/lib/ path
    mkdir -p "$pkgdir/usr/lib"
    ln -sr "$pkgdir/usr/local/lib64/"*.so* "$pkgdir/usr/lib"
}
