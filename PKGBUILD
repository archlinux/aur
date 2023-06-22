# Maintainer: VitalyR <vr AT vitalyr DOT com>
# Contributor: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>
pkgname=obs-studio-vitalyr-git
pkgver=29.1.0.218
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming."
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11" "mbedtls"
         "qt6-svg" "curl" "jack" "gtk-update-icon-cache"
         "speexdsp" "pciutils" "libajantv2" "librist" "libdatachannel")
makedepends=("asio" "cmake" "git" "libfdk-aac" "libxcomposite" "x264"
             "vlc" "swig" "luajit" "nlohmann-json" "python" "cef-minimal-obs-bin" "wayland"
             "websocketpp" "qt6-wayland" "pipewire" "xdg-desktop-portal")
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
        "git+https://github.com/obsproject/obs-websocket.git"
        "git+https://github.com/nayuki/QR-Code-generator.git"
        "fix_python_binary_loading.patch")
md5sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP"
         "051b90f05e26bff99236b8fb1ad377d1")

pkgver() {
  cd $pkgname
  git describe --long --tags | cut -d- -f1-2 | sed "s/-/\./"
}

prepare() {
  cd $pkgname
  gitconf="protocol.file.allow=always"

  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c $gitconf submodule update

  cd plugins/obs-websocket
  git config submodule.deps/qr.url $srcdir/QR-Code-generator
  git -c $gitconf submodule update
}

build() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef-obs" \
    ..

  make
}

package() {
  cd $pkgname/build

  make install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2:expandtab
