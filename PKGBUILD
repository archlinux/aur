# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=fb-adb
pkgname=$_pkgname-git
pkgver=20160606.r344.84abb4d
pkgrel=1
pkgdesc='A better shell to use in place of adb when connecting to Android devices'
url='https://github.com/facebook/fb-adb'
license=('GPL3')
arch=('x86_64')
depends=('android-tools')
makedepends=('git' 'vim' 'android-sdk-build-tools')
options=('!strip' '!buildflags')
source=("git+$url.git")
sha512sums=('SKIP')
sha512sums=('SKIP')
_ndkver=12
_sdkver=24.4.1

if [[ -z "$ANDROID_NDK" ]]; then
  source_x86_64+=("http://dl.google.com/android/repository/android-ndk-r$_ndkver-linux-x86_64.zip")
  sha512sums_x86_64+=('1c47dcdc2c4ae1c0e5dd5c1ac349e043fa186f238c9cbfed567dcc9deb0b1d597c985611303f688f7c561144c26cdc9e471fb20c5447cd799ec883ba63aa2472')
fi

if [[ -z "$ANDROID_SDK" ]]; then
  source+=("https://dl.google.com/android/android-sdk_r$_sdkver-linux.tgz")
  sha512sums+=('96fb71d78a8c2833afeba6df617edcd6cc4e37ecd0c3bec38c39e78204ed3c2bd54b138a56086bf5ccd95e372e3c36e72c1550c13df8232ec19537da93049284')
fi

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -z "$ANDROID_SDK" ]]; then
    cd android-sdk-linux
    ln -sf /opt/android-sdk/build-tools build-tools
    (while :; do printf '%s\n' 'y'; sleep 2; done) | ./tools/android update sdk --no-ui
  fi
}

build() {
  if [[ -z "$ANDROID_NDK" ]]; then
    export ANDROID_NDK="$srcdir/android-ndk-r$_ndkver"
  fi

  if [[ -z "$ANDROID_SDK" ]]; then
    export ANDROID_SDK="$srcdir/android-sdk-linux"
  fi

  # configure
  cd $_pkgname
  ./autogen.sh

  # build
  install -d build
  cd build
  ../configure --enable-checking=yes
  make
}

package() {
  install -Dm755 $_pkgname/build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
