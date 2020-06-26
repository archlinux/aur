# Maintainer   zanny <zan@420blaze.it>
# Contributor  Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>
pkgname=obs-hevc-vaapi-git
pkgver=25.0.7.r293.gbb890a674
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming. With VAAPI HEVC support."
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt5-x11extras" "curl" "gtk-update-icon-cache")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "cef-minimal")
optdepends=("libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "jack: JACK Support"
            "vlc: VLC Media Source"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting")
provides=("obs-studio=$pkgver")
conflicts=("obs-studio")
source=("$pkgname::git+https://github.com/obsproject/obs-studio.git"
        "git+https://github.com/Mixer/ftl-sdk.git"
        "git+https://github.com/obsproject/obs-browser.git"
        "hevc-vaapi.diff")
sha256sums=("SKIP" "SKIP" "SKIP" 
            "b277507b6589923382a039e01da7f28a0a8bce80e7ba282b5fd6d179b5431c7c")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd $pkgname
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update
  patch -p1 -i $srcdir/hevc-vaapi.diff
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_BROWSER=ON \
        -B build -S $pkgname
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2:sw=2:expandtab
