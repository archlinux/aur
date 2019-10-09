# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Guillaume Alaux <guillaume@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
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
_majorver=13
_minorver=0
_securityver=0
_updatever=14
#pkgver=${_majorver}.${_minorver}.${_securityver}.u${_updatever}
pkgver=${_majorver}.u${_updatever}
#_hg_tag=jdk-${_majorver}.${_minorver}.${_securityver}+${_updatever}
_hg_tag=${_majorver}+${_updatever}
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
  python2
  qt5-base
  ruby
  unzip
  webkit2gtk
  zip
)
source=(
  ${pkgbase}-${_hg_tag}::https://hg.openjdk.java.net/openjfx/${_majorver}-dev/rt/archive/${_hg_tag}.tar.bz2
  gradle.properties
  java-openjfx-flags.patch
  java-openjfx-no-xlocale.patch
)
sha256sums=('9958e615818c526250c36059ae6ba0c7523e192193c8b5d5ca672ebcd498f1ca'
            '2622aa35d733cc69f4421f1cd053bf425e89f93141cb52c9f016a9b425fc0cb6'
            'e76f202e8163a9a6e02138987bfc344a66f70aa30b8b699c6bdb41eec31c1465'
            '220c63396561867a6d07ae81b6390160d8f91502587e4873998e3b7a83793a1c')

prepare() {
  cd rt-${pkgver//.u/+}

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java-openjfx-flags.patch
  patch -Np1 -i ../java-openjfx-no-xlocale.patch
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  cd rt-${pkgver//.u/+}

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
    python2
    qt5-base
    ruby
    unzip
    webkit2gtk
  )

  cd rt-${pkgver//.u/+}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${_majorver}-openjdk,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/
  rm "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/lib/src.zip
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}"/usr/share/licenses/java-openjfx
}

package_java-openjfx-doc() {
  cd rt-${pkgver//.u/+}

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java-openjfx
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-doc
}

package_java-openjfx-src() {
  cd rt-${pkgver//.u/+}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${_majorver}-openjdk,share/licenses}
  install -m 644 build/sdk/lib/src.zip "${pkgdir}"/usr/lib/jvm/java-${_majorver}-openjdk/javafx-src.zip
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-src
}

# vim: ts=2 sw=2 et:
