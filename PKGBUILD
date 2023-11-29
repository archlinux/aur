# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: William Gathoye <william+archlinux@gathoye.be>
# Contributor: Emanuel Couto <emanuel.amaral.couto@gmail.com>
# Contributor: Richard Jackson <rdjack21@gmail.com>
# Contributor: Tinx <arch@tinx.eu>
# Contributor: Jens Kapitza <j.kapitza@schwarze-allianz.de>
# Contributor: Olli <olli@coderkun.de>

pkgbase=java11-openjfx
pkgname=(
  java11-openjfx
  java11-openjfx-doc
  java11-openjfx-src
)
pkgver=11.0.20.u1
pkgrel=1
pkgdesc='Java OpenJFX 11 client application platform (open-source implementation of JavaFX)'
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
  gradle7
  gtk2
  gtk3
  java-environment-openjdk=11
  libgl
  libx11
  libxtst
  pango
  python
  ruby
  unzip
  webkit2gtk
  zip
)
source=(
  ${pkgname}-${pkgver}.tar.gz::https://github.com/openjdk/jfx11u/archive/refs/tags/${pkgver//.u/+}.tar.gz
  gradle.properties
  java11-openjfx-flags.patch
  java11-openjfx-no-xlocale.patch
  java11-openjfx-gstreamer-lite-gcc10-compat.patch
  gcc-13-fixes.patch
)
b2sums=('d9ba25499812722b822a88a5f97a67f311aaf542b2d5e7eba54bce8d1a41650d39f91173f7ca2c28fa363a2afc64317950fae4217c26f27168565d04ae4fd276'
        'a77fd8814a5978827de01a652f7b945f3439df04606434ced8998c8d77a82985292490e6965299aeb52f9da3d8069b4091d75519bd4ec8a15f70bc6d28b13498'
        '191de086c12e4ae8fd901a06c6382891544d1a336c51dbd491c76c0ecff808c042a2117e3f25239768809a38cceddcb17c32331715cc2bbdd057fe307b908df3'
        '13216615c01b8d48d17889ffa22668c38568870d83ab30c542eb5b5620db305f02efb1acb99d9b5e89eb0a73a134bb336cb301f4de4e8855cae50efb099e384e'
        '119fa1cc5da2cdefa22bbe9b6f76581faa74e05fa7b6e5576470fc0251c6e257f122fbba03754cc01f7c7251145cfa1cab4ffc2f9d59ff0c175a121e943a0f64'
        'd9837d5953706accc84345e32ef5cf6af6d9123147fbc6680a27e8bf7d35086ba21ceadd471961e7a1a09d7467e15d78b6e65a2e14a400d6de5beafed7036979')

prepare() {
  cd jfx11u-${pkgver//.u/-}

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java11-openjfx-flags.patch
  patch -Np1 -i ../java11-openjfx-no-xlocale.patch
  patch -Np1 -i ../java11-openjfx-gstreamer-lite-gcc10-compat.patch
  patch -Np1 -i ../gcc-13-fixes.patch
}

build() {
  cd jfx11u-${pkgver//.u/-}

  # build against ffmpeg4.4
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  unset JAVA_TOOL_OPTIONS
  unset JDK_JAVA_OPTIONS
  unset _JAVA_OPTIONS
  export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
  export JDK_HOME='/usr/lib/jvm/java-11-openjdk'
  gradle zips
}

package_java11-openjfx() {
  depends=(
    java-runtime-openjdk=11
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
  provides=('java-openjfx=11')

  cd jfx11u-${pkgver//.u/-}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-11-openjfx,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib "${pkgdir}"/usr/lib/jvm/java-11-openjfx/
  rm "${pkgdir}"/usr/lib/jvm/java-11-openjfx/lib/src.zip
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/lib/jvm/java-11-openjfx/
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}"/usr/share/licenses/java11-openjfx
}

package_java11-openjfx-doc() {
  cd jfx11u-${pkgver//.u/-}

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java11-openjfx
  ln -s java11-openjfx "${pkgdir}"/usr/share/licenses/java11-openjfx-doc
}

package_java11-openjfx-src() {
  cd jfx11u-${pkgver//.u/-}

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-11-openjfx,share/licenses}
  install -m 644 build/sdk/lib/src.zip "${pkgdir}"/usr/lib/jvm/java-11-openjfx/javafx-src.zip
  ln -s java11-openjfx "${pkgdir}"/usr/share/licenses/java11-openjfx-src
}

# vim: ts=2 sw=2 et:
