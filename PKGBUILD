# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andrew Rabert <ar@nullsum.net>

pkgname=scrcpy-full-git
pkgver=v2.1.1.r5.gfcdf847
pkgrel=1
pkgdesc='Display and control your Android device'
arch=(x86_64)
url='https://github.com/Genymobile/scrcpy'
license=(Apache)
depends=(android-tools ffmpeg sdl2)
provides=(scrcpy)
conflicts=(scrcpy)
makedepends=(meson android-platform android-sdk-build-tools)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd scrcpy
  git describe --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/scrcpy/server

  export ANDROID_PLATFORM=$(ls /opt/android-sdk/platforms | head -n 1 | sed "s/android-//g")
  export ANDROID_BUILD_TOOLS=$(ls /opt/android-sdk/build-tools | head -n 1)
  export ANDROID_HOME=/opt/android-sdk

  sed -i "s/^SCRCPY_VERSION_NAME=.*$/SCRCPY_VERSION_NAME=$pkgver/" build_without_gradle.sh

  sh build_without_gradle.sh

  cd $srcdir/scrcpy

  sed -i "s/^\(\s\+\)version: .*$/version: '$pkgver',/" meson.build
  mkdir -p build
  arch-meson build . \
    -D b_lto=true \
    -D b_ndebug=true \
    -D prebuilt_server=./server/build_manual/scrcpy-server \
    --buildtype release
  ninja -C build
}

package() {
  cd $srcdir/scrcpy
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
