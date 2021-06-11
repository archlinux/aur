# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: William Gathoye <william + archlinux at gathoye dot be>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

pkgbase=java-openjfx
pkgname=(
  java-openjfx
  java-openjfx-doc
  java-openjfx-src
)
_majorver=16
_minorver=0
_securityver=0
_updatever=8
#pkgver=${_majorver}.${_minorver}.${_securityver}.u${_updatever}
pkgver=${_majorver}.u${_updatever}
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} client application platform (open-source implementation of JavaFX)"
arch=(x86_64)
url=https://wiki.openjdk.java.net/display/OpenJFX/Main
license=(custom)
makedepends=(
  alsa-lib
  ant
  cairo
  cmake
  ffmpeg
  freetype2
  gradle
  gdk-pixbuf2
  glib2
  gperf
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
  ${pkgbase}-${pkgver//.u/+}::https://github.com/openjdk/jfx/archive/${pkgver//.u/+}/jfx-${pkgver//.u/+}.tar.gz
  gradle.properties
  https://services.gradle.org/distributions/gradle-6.3-bin.zip
  java-openjfx-flags.patch
  java-openjfx-no-xlocale.patch
  java-openjfx-gstreamer-lite-gcc10-compat.patch
)
sha256sums=('0cde9b8ce0902c71810f904ff58f48daedd98d8c958fd6fbcb7c2a65877f411a'
            '2622aa35d733cc69f4421f1cd053bf425e89f93141cb52c9f016a9b425fc0cb6'
            '038794feef1f4745c6347107b6726279d1c824f3fc634b60f86ace1e9fbd1768'
            'af52cd9fb252770b6886eef2720ca4b6c582f3719f8a28128c498681b457233c'
            '220c63396561867a6d07ae81b6390160d8f91502587e4873998e3b7a83793a1c'
            'd7f9db86854b1cb8ab973c2ff255e51a637b9c24af30144182202d33f01a9434')

prepare() {
  cd jfx-${pkgver//.u/-}

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java-openjfx-flags.patch
  patch -Np1 -i ../java-openjfx-no-xlocale.patch
  patch -Np1 -i ../java-openjfx-gstreamer-lite-gcc10-compat.patch
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  cd jfx-${pkgver//.u/-}

  ../gradle-6.3/bin/gradle zips
}

package_java-openjfx() {
  depends=(
    alsa-lib
    cairo
    ffmpeg
    gdk-pixbuf2
    glib2
    gtk2
    gtk3
    java-runtime-openjdk=${_majorver}
    libavcodec.so
    libavformat.so
    libfreetype.so
    libgl
    libx11
    libxtst
    pango
    qt5-base
    ruby
    unzip
    webkit2gtk
  )

  cd jfx-${pkgver//.u/-}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${_majorver}-openjdk,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/
  rm "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/lib/src.zip
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}"/usr/share/licenses/java-openjfx
}

package_java-openjfx-doc() {
  cd jfx-${pkgver//.u/-}

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java-openjfx
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-doc
}

package_java-openjfx-src() {
  cd jfx-${pkgver//.u/-}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${_majorver}-openjdk,share/licenses}
  install -m 644 build/sdk/lib/src.zip "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/javafx-src.zip
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-src
}

# vim: ts=2 sw=2 et:
