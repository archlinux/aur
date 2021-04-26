# Maintainer: Hugo Denizart <hugo at denizart dot pro>
pkgname=obs-streamfx-git
pkgver=0.10.0.r0.g5888c7d
pkgrel=1
pkgdesc="Bring your stream back to life with modern effects!"
arch=("x86_64")
url="https://github.com/Xaymar/obs-StreamFX"
license=("GPL2")
# same dependencies as OBS Studio + ninja makedepends
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt5-x11extras" "curl" "gtk-update-icon-cache"
         "obs-studio>=25")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "ninja")
provides=("obs-streamfx")
conflicts=("obs-streamfx")
source=("$pkgname::git+https://github.com/Xaymar/obs-StreamFX.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule update --init --recursive
}

build() {
  cd $pkgname

  cmake -H. -B"build/flux" -G"Ninja" -DOBS_DOWNLOAD=ON -DCMAKE_PACKAGE_NAME=StreamFX -DCMAKE_PACKAGE_PREFIX="build/package" -DCMAKE_INSTALL_PREFIX="build/distrib" -DENABLE_UPDATER=FALSE -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc

  cmake --build "build/flux" --config RelWithDebInfo --target install
}

package() {
  cd $pkgname/build/distrib/plugins/StreamFX

  install -D -m 755 bin/64bit/StreamFX.so $pkgdir/usr/lib/obs-plugins/StreamFX.so

  mkdir -p $pkgdir/usr/share/obs/obs-plugins/StreamFX
  cp -R data/* $pkgdir/usr/share/obs/obs-plugins/StreamFX
  chmod 644 $pkgdir/usr/share/obs/obs-plugins/StreamFX/*/**/*
}

# vim: ts=2:sw=2:expandtab
