# Maintainer: Andy Kelk <andy@andykelk.net>
# Contributor: marconvcm
# Contributor: u/Astros_virus5372

pkgname=sony-device-center
pkgver=0.1.5
pkgrel=1
pkgdesc="Open-source Sony headphone/earbud companion: GUI, sonyd daemon and sonyctl CLI over a reverse-engineered Bluetooth protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/marconvcm/sony-device-center"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'bluez-libs' 'dbus')
makedepends=('cmake' 'ninja' 'gcc' 'glfw-x11' 'libgl')
# Legacy ImGui client is a git submodule; the GitHub release tarball ships it
# empty, so pin it here and drop it into Client/imgui in prepare().
source=("https://github.com/marconvcm/sony-device-center/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/ocornut/imgui/archive/b62bfd6b06de958e4630b715225b7e8409bfd0f9.tar.gz")
sha256sums=('b67423b45c0bd94c60d628d2a3bb21b842980fdea6a4730367edab229347ab90'
          '27d396d30d18391f6b805d0633b633c8644cdb15cd069c2baabfaefb86702cac')

prepare() {
    # Populate the empty imgui submodule so the legacy Client target can build.
    rm -rf "sony-device-center-${pkgver}/Client/imgui"
    mkdir -p "sony-device-center-${pkgver}/Client/imgui"
    cp -r "imgui-b62bfd6b06de958e4630b715225b7e8409bfd0f9/." \
        "sony-device-center-${pkgver}/Client/imgui/"
}

build() {
    cmake -B build -S "sony-device-center-${pkgver}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
}
