# Maintainer    zan <zan@420blaze.it>

pkgname=obs-hevc-vaapi-git
pkgver=26.0.0.rc1.r63.g0ba9b201a
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming. With VAAPI HEVC support."
arch=(i686 x86_64)
url="https://github.com/obsproject/obs-studio"
license=(GPL2)
depends=(ffmpeg jansson libxinerama qt5-x11extras mbedtls)
makedepends=(cmake git x264 jack vlc swig cef-minimal-3770)
optdepends=("libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "jack: JACK Support"
            "vlc: VLC Media Source"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting"
            "qt5-svg: svg support")
provides=("obs-studio=$pkgver")
conflicts=(obs-studio)
source=("$pkgname::git+https://github.com/obsproject/obs-studio.git"
        "git+https://github.com/Mixer/ftl-sdk.git"
        "git+https://github.com/obsproject/obs-browser.git"
        "hevc-vaapi.diff")
sha256sums=("SKIP" "SKIP" "SKIP" 
            "3244a2549e1fba1f8e451de4a2bb7d64a0a8f8af72a4096ae683c995dba524ea")

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
        -DCEF_ROOT_DIR="/opt/cef" \
        -B build -S $pkgname
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
