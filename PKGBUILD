# Maintainer: José Miguel Sarasola <jmsaraur@gmail.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio-amf
pkgver=30.0.2
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording. Includes new AMF encoding patch & browser plugin"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils' 'nss'
	'qt6-svg' 'qt6-wayland' 'xdg-desktop-portal' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite' 'amf-amdgpu-pro' 'qrcodegencpp-cmake' 'libdatachannel')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'python' 'luajit' 'sndio' 'git' 'nlohmann-json' 'websocketpp' 'asio' 'amf-headers')
provides=("obs-studio=$pkgver" "obs-websocket")
conflicts=("obs-studio" "obs-studio-tytan652" "obs-websocket")
optdepends=('libfdk-aac: FDK AAC codec support'
	'libva-intel-driver: hardware encoding'
	'libva-mesa-driver: hardware encoding'
	'luajit: scripting support'
	'python: scripting support'
	'sndio: Sndio input client'
	'v4l2loopback-dkms: virtual camera support')
source=(obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver
	cef_binary_5060_linux64.tar.bz2::https://cdn-fastly.obsproject.com/downloads/cef_binary_5060_linux64.tar.bz2
	obs-amf-patch.patch
	com.obsproject.Studio.desktop)
md5sums=('SKIP'
         '815a03f3436ff29d7d8ef406b1ee0cec'
         '2978ea86c67b116adaad671f2b04fa4d'
         '2f0f4b1f1814716d345a8f028b987361')

prepare() {
	tar -xjf ./cef_binary_5060_linux64.tar.bz2
	cd obs-studio
	git submodule update --init --recursive
	patch -Np1 <"$srcdir"/obs-amf-patch.patch
}

build() {
	cd obs-studio
	mkdir -p build
	cd build

	cmake -E env CFLAGS="-Wno-deprecated-declarations" \
	cmake -DCMAKE_INSTALL_PREFIX="/usr" \
		-DENABLE_VST=ON \
		-DENABLE_VLC=OFF \
		-DENABLE_BROWSER=ON \
		-DCEF_ROOT_DIR="../../cef_binary_5060_linux64" \
		-DENABLE_AJA=OFF \
		-DENABLE_JACK=ON \
		-DENABLE_NEW_MPEGTS_OUTPUT=OFF \
		-DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

	make
}

package() {
	cd obs-studio/build
	make install DESTDIR="$pkgdir"

	cd ../..
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "com.obsproject.Studio.desktop"
}
