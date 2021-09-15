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
_majorver=17
_minorver=0
_securityver=0
_patchver=1
_updatever=1
pkgver=${_majorver}.${_minorver}.${_securityver}.${_patchver}.u${_updatever}
#pkgver=${_majorver}.u${_updatever}
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
  java-openjfx-flags.patch
  java-openjfx-no-xlocale.patch
  java-openjfx-gstreamer-lite-gcc10-compat.patch
)
sha256sums=('7398a87b1c1b593a2610ef84dd8b0fc31fc9a87dc5185ea4d1ef71b560920a5d'
            '2622aa35d733cc69f4421f1cd053bf425e89f93141cb52c9f016a9b425fc0cb6'
            '26a11b7f9bdba382de16fea691d01de270e79b055f765f7475294dd69605604c'
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

  gradle zips
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
  install -m 644 build/sdk/src.zip "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/javafx-src.zip
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-src
}

# vim: ts=2 sw=2 et:
