# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=openh264-git
pkgver=2.3.0.r5206.045aeac1
pkgrel=1
pkgdesc='OpenH264 is a codec library which supports H.264 encoding and decoding. (GIT version)'
arch=('x86_64' 'armv6h' 'armv7h')
url='http://www.openh264.org'
license=('BSD')
makedepends=('git'
             'nasm'
             'meson'
             )
checkdepends=('gtest')
provides=('libopenh264.so'
          "openh264=${pkgver}")
conflicts=('openh264')
source=('git+https://github.com/cisco/openh264.git'
        'esee'
        )
sha256sums=('SKIP'
            '83978429d53f118f685fc6921ac42cce2d04fb9eb2143f270a11e39702a8bea7'
            )

pkgver() {
  cd openh264
  _ver="$(cat codec/api/wels/codec_ver.h | grep -m3 -e 'OPENH264_MAJOR' -e 'OPENH264_MINOR' -e 'OPENH264_REVISION' | sed 's|OPENH264|OPENHTWOSIXFOUR|g' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d openh264 -p1 -i "${srcdir}/esee"
}

build() {
  arch-meson openh264 build
  meson compile -C build
}

check() {
  ( cd openh264/test/encoder_binary_comparison ; CFLAGS=-Werror ./run_PrepareAllTestData.sh 64 )
  meson test -C build -v
  cd openh264
  ./run_Test.sh BinaryCompare BA_MW_D.264
  ./run_Test.sh BinaryCompare Adobe_PDF_sample_a_1024x768_50Frms.264
  ./run_Test.sh BinaryCompare Zhling_1280x720.264
  }

package() {

  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 openh264/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

