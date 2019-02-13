# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=openh264-git
pkgver=1.9.0.r4916.c81d7f67
pkgrel=1
pkgdesc="Open Source H.264 Codec"
arch=('x86_64' 'armv6h' 'armv7h')
url='http://www.openh264.org'
license=('BSD')
makedepends=('git'
             'nasm'
             )
provides=('openh264')
conflicts=('openh264')
source=('git+https://github.com/cisco/openh264.git')
sha256sums=('SKIP')

pkgver() {
  cd openh264
  _ver="$(cat codec/api/svc/codec_ver.h | grep -m3 -e 'OPENH264_MAJOR' -e 'OPENH264_MINOR' -e 'OPENH264_REVISION' | sed 's|OPENH264|OPENHTWOSIXFOUR|g' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  make -C openh264 PREFIX="/usr"
}

package() {
  cd openh264
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm755 h264dec "$pkgdir/usr/bin/h264dec"
  install -Dm755 h264enc "$pkgdir/usr/bin/h264enc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

