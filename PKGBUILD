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

pkgbase=java-openjfx
pkgname=(
  java-openjfx
  java-openjfx-doc
  java-openjfx-src
)
pkgver=22.0.1.u7
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
  'gradle<9'
  gtk2
  gtk3
  java-environment-openjdk=$((${pkgver%%.*}-1))
  libgl
  libx11
  libxtst
  libxxf86vm
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
  "${pkgbase}-${pkgver//.u/+}.tar.gz::https://github.com/openjdk/jfx${pkgver%%.*}u/archive/refs/tags/${pkgver//.u/+}.tar.gz"
  gradle.properties
  java-openjfx-flags.patch
)
b2sums=('bedd7feaa9967053399e400efad60208c9eb8e49518922e6b9b2a041232689039f40ce091f04748540d7f19ba6ef6bd926b38657ceb802325d3643e879f7b45d'
        'a77fd8814a5978827de01a652f7b945f3439df04606434ced8998c8d77a82985292490e6965299aeb52f9da3d8069b4091d75519bd4ec8a15f70bc6d28b13498'
        '5b6dafc22995b57564fda89aaedeb2b6ee58b2c635336ac43a123ea4ac6ced3a20eba39d99cc4eb7ec7b29fc7541f5c3bee454ee55ca79fd2d7ce5ef4ed65cd3')

_jfxdir=jfx${pkgver%%.*}u-${pkgver//.u/-}

prepare() {
  cd $_jfxdir

  # Clean from potential previous runs
  gradle --stop
  rm -rf build
  #gradle clean

  ln -sf ../gradle.properties .
  patch -Np1 -i ../java-openjfx-flags.patch
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  cd $_jfxdir

  # Build with openjdk-(current version minus 1)
  export PATH="/usr/lib/jvm/java-$((${pkgver%%.*}-1))-openjdk/bin/:$PATH"

  # build against ffmpeg4.4
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  
  # Workaround for situation where the linker treats whitespace as arguments
  export LDFLAGS="${LDFLAGS//+([[:space:]]|[[:blank:]])/ }"

  gradle zips
}

package_java-openjfx() {
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
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}"/usr/share/licenses/java-openjfx
}

package_java-openjfx-doc() {
  arch=(any)
  cd $_jfxdir

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java-openjfx
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-doc
}

package_java-openjfx-src() {
  arch=(any)
  cd $_jfxdir

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-${pkgver%%.*}-openjdk,share/licenses}
  install -m 644 build/sdk/src.zip "${pkgdir}"/usr/lib/jvm/java-${pkgver%%.*}-openjdk/javafx-src.zip
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-src
}

# vim: ts=2 sw=2 et:
