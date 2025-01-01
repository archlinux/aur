# Maintainer: Thomas Bocek <tom.arch at bocek.ch>
# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>
# Contributor: Maciek Marciniak <mm2pl at kotmisia.pl>

pkgname=obs-studio-with-websockets
pkgver=31.0.0
pkgrel=4
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite'
         'libdatachannel' 'uthash' 'ffnvcodec-headers' 'qrcodegencpp-cmake' 'websocketpp' 'asio')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'python' 'luajit' 'sndio' 'nlohmann-json')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support')
options=("!debug")
source=($pkgname-$pkgver.tar.gz::https://github.com/tbocek/obs-source-all/releases/download/$pkgver/obs-studio-$pkgver.tar.gz)
sha256sums=('b135a0e6dafab853ff3749d67003bd847316aec36646cbdb41218cbfab03c709')

prepare() {
  cd obs-studio-$pkgver
}

build() {
  export CFLAGS+=" -Wno-error=deprecated-declarations"
  cmake -B build -S obs-studio-$pkgver \
    -DENABLE_NATIVE_NVENC=OFF \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_BROWSER=OFF \
    -DENABLE_VST=ON \
    -DENABLE_VLC=OFF \
    -DENABLE_NEW_MPEGTS_OUTPUT=OFF \
    -DENABLE_AJA=OFF \
    -DENABLE_JACK=ON \
    -DENABLE_LIBFDK=ON \
    -DENABLE_WEBRTC=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" \
    -DCALM_DEPRECATION=ON \
    -DENABLE_WEBSOCKET=ON \
    -Wno-dev
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
