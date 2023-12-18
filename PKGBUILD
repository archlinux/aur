# Maintainer: Branan Riley <branan@top-secret.network>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

pkgname=obs-studio-av1
pkgver=30.0.2
pkgrel=4
pkgdesc="Free, open source software for live streaming and recording. With AV1, Websocket, and Browser Source support."
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=(
  'curl'
  'ffmpeg'
  'gtk-update-icon-cache'
  'jack'
  'jansson'
  'libajantv2'
  'libdatachannel'
  'librist'
  'libxinerama'
  'libxkbcommon-x11'
  'mbedtls'
  'onevpl'
  'pciutils'
  'qt6-svg'
  'rnnoise'
  'speexdsp'

  # Deps of Websocket plugin
  'qrcodegencpp-cmake'
)
makedepends=(
  'cmake'
  'git'
  'libfdk-aac'
  'libxcomposite'
  'luajit'
  'pipewire'
  'python'
  'qt6-wayland'
  'sndio'
  'swig'
  'vlc'
  'wayland'
  'x264'
  'xdg-desktop-portal'

  # Deps of Websocket plugin
  'nlohmann-json'
  'websocketpp'
  'asio'

  # Deps of Browser plugin
  'cef-minimal-obs-bin'
)
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: ffmpeg hardware encoding'
            'libva-mesa-driver: ffmpeg hardware encoding'
            'libxcomposite: xcomposite capture support'
            'luajit: scripting support'
            'onevpl-intel-gpu: quicksync hardware Encoding'
            'pipewire: pipewire capture support'
            'python: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support'
            'vlc: vlc media source support'
            'xdg-desktop-portal: pipewire capture support')
provides=("obs-studio=$pkgver" "obs-websocket" "obs-browser")
conflicts=("obs-studio" "obs-websocket" "obs-browser" "obs-linuxbrowser")
source=("obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
        "obs-browser::git+https://github.com/obsproject/obs-browser.git"
        "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
        fix_python_binary_loading.patch
        add_ffmpeg_vaapi_av1.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'bdfbd062f080bc925588aec1989bb1df34bf779cc2fc08ac27236679cf612abd'
            '539adb1a8c5e18fd589153a9e23642da0d79bc882be4f1c4bae9d72f7b6008d8')

prepare() {
  cd obs-studio

  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c protocol.file.allow=always submodule update

  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
  patch -Np1 < "$srcdir"/add_ffmpeg_vaapi_av1.patch
}

build() {
  cmake -B build -S obs-studio \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef-obs" \
    -DENABLE_VST=ON \
    -DENABLE_JACK=ON \
    -DENABLE_LIBFDK=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" \
    -DCALM_DEPRECATION=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
