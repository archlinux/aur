# Maintainer: Branan Riley <branan@top-secret.network>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio-av1
pkgver=30.0.2
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'python' 'luajit' 'sndio')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support')
provides=("obs-studio=$pkgver")
conflicts=("obs-studio")
source=(obs-studio-$pkgver.tar.gz::https://github.com/obsproject/obs-studio/archive/$pkgver.tar.gz
        fix_python_binary_loading.patch
        ignore_unused_submodules.patch
        add_ffmpeg_vaapi_av1.patch)
sha256sums=('be12c3ad0a85713750d8325e4b1db75086223402d7080d0e3c2833d7c5e83c27'
            'bdfbd062f080bc925588aec1989bb1df34bf779cc2fc08ac27236679cf612abd'
            '60b0ee1f78df632e1a8c13cb0a7a5772b2a4b092c4a2a78f23464a7d239557c3'
            '539adb1a8c5e18fd589153a9e23642da0d79bc882be4f1c4bae9d72f7b6008d8')

prepare() {
  cd obs-studio-$pkgver
  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
  patch -Np1 < "$srcdir"/ignore_unused_submodules.patch
  patch -Np1 < "$srcdir"/add_ffmpeg_vaapi_av1.patch
}

build() {
  cmake -B build -S obs-studio-$pkgver \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_BROWSER=OFF \
    -DENABLE_VST=ON \
    -DENABLE_VLC=OFF \
    -DENABLE_NEW_MPEGTS_OUTPUT=OFF \
    -DENABLE_AJA=OFF \
    -DENABLE_JACK=ON \
    -DENABLE_LIBFDK=ON \
    -DENABLE_WEBRTC=OFF \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" \
    -DCALM_DEPRECATION=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
