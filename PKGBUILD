# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: William Gathoye <william + archlinux at gathoye dot be>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

pkgbase=java17-openjfx
pkgname=(
  java17-openjfx
  java17-openjfx-doc
  java17-openjfx-src
)
pkgver=17.0.3.u1
pkgrel=1
pkgdesc="Java OpenJFX 17 client application platform (open-source implementation of JavaFX)"
arch=(x86_64)
url=https://wiki.openjdk.java.net/display/OpenJFX/Main
license=(custom)
makedepends=(
  alsa-lib
  ant
  cairo
  cmake
  ffmpeg4.4
  freetype2
  gdk-pixbuf2
  glib2
  gperf
  gradle
  gtk2
  gtk3
  java-environment-openjdk=11
  libgl
  libx11
  libxtst
  pango
  python
  qt5-base
  ruby
  unzip
  webkit2gtk
  zip
)
source=(
  # https://github.com/openjdk/jfx/archive/refs/tags/jfx-${pkgver//.u/+}.tar.gz
  ${pkgname}-${pkgver}.tar.gz::https://github.com/openjdk/jfx17u/archive/refs/tags/${pkgver//.u/+}.tar.gz
  gradle.properties
  java-openjfx-flags.patch
  java-openjfx-no-xlocale.patch
  java-openjfx-gstreamer-lite-gcc10-compat.patch
)
b2sums=('4feb7e6c066fa2f9bb81f5959bfb6168122bf273ef451814e3f3fac49fc30babef7a3abbafeaeb211beb556c0c1e7f45fa48db8671fecdbd98293bdd03f26158'
        'a77fd8814a5978827de01a652f7b945f3439df04606434ced8998c8d77a82985292490e6965299aeb52f9da3d8069b4091d75519bd4ec8a15f70bc6d28b13498'
        '2bc0cd6945ac33c882d56beb8abaa26bde038ebf25badb6e8f8af301449e7d56c2f795159d57ef2ccc8f5504bb8466e00445e65ff09519d9c6132e1b7dc6f4b5'
        '13216615c01b8d48d17889ffa22668c38568870d83ab30c542eb5b5620db305f02efb1acb99d9b5e89eb0a73a134bb336cb301f4de4e8855cae50efb099e384e'
        '119fa1cc5da2cdefa22bbe9b6f76581faa74e05fa7b6e5576470fc0251c6e257f122fbba03754cc01f7c7251145cfa1cab4ffc2f9d59ff0c175a121e943a0f64')

prepare() {
  # cd jfx-${pkgver//.u/-}
  cd jfx17u-${pkgver//.u/-}

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java-openjfx-flags.patch
  patch -Np1 -i ../java-openjfx-no-xlocale.patch
  patch -Np1 -i ../java-openjfx-gstreamer-lite-gcc10-compat.patch
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  # cd jfx-${pkgver//.u/-}
  cd jfx17u-${pkgver//.u/-}

  # build against ffmpeg4.4
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  gradle zips
}

package_java17-openjfx() {
  depends=(
    java-runtime-openjdk=17
    libgl
    libx11
    libxtst
  )
  optdepends=(
    'ffmpeg4.4: Media support',
    'gtk2: GTK2 support',
    'gtk3: GTK3 support',
    'webkit2gtk: Web support'
  )
  provides=(java-openjfx=17)

  # cd jfx-${pkgver//.u/-}
  cd jfx17u-${pkgver//.u/-}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-17-openjdk,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib "${pkgdir}"/usr/lib/jvm/java-17-openjdk/
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/lib/jvm/java-17-openjdk/
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}"/usr/share/licenses/java17-openjfx
}

package_java17-openjfx-doc() {
  # cd jfx-${pkgver//.u/-}
  cd jfx17u-${pkgver//.u/-}

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java17-openjfx
  ln -s java17-openjfx "${pkgdir}"/usr/share/licenses/java17-openjfx-doc
}

package_java17-openjfx-src() {
  # cd jfx-${pkgver//.u/-}
  cd jfx17u-${pkgver//.u/-}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-17-openjdk,share/licenses}
  install -m 644 build/sdk/src.zip "${pkgdir}"/usr/lib/jvm/java-17-openjdk/javafx-src.zip
  ln -s java17-openjfx "${pkgdir}"/usr/share/licenses/java17-openjfx-src
}

# vim: ts=2 sw=2 et:
