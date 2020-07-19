# Maintainer: Jeremy Kescher <jeremy@kescher.at>
pkgname=obs-studio-liushui-git
pkgver=25.0.7.r454.gb3733a43
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming - liushuiproject fork"
arch=("i686" "x86_64")
url="https://github.com/liushuiproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt5-x11extras" "curl" "gtk-update-icon-cache" "gconf" "nss" "libxss" "pango" "atk" "libxrandr" "libxcomposite")
makedepends=("make" "cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "cef-minimal-3770")
optdepends=("libfdk-aac: FDK AAC codec support"
            "jack: JACK Support"
            "vlc: VLC Media Source"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting")
provides=("obs-studio=$pkgver")
conflicts=("obs-studio")
source=("$pkgname::git+https://github.com/liushuiproject/obs-studio.git#branch=master"
        "git+https://github.com/Mixer/ftl-sdk.git"
        "git+https://github.com/liushuiproject/obs-browser.git"
        "git+https://github.com/liushuiproject/obs-text-pango.git"
        "git+https://github.com/obsproject/obs-vst.git")
md5sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd $pkgname
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-text-pango.url $srcdir/obs-text-pango
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git submodule update
}

build() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef" \
    -DOBS_VERSION_OVERRIDE=$pkgver ..

  make
}

package() {
  cd $pkgname/build

  make install DESTDIR="$pkgdir"
}
