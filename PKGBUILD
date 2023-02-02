# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: William Gathoye <william + archlinux at gathoye dot be>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

pkgbase=java8-openjfx
pkgname=(
  java8-openjfx
  java8-openjfx-doc
  java8-openjfx-src
)
pkgver=8.u202
pkgrel=7
pkgdesc='Java OpenJFX 8 client application platform (open-source implementation of JavaFX)'
arch=(x86_64)
url=https://wiki.openjdk.java.net/display/OpenJFX/Main
license=(GPL)
makedepends=(
  alsa-lib
  cairo
  cmake
  ffmpeg4.4
  freetype2
  gdk-pixbuf2
  glib2
  gperf
  gtk2
  gtk3
  java-environment-openjdk=8
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
source=(
  https://hg.openjdk.java.net/openjfx/8u-dev/rt/archive/${pkgver//./}-ga.tar.bz2
  gradle.properties
  https://services.gradle.org/distributions/gradle-4.8-bin.zip
  java8-openjfx-flags.patch
  java8-openjfx-no-xlocale.patch
  java8-openjfx-no-sys-sysctl.patch
  java8-openjfx-CVE-2021-3517-fix.patch::https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2.patch
  java8-openjfx-CVE-2021-3522-fix.patch::https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/8a88e5c1db05ebadfd4569955f6f47c23cdca3c4.patch
  java8-openjfx-include-iterator.patch
  java8-openjfx-no-check-jfxrt-jar.patch
)
sha256sums=('12b0538d04c4bd451e4692ee06357ac36233ff4ec2af9fa3b9bbdbab48c3f2fc'
            'd1c2255893e5ec6268d7c92bb6539cde629d325872f26cffb5f1f616c9d5f30d'
            'f3e29692a8faa94eb0b02ebf36fa263a642b3ae8694ef806c45c345b8683f1ba'
            'a2e0d5ac5cdb83958d2886aef7f5a419f460e103959f65aaadd69cb26cc6adec'
            'b21f6b254acc7aa2124521b6521d3bdfdfcfd9b062624a84ef73608120957d0d'
            'cd1a2bd60f636662e4f3334217b3e14f1d51cf30b77b9ca3eff8d030312fd26a'
            '4db6e995d46f5ab29c4169dab5dbbe367ebd01dee66ef1750abe5cf0c8364d42'
            '3487eb180fff9866c8b8b08be45f13fa9e8edd04e5719bc867e59b09b81954b4'
            'bd69e8a3363f9b3ade50fb29d4c9e3d7e59b42472ae00d425d20ddcda720b919'
            '47822da975832551bc3b20b3d75891135314f89cfcb75f7212eece148902aea3')

prepare() {
  cd rt-${pkgver//./}-ga

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java8-openjfx-flags.patch
  patch -Np1 -i ../java8-openjfx-no-xlocale.patch
  patch -Np1 -i ../java8-openjfx-no-sys-sysctl.patch
  # loose match the following patch due to whitespace differences
  patch -Np1 -l -i "$srcdir"/java8-openjfx-CVE-2021-3517-fix.patch -d modules/web/src/main/native/Source/ThirdParty/libxml/src
  patch -Np1 -i "$srcdir"/java8-openjfx-CVE-2021-3522-fix.patch -d modules/media/src/main/native/gstreamer/gstreamer-lite/gst-plugins-base
  patch -Np1 -i ../java8-openjfx-include-iterator.patch
  patch -Np1 -i ../java8-openjfx-no-check-jfxrt-jar.patch
}

build() {
  cd rt-${pkgver//./}-ga

  # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  CFLAGS+=' -fcommon'
  # build against ffmpeg4.4
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  ../gradle-4.8/bin/gradle
}

package_java8-openjfx() {
  depends=(
    java-runtime-openjdk=8
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
  provides=('java-openjfx=8')

  cd rt-${pkgver//./}-ga

  install -dm 755  "${pkgdir}"/usr/lib/jvm/java-8-openjdk/jre
  cp -dr --no-preserve=ownership build/sdk/{bin,lib} "${pkgdir}"/usr/lib/jvm/java-8-openjdk/
  cp -dr --no-preserve=ownership build/sdk/rt/lib "${pkgdir}"/usr/lib/jvm/java-8-openjdk/jre/
}

package_java8-openjfx-doc() {
  cd rt-${pkgver//./}-ga

  install -dm 755 "${pkgdir}"/usr/share/doc
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java8-openjfx
}

package_java8-openjfx-src() {
  cd rt-${pkgver//./}-ga

  install -Dm 644 build/javafx-src.zip -t "${pkgdir}"/usr/lib/jvm/java-8-openjdk/
}

# vim: ts=2 sw=2 et:
