# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

# You may want to change this value if your target device is not API 19
_TARGET_API=19

_pkgname=fb-adb
pkgname=$_pkgname-git
pkgver=20170602.r363.b931596
pkgrel=1
pkgdesc='A better shell to use in place of adb when connecting to Android devices'
url='https://github.com/facebook/fb-adb'
license=('GPL3')
arch=('x86_64')
depends=('android-tools')
makedepends=('git' 'vim' 'android-sdk-build-tools' "android-platform-$_TARGET_API")
options=('!strip' '!buildflags')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # configure
  cd $_pkgname
  ./autogen.sh

  # build
  install -d build
  cd build
  ../configure \
      --enable-checking=yes \
      --with-android-sdk="$ANDROID_HOME" \
      --with-android-platform=android-$_TARGET_API
  make
}

package() {
  install -Dm755 $_pkgname/build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
