# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

# You may want to change this value if your target device is not API 19
_TARGET_API=19

_pkgname=fb-adb
pkgname=$_pkgname-git
pkgver=20170602.r363.b931596
pkgrel=6
pkgdesc='A better shell to use in place of adb when connecting to Android devices'
url='https://github.com/facebook/fb-adb'
license=('GPL3')
arch=('x86_64')
depends=('android-tools')
makedepends=('git' 'vim' 'android-sdk-build-tools' "android-platform-$_TARGET_API" 'android-ndk' 'python')
options=('!strip' '!buildflags')
source=("git+$url.git"
        'no-file-offset-bits-64.patch')
sha512sums=('SKIP'
            '17379e48d9a881c2af33d01fa4df5c4969ebe89ffa442809c6215b517a3943b61d2a1b3e7675470282e41e758d464fa8e420b01c6060e3be57704e7469340b87')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  patch -Np1 -i ../no-file-offset-bits-64.patch

  autoreconf -ifv
}

build() {
  # configure
  cd $_pkgname
  ./autogen.sh

  # In case that this package is built immediately after installing android-sdk...
  [ -z "$ANDROID_HOME" ] && export ANDROID_HOME=/opt/android-sdk
  # And NDK...
  [ -z "$ANDROID_NDK" ] && export ANDROID_NDK=/opt/android-ndk

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
