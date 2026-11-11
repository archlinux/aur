# Maintainer: Evgeny Cherkashin <eugeneai@irnok.net>

pkgname=simplescreenrecorder-mqtt-git
pkgver=0.4.4.mqtt.r28.g25e9780
pkgrel=1
pkgdesc="A simple but powerful recording tool for X11, OpenGL and V4L2. (Git version with MQTT remote control support)"
arch=("x86_64")
url="https://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL-3.0-only")
depends=("qt6-base" "qt6-mqtt"
    "ffmpeg" "alsa-lib" "libpulse" "libpipewire" "libvorbis" "libxkbcommon"
    "jack" "libglvnd" "glu" "v4l-utils"
    "libx11" "libxext" "libxfixes" "libxi" "libxinerama"
    "desktop-file-utils" "gtk-update-icon-cache")
optdepends=("lib32-simplescreenrecorder-git: OpenGL recording of 32-bit applications")
makedepends=("git" "cmake" "ninja" "qt6-tools")
source=("git+https://github.com/eugeneai/ssr.git")
md5sums=("SKIP")
conflicts=("simplescreenrecorder")
provides=("simplescreenrecorder")

install=simplescreenrecorder-mqtt-git.install

pkgver() {
	cd ssr
	# Use the tag of the last commit
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd ssr
	mkdir -p build
}

build() {
	cd ssr
	cmake -S . -B build \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_INSTALL_LIBDIR="lib" \
		-DCMAKE_BUILD_TYPE=Release \
		-DWITH_QT6=TRUE \
		-DWITH_QT5=FALSE \
		-G Ninja
	cmake --build build
}

package() {
	cd ssr
	DESTDIR="$pkgdir" cmake --install build
}
