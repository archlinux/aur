# Maintainer: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>
pkgname=obs-studio-git
pkgver=30.1.1.r17.gdc770b8
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming."
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("curl"
         "ffmpeg"
         "gtk-update-icon-cache"
         "jack"
         "jansson"
         "libajantv2"
         "libdatachannel"
         "librist"
         "libxinerama"
         "libxkbcommon-x11"
         "mbedtls2"
         "onevpl"
         "pciutils"
         "qrcodegencpp-cmake"
         "qt6-svg"
         "speexdsp")
makedepends=("asio"
             "cef-minimal-obs-bin"
             "cmake"
             "git"
             "libfdk-aac"
             "libxcomposite"
             "luajit"
             "nlohmann-json"
             "pipewire"
             "python"
             "qt6-wayland"
             "swig"
             "vlc"
             "wayland"
             "websocketpp"
             "x264"
             "xdg-desktop-portal")
optdepends=("libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "libva-intel-driver: hardware encoding"
            "libva-mesa-driver: hardware encoding"
            "vlc: VLC Media Source"
            "luajit: Lua scripting"
            "python: Python scripting"
            "v4l2loopback-dkms: Virtual webcam"
            "pipewire: Pipewire capture"
            "pipewire-media-session: Pipewire capture"
            "xdg-desktop-portal: Pipewire capture")
provides=("obs-studio=$pkgver")
conflicts=("obs-studio")
source=("$pkgname::git+https://github.com/obsproject/obs-studio.git#branch=master"
        "git+https://github.com/Mixer/ftl-sdk.git"
        "git+https://github.com/obsproject/obs-browser.git"
        "git+https://github.com/obsproject/obs-websocket.git")
md5sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$pkgname"
  _version=$(git tag | grep -Ev '.*[a-z]{2}.*' | sort -V | tail -1)
  _revision=$(git rev-list --count $_version..HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd $pkgname
  gitconf="protocol.file.allow=always"

  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c $gitconf submodule update
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef-obs" \
    -DENABLE_LIBFDK=ON \
    -DENABLE_AJA=0 \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2:sw=2:expandtab
