# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Antoine Damhet <xdbob at lse.epita.fr>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>
pkgname=obs-studio-wayland-git
pkgver=26.0.2.r83.g5f6793676
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording (with wayland patches)"
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11" "mbedtls"
         "qt5-svg" "qt5-x11extras" "curl" "jack" "gtk-update-icon-cache")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "cef-minimal-3770")
optdepends=("libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "libva-intel-driver: hardware encoding"
            "libva-mesa-driver: hardware encoding"
            "vlc: VLC Media Source"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting"
            "qt5-wayland: Wayland obs window"
            "wlrobs-hg: screen capture on wlroots compositors")
provides=("obs-studio=$pkgver" "obs-studio-git" "obs-studio-wayland=$pkgver")
conflicts=("obs-studio")
source=("$pkgname::git+https://github.com/obsproject/obs-studio.git#branch=master"
        "git+https://github.com/Mixer/ftl-sdk.git"
        "git+https://github.com/obsproject/obs-browser.git"
        "git+https://aur.archlinux.org/obs-studio-wayland.git")
md5sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd $pkgname
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  for patch in $srcdir/obs-studio-wayland/*.patch; do
    patch -Np1 -i "$patch"
  done
}

build() {
  cmake -S $pkgname -B build\
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef" \
    -DOBS_VERSION_OVERRIDE=$pkgver

  make -C build
}

package() {
  make -C build install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2:expandtab
