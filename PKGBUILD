# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=fb-adb
pkgname=$_pkgname-git
pkgver=20170417.r359.0cc0534
pkgrel=1
pkgdesc='A better shell to use in place of adb when connecting to Android devices'
url='https://github.com/facebook/fb-adb'
license=('GPL3')
arch=('x86_64')
depends=('android-tools')
makedepends=('git' 'vim' 'android-sdk-build-tools' 'android-platform-19')
options=('!strip' '!buildflags')
source=("git+$url.git"
        "fix-build.patch"::"https://github.com/facebook/fb-adb/pull/59.patch")
sha512sums=('SKIP'
            '9f18e251c864acd94d73357e2c8f48e29946498d46e04ac7d518844fea6f774ea066292f3068088bd46c1283d7a642abf52a270990d0fc0f909d10bd4c3053c3')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  patch -Np1 -i ../fix-build.patch
}

build() {
  # configure
  cd $_pkgname
  ./autogen.sh

  # build
  install -d build
  cd build
  ../configure --enable-checking=yes --with-android-sdk="$ANDROID_HOME"
  make
}

package() {
  install -Dm755 $_pkgname/build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
