# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: William Gathoye <william + archlinux at gathoye dot be>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

pkgbase=java21-openjfx
pkgname=(
  java21-openjfx
  java21-openjfx-doc
  java21-openjfx-src
)
pkgver=21.0.4.u0
pkgrel=1
pkgdesc="Java OpenJFX client application platform (open-source implementation of JavaFX) - latest version"
arch=(x86_64 x86_64_v3)
url=https://wiki.openjdk.java.net/display/OpenJFX/Main
license=('GPL-2.0-only WITH Classpath-exception-2.0')
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
  java-environment-openjdk=17
  libgl
  libx11
  libxtst
  pango
  perl
  python
  qt5-base
  ruby
  unzip
  webkit2gtk
  zip
)
options=(!lto)
source=(
  "${pkgbase/${pkgver%%.*}/}-${pkgver//.u/+}.tar.gz::https://github.com/openjdk/jfx${pkgver%%.*}u/archive/refs/tags/${pkgver//.u/+}.tar.gz"
  gradle.properties
  java-openjfx-flags.patch
  java-openjfx-no-xlocale.patch
)
b2sums=('8fd41cde3a79ff409adf01690958ceaf9d802e2515f70faa9d1e409d81e86b96a9484d3a45d6abbe928ba315d8ff97fdd16137f7bc07275a2f4bef62b6471df7'
        'a77fd8814a5978827de01a652f7b945f3439df04606434ced8998c8d77a82985292490e6965299aeb52f9da3d8069b4091d75519bd4ec8a15f70bc6d28b13498'
        '609ffbc0938922f00ccebab6d1e9ab0d54b84f088f75c10c0eb4211ff1b33438481d76092eae8811a5e9f53dfc3ff422f7aa4e98abd8fc27fb73f1c3d4661c41'
        '13216615c01b8d48d17889ffa22668c38568870d83ab30c542eb5b5620db305f02efb1acb99d9b5e89eb0a73a134bb336cb301f4de4e8855cae50efb099e384e')

_jfxdir=jfx${pkgver%%.*}u-${pkgver//.u/-}

prepare() {
  cd $_jfxdir

  # Clean from potential previous runs
  gradle --stop
  rm -rf build
  #gradle clean

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java-openjfx-flags.patch
  patch -Np1 -i ../java-openjfx-no-xlocale.patch
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  cd $_jfxdir

  # Build with openjdk-17
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  # build against ffmpeg4.4
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  # Workaround for situation where the linker treats whitespace as arguments
  export LDFLAGS="${LDFLAGS//+([[:space:]]|[[:blank:]])/ }"

  gradle zips
}

package_java21-openjfx() {
  depends=(
    java-runtime-openjdk=${pkgver%%.*}
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
  provides=(java-openjfx=${pkgver%%.*})

  cd $_jfxdir

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${pkgver%%.*}-openjdk,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib "${pkgdir}"/usr/lib/jvm/java-${pkgver%%.*}-openjdk/
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/lib/jvm/java-${pkgver%%.*}-openjdk/
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}"/usr/share/licenses/"${pkgname}"
}

package_java21-openjfx-doc() {
  arch=(any)
  cd $_jfxdir

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/"${pkgbase}"
  ln -s "${pkgbase}" "${pkgdir}"/usr/share/licenses/"${pkgname}"
}

package_java21-openjfx-src() {
  arch=(any)
  cd $_jfxdir

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${pkgver%%.*}-openjdk,share/licenses}
  install -m 644 build/sdk/src.zip "${pkgdir}"/usr/lib/jvm/java-${pkgver%%.*}-openjdk/javafx-src.zip
  ln -s "${pkgbase}" "${pkgdir}"/usr/share/licenses/"${pkgname}"
}

# vim: ts=2 sw=2 et:
