# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Frederik “Freso” S. Olesen <archlinux@freso.dk> (https://aur.archlinux.org/account/Freso)
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Frederik Schwan <freswa at archlinux dot org> (https://aur.archlinux.org/account/freswa)
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: William Gathoye <william + archlinux at gathoye dot be>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

pkgbase="java-openjfx-nowebkit"
pkgname=(
  "java-openjfx-nowebkit"
  "java-openjfx-license"
  # "java-openjfx-doc"
  # "java-openjfx-src"
)
pkgver=23.0.1.u4
pkgrel=1
pkgdesc="Java OpenJFX client application platform (open-source implementation of JavaFX) - version following latest major Arch Linux OpenJDK java release. Build without WebKit support."
arch=(
  "x86_64"
  "x86_64_v3"
)
url="https://wiki.openjdk.java.net/display/OpenJFX/Main"
license=('GPL-2.0-only WITH Classpath-exception-2.0')
makedepends=(
  "alsa-lib"
  "ant"
  "cairo"
  "cmake"
  "ffmpeg4.4"
  "freetype2"
  "gdk-pixbuf2"
  "glib2"
  "gperf"
  "gradle<9"
  "gtk2"
  "gtk3"
  "java-environment-openjdk=$(("${pkgver%%.*}"-1))" # Needs older version of jdk-openjdk.
  # "java-environment-openjdk=${pkgver%%.*}"
  "libgl"
  "libx11"
  "libxtst"
  "libxxf86vm"
  "pango"
  "perl"
  "python"
  "qt5-base"
  "ruby"
  "unzip"
  # "webkit2gtk"
  "zip"
)
options=(!lto)
source=(
  "java-openjfx-${pkgver//.u/+}.tar.gz::https://github.com/openjdk/jfx${pkgver%%.*}u/archive/refs/tags/${pkgver//.u/+}.tar.gz"
  "gradle.properties"
  "java-openjfx-flags.patch"
)
b2sums=(
  '0710858040fe3930814e3fdd5c209c614e400ee1030961266407530baead0b4d7af3826cb2f711c651ad298c62f456b38123fcc2bc46db89adf3876489fb3ded'
  '0c023ef99e7ee600710c54dad0ad59070620595109ca42c5057fa2ab74ef6d244631745f5cd4c1bea9c0321ee69f1e1efaab820ff124ad1d4f453121e77fd14f'
  '5b6dafc22995b57564fda89aaedeb2b6ee58b2c635336ac43a123ea4ac6ced3a20eba39d99cc4eb7ec7b29fc7541f5c3bee454ee55ca79fd2d7ce5ef4ed65cd3'
)

_jfxdir="jfx${pkgver%%.*}u-${pkgver//.u/-}"

prepare() {
  cd "${_jfxdir}"

  # Clean from potential previous runs
  gradle --stop
  rm -rf build
  #gradle clean

  ln -svf ../gradle.properties .
  patch -Np1 --follow-symlinks -i ../java-openjfx-flags.patch
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  # Work around build failure due to warnings treated as error.
  _FIXWERROR="-Wno-error=incompatible-pointer-types"
  CFLAGS+=" ${_FIXWERROR}"
  CXXFLAGS+=" ${_FIXWERROR}"
  export CFLAGS
  export CXXFLAGS

  # Suppress errors with lld >= 17 due to undefined symbols.
  _FIXLDERROR="-Wl,--undefined-version"
  LDFLAGS+=" ${_FIXLDERROR}"
  export LDFLAGS

  cd "${_jfxdir}"

  # Build with openjdk-(current version minus 1)
  export PATH="/usr/lib/jvm/java-$((${pkgver%%.*}-1))-openjdk/bin/:$PATH"

  # build against ffmpeg4.4
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  
  # Workaround for situation where the linker treats whitespace as arguments
  export LDFLAGS="${LDFLAGS//+([[:space:]]|[[:blank:]])/ }"

  gradle zips
}

package_java-openjfx-nowebkit() {
  pkgdesc="Java OpenJFX client application platform (open-source implementation of JavaFX) - latest release version. Build without WebKit support."
  depends=(
    "freetype2"
    "glib2"
    "glibc"
    "java-runtime-openjdk=${pkgver%%.*}"
    "java-openjfx-license=${pkgver%%.*}"
    "libgl"
    "libx11"
    "libxtst"
  )
  optdepends=(
    'ffmpeg4.4: Media support'
    'gtk2: GTK2 support'
    'gtk3: GTK3 support'
    #'webkit2gtk: Web support'
    'java-openjfx-doc: For documentation of this software.'
    'java-openjfx-src: For the source code of this software.'
  )
  provides=(
    "java-openjfx=${pkgver%%.*}"
    "java-openjfx=${pkgver}"
  )

  cd "${_jfxdir}"

  install -dvm 755  "${pkgdir}"/usr/{lib/jvm/java-${pkgver%%.*}-openjdk,share/licenses}
  cp -dvr --no-preserve=ownership build/sdk/lib "${pkgdir}/usr/lib/jvm/java-${pkgver%%.*}-openjdk"/
  cp -dvr --no-preserve=ownership build/jmods "${pkgdir}/usr/lib/jvm/java-${pkgver%%.*}-openjdk"/

  ln -sv java-openjfx "${pkgdir}/usr/share/licenses/${pkgname}"  # TODO: If this package is (re)named to `java-openjfx` only, then remove this line.
}


package_java-openjfx-license() {
  pkgdesc="License for Java OpenJFX client application platform (open-source implementation of JavaFX) - version following latest major Arch Linux OpenJDK java release."
  arch=(
    "any"
  )
  optdepends=(
    "java-openjfx=${pkgver%%.*}: The software this license is for."
  )
  provides=(
    "${pkgname}=${pkgver%%.*}"
  )

  cd "${_jfxdir}"

  install -dvm 755  "${pkgdir}"/usr/share/licenses
  cp -dvr --no-preserve=ownership build/sdk/legal "${pkgdir}/usr/share/licenses/java-openjfx"
  install -vm 644 -t "${pkgdir}"/usr/share/licenses/java-openjfx  ADDITIONAL_LICENSE_INFO ASSEMBLY_EXCEPTION

  ln -sv java-openjfx "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_java-openjfx-doc() {
  pkgdesc="Documentation for Java OpenJFX client application platform (open-source implementation of JavaFX) - version following latest major Arch Linux OpenJDK java release."
  arch=(
    "any"
  )
  depends=(
    "java-openjfx-license=${pkgver%%.*}"
  )
  optdepends=(
    "java-openjfx=${pkgver%%.*}: The software this documentation is for."
  )
  provides=(
    "${pkgname}=${pkgver%%.*}"
  )

  cd "${_jfxdir}"

  install -dvm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dvr --no-preserve=ownership build/javadoc "${pkgdir}"/usr/share/doc/java-openjfx
  install -vm 644 -t "${pkgdir}"/usr/share/doc/java-openjfx  README.md UPDATING-VERSION.md WEBKIT-MEDIA-STUBS.md CONTRIBUTING.md

  ln -sv java-openjfx "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_java-openjfx-src() {
  pkgdesc="Source code for Java OpenJFX client application platform (open-source implementation of JavaFX) - version following latest major Arch Linux OpenJDK java release."
  arch=(any)
  depends=(
    "java-openjfx-license=${pkgver%%.*}"
  )
  optdepends=(
    "java-openjfx=${pkgver%%.*}: The software this source code is for."
  )
  provides=(
    "${pkgname}=${pkgver%%.*}"
  )

  cd "${_jfxdir}"

  install -dvm 755  "${pkgdir}"/usr/{lib/jvm/java-${pkgver%%.*}-openjdk,share/licenses}
  install -vm 644 build/sdk/src.zip "${pkgdir}"/usr/lib/jvm/java-${pkgver%%.*}-openjdk/javafx-src.zip

  ln -sv java-openjfx "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
