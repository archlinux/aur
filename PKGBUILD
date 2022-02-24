# Maintainer: Humorhenker <paul@roteserver.de>
# Contributors: Nigel Kukard <nkukard@LBSD.net> zan <zan@420blaze.it>

pkgname=obs-hevc-vaapi-git
pkgver=27.2.0.r33.g0dbae4ebe
pkgrel=2
pkgdesc="Free and open source software for video recording and live streaming. With VAAPI HEVC support."
arch=(i686 x86_64)
url="https://github.com/obsproject/obs-studio"
license=(GPL2)
depends=(at-spi2-atk ffmpeg jansson libxinerama qt5-x11extras mbedtls libxrandr nss libxss)
makedepends=(cmake git x264 jack vlc-luajit swig cef-minimal pipewire)
optdepends=("libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "jack: JACK Support"
            "vlc-luajit: VLC Media Source"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting"
            "qt5-svg: svg support")
provides=("obs-studio=$pkgver")
conflicts=(obs-studio)
source=("$pkgname::git+https://github.com/obsproject/obs-studio.git#branch=master"
        "git+https://github.com/Mixer/ftl-sdk.git"
        "git+https://github.com/obsproject/obs-browser.git"
        "git+https://github.com/obsproject/obs-vst.git"
        "hevc-vaapi.diff"
        "fix_python_binary_loading.patch")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP"
            "c4322d8ec5247a7b3f95a124e9312033ceeb11fa379ee8a887f60a01b3fbd0e9"
            "bdfbd062f080bc925588aec1989bb1df34bf779cc2fc08ac27236679cf612abd")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd $pkgname
  patch -Np1 < $srcdir/fix_python_binary_loading.patch
  patch -p1 -i $srcdir/hevc-vaapi.diff
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git submodule update
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_BROWSER=ON \
        -DCEF_ROOT_DIR="/opt/cef" \
        -B build -S $pkgname
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
