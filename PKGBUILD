# Forked from obs-studio-git
# Maintainer: Alice Gaudon <alice at gaudon dot pro>
# Contributor: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>
pkgname=obs-studio-git-with-browser
pkgver=24.0.3.570.g57b47ca90
pkgrel=2
pkgdesc="Free and open source software for video recording and live streaming."
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
            "python: Python scripting"
            "cef-minimal: Up-to-date browser backend")
provides=("obs-studio=$pkgver")
conflicts=("obs-studio")
source=("$pkgname::git+https://github.com/obsproject/obs-studio.git#branch=master"
       "git+https://github.com/Mixer/ftl-sdk.git")
md5sums=("SKIP" "SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd $pkgname
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git submodule init plugins/obs-browser
  git submodule update
}

build() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOBS_VERSION_OVERRIDE=$pkgver \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef" ..

  make
}

package() {
  cd $pkgname/build

  make install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2:expandtab
