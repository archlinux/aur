# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
# Contributor: Hugo Denizart <hugo at denizart dot pro>
_pkgname=obs-streamfx
pkgname=$_pkgname-unstable
pkgver=0.12.0a170
pkgrel=1
pkgdesc="Bring your stream back to life with modern effects! (unstable/testing version)"
arch=("x86_64")
url="https://github.com/Xaymar/obs-StreamFX"
license=("GPL2")
# same dependencies as OBS Studio + nlohmann-json + ninja makedepends
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt5-x11extras" "curl" "gtk-update-icon-cache"
         "obs-studio>=28" "nlohmann-json")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "ninja")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/Xaymar/obs-StreamFX.git#tag="$pkgver)
md5sums=('SKIP')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname

  cmake -H. -B"build/flux" -G"Ninja" -DCMAKE_INSTALL_PREFIX="build/distrib" -DENABLE_UPDATER=FALSE -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc

  cmake --build "build/flux" --config RelWithDebInfo --target install
}

package() {
  cd $_pkgname/build/distrib/plugins/StreamFX

  install -D -m 755 bin/64bit/StreamFX.so $pkgdir/usr/lib/obs-plugins/StreamFX.so

  mkdir -p $pkgdir/usr/share/obs/obs-plugins/StreamFX
  cp -R data/* $pkgdir/usr/share/obs/obs-plugins/StreamFX
  chmod u=rwX,g=rX,o=rX $pkgdir/usr/share/obs/obs-plugins/StreamFX/*/**/*
}

# vim: ts=2:sw=2:expandtab
