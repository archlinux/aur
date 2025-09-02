# Maintainer: Thomas Bocek <tom.arch at bocek.ch>
# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>
# Contributor: Maciek Marciniak <mm2pl at kotmisia.pl>

pkgname=obs-studio-with-websockets
pkgver=31.1.2
pkgrel=2
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite'
         'libdatachannel' 'uthash' 'ffnvcodec-headers')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'python' 'luajit' 'sndio' 'nlohmann-json'
             'websocketpp' 'asio' 'qrcodegencpp-cmake' 'extra-cmake-modules')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support')
options=("!debug")
source=($pkgname-$pkgver.tar.gz::https://github.com/tbocek/obs-source-all/releases/download/$pkgver/obs-studio-$pkgver.tar.gz)
sha256sums=('9014c849bfb77b44021e09ea84e698c4c272be15fd2ac156b447797ce72c59fa')
provides=('obs-studio')

build() {
  export CXXFLAGS+=" -Wno-error=deprecated-declarations"
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
