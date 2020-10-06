# Maintainer    zan <zan@420blaze.it>

pkgname=obs-hevc-vaapi-git
pkgver=26.0.1.r5.g3486c0b36
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming. With VAAPI HEVC support."
arch=(i686 x86_64)
url="https://github.com/obsproject/obs-studio"
license=(GPL2)
depends=(at-spi2-atk ffmpeg jansson libxinerama qt5-x11extras mbedtls libxrandr nss libxss)
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
            "f01073324e2a83f0925bc19902d3ce19835b445820d57ad531eb8f3ebbb53266")

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
