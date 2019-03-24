# Maintainer: Salamandar <felix@piedallu.me>
pkgname=ar-sdk3-git
pkgver=r6.0da3c34
pkgrel=1
pkgdesc="The Parrot's AR SDK for Linux !"
arch=('any')
license=('GPL')
groups=('games')
depends=()
makedepends=(
  'git'
  'repo'
  'autoconf'
  'libtool'
  'avahi'
  'ffmpeg'
  'ncurses5-compat-libs'
  'ncurses'
  'mplayer'
)

url="https://github.com/Parrot-Developers"
source=()
sha256sums=()


prepare() {
  cd "${srcdir}"
  repo init -u "https://github.com/Parrot-Developers/arsdk_manifests.git"
  repo sync --force-sync
}


pkgver() {
    cd "${srcdir}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "${srcdir}"
   ./build.sh -p arsdk-native -t build-sdk -j
   # out/arsdk-native/staging
}

package() {
  cd "${srcdir}"

  cd "out/arsdk-native/staging"

  to_clean=(
    "native-wrapper.sh"
    "etc/build.prop"

    "usr/bin/openssl"
    "usr/bin/curl"
    "usr/bin/curl-config"
    "usr/include/json"
    "usr/include/json-c"
    "usr/include/curl"
    "usr/include/tar.h"
    "usr/include/libtar.h"
    "usr/include/libtar_listhash.h"
    "usr/include/openssl"

    "usr/lib/libcrypto.so"
    "usr/lib/libcurl.so"
    "usr/lib/libjson-c.so"
    "usr/lib/libssl.so"
    "usr/lib/libtar.so"
    "usr/lib/pkgconfig/json-c.pc"
    "usr/lib/pkgconfig/libcrypto.pc"
    "usr/lib/pkgconfig/libcurl.pc"
    "usr/lib/pkgconfig/libssl.pc"
    "usr/lib/pkgconfig/openssl.pc"
    "usr/share/aclocal/libcurl.m4"
    "usr/share/man"

  )
  rm -rf "${to_clean[@]}"

  cp -R . "${pkgdir}"

}
