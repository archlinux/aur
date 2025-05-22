# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
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
_java_ver=23
_tag='25+18'
pkgver=${_tag//+/.}
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
  ffmpeg
  freetype2
  gdk-pixbuf2
  glib2
  gperf
  gradle
  gtk3
  java-environment-openjdk=$_java_ver
  libgl
  libx11
  libxtst
  libxxf86vm
  pango
  perl
  python
  unzip
  zip
  #ruby
  #ruby-getoptlong
  #ruby-optparse
  #ruby-erb
  #ruby-yaml
  #ruby-fileutils
)
options=(!lto)
source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/openjdk/jfx/archive/refs/tags/${_tag}.tar.gz"
  gradle.properties
  "${pkgbase}-flags.patch"
)
b2sums=('f6cf99d177e03a0405d38300167397f9565d913d47804f2532d6589f81703d0d1a557216fc20715fae9d8dd50198cf170308b79c090b49f9d2194b9a50c79bff'
        '0c023ef99e7ee600710c54dad0ad59070620595109ca42c5057fa2ab74ef6d244631745f5cd4c1bea9c0321ee69f1e1efaab820ff124ad1d4f453121e77fd14f'
        '5b6dafc22995b57564fda89aaedeb2b6ee58b2c635336ac43a123ea4ac6ced3a20eba39d99cc4eb7ec7b29fc7541f5c3bee454ee55ca79fd2d7ce5ef4ed65cd3')

_jfxdir="jfx-${_tag//+/-}"

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
  export PATH="/usr/lib/jvm/java-$_java_ver-openjdk/bin/:$PATH"

  # Workaround for situation where the linker treats whitespace as arguments
  export LDFLAGS="${LDFLAGS//+([[:space:]]|[[:blank:]])/ }"

  gradle --no-daemon zips
}

package_java-openjfx() {
  depends=(
    java-runtime-openjdk=$_java_ver
    libgl
    libx11
    libxtst
  )
  optdepends=('gtk3: GTK3 support')
  provides=(java-openjfx=${pkgver%%.*})

  cd $_jfxdir

  install -dm 755  "${pkgdir}"/usr/{lib/$pkgbase,share/java/$pkgbase,share/licenses}
  cp -dr --no-preserve=ownership build/sdk/lib/*.jar "${pkgdir}"/usr/share/java/$pkgbase/
  cp -dr --no-preserve=ownership build/sdk/lib/*.so "${pkgdir}"/usr/lib/$pkgbase/
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}"/usr/share/java/$pkgbase/
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

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-$_java_ver-openjdk,share/licenses}
  install -m 644 build/sdk/src.zip "${pkgdir}"/usr/lib/jvm/java-$_java_ver-openjdk/javafx-src.zip
  ln -s java-openjfx "${pkgdir}"/usr/share/licenses/java-openjfx-src
}

# vim: ts=2 sw=2 et:
