# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=fb-adb
pkgname=$_pkgname-git
pkgver=20150609.r211.d3bfb7f
pkgrel=1
pkgdesc='A better shell to use in place of adb when connecting to Android devices'
url='https://github.com/facebook/fb-adb'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('android-tools')
makedepends=('git' 'prelink' 'zip' 'vim')
options=('!strip' '!buildflags')
install=$pkgname.install
_ndkver=10d
source=("git+$url.git")
sha512sums=('SKIP')
sha512sums=('SKIP')

[[ -z "$ANDROID_NDK" ]] && {
  source_i686+=("android-ndk-r$_ndkver-linux-i686.bin::http://dl.google.com/android/ndk/android-ndk-r$_ndkver-linux-x86.bin")
  source_x86_64+=("http://dl.google.com/android/ndk/android-ndk-r$_ndkver-linux-$CARCH.bin")
  sha512sums_i686+=('8d66229f6f07d6fba00650a96267c3c4a8308d296d9f13aa359af34ad49f57ba3a02e39f14d2b04609816e5f28ed939e71024043a0f08dc3711895a42e39f771')
  sha512sums_x86_64+=('b2ba10d7757ed7189b4e6dc2ecd38fce0c32dc6701151542b9e225e890faee84dded30dd4e907b0e42473e2a6df8ef4d46f37514edc270a04e1129d9c9e677fa')
}

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  [[ -z "$ANDROID_NDK" ]] \
      && export ANDROID_NDK="$srcdir/android-ndk-r$_ndkver"

  # configure
  cd $_pkgname
  ./autogen.sh

  # build
  install -d build
  cd build
  ../configure
  make

  # compress android deployment binary
  cd stub-arm
  zip $_pkgname-android-arm.zip $_pkgname
}

package() {
  install -Dm755 $_pkgname/build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 $_pkgname/build/stub-arm/$_pkgname-android-arm.zip "$pkgdir/usr/share/$_pkgname/$_pkgname-android-arm-$pkgver.zip"
  printf '%s\n' "Extract '$_pkgname-android-arm-${pkgver}.zip' and copy 'fb-adb' to '/system/bin/fb-adb' on your Android device" > "$pkgdir/usr/share/$_pkgname/README"
}
