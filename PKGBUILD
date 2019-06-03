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
pkgver=11.0.3.u1
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
  ffmpeg
  freetype2
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
  https://hg.openjdk.java.net/openjfx/11/rt/archive/${pkgver//.u/+}.tar.bz2
  gradle.properties
  https://services.gradle.org/distributions/gradle-4.8-bin.zip
  java-openjfx-flags.patch
  java-openjfx-no-xlocale.patch
)
sha256sums=('c4a42e9f7ac94ca3b05b363375f782bc79be9446bee23eb94e6175a97b5262ae'
            '2622aa35d733cc69f4421f1cd053bf425e89f93141cb52c9f016a9b425fc0cb6'
            'f3e29692a8faa94eb0b02ebf36fa263a642b3ae8694ef806c45c345b8683f1ba'
            '62d7356654b541a9f868cc7beb185e64a1375d9a734b906ba00eacbee258d16e'
            '220c63396561867a6d07ae81b6390160d8f91502587e4873998e3b7a83793a1c')

prepare() {
  cd rt-${pkgver//.u/+}

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java-openjfx-flags.patch
  patch -Np1 -i ../java-openjfx-no-xlocale.patch
}

build() {
  cd rt-${pkgver//.u/+}

  ../gradle-4.8/bin/gradle zips
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
    java-runtime-openjdk=11
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

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-11-openjdk,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib "${pkgdir}"/usr/lib/jvm/java-11-openjdk/
  rm "${pkgdir}"/usr/lib/jvm/java-11-openjdk/lib/src.zip
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/lib/jvm/java-11-openjdk/
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

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-11-openjdk,share/licenses}
  install -m 644 build/sdk/lib/src.zip "${pkgdir}"/usr/lib/jvm/java-11-openjdk/javafx-src.zip
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-src
}

# vim: ts=2 sw=2 et:
