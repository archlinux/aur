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
pkgver=23.0.2.u3
_jdk_buildversion="21"              # Which openjdk version used for building.  # ${pkgver%%.*}  # $(("${pkgver%%.*}"-1))
_jre_dependversion="${pkgver%%.*}"  # Which java version the installed package should depend on.
_ffmpegversion=""                   # Which ffmpeg version to use. Leave empty string for up to date version. Other possibilities e.g.: '4.4', '5.1', '6.1'.
pkgrel=2
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
  "ffmpeg${_ffmpegversion}"
  "freetype2"
  "gdk-pixbuf2"
  "glib2"
  "gperf"
  "gradle"
  # "gradle<9"
  "gtk2"
  "gtk3"
  "java-environment-openjdk=${_jdk_buildversion}" # Needs older version of jdk-openjdk.
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
sha256sums=('6636195d27d7a5ef27550bf4934d9199369cfd62c7fe0c16f825c78e59211d5e'
            'ff63de384c6c8a0b2c53703110cc794fcce24db857a0d4c852dbc80db5a79218'
            'a03696f7dfb71e3746b2a98af49c0fb54e5161e0aca60c43b31675402337b97e')

_jfxdir="jfx${pkgver%%.*}u-${pkgver//.u/-}"

prepare() {
  cd "${_jfxdir}"

  # Clean from potential previous runs
  gradle --stop
  rm -rf build
  gradle clean || true

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
  export PATH="/usr/lib/jvm/java-${_jdk_buildversion}-openjdk/bin/:$PATH"
  export JAVA_HOME="/usr/lib/jvm/java-${_jdk_buildversion}-openjdk"
  export JDK_HOME="/usr/lib/jvm/java-${_jdk_buildversion}-openjdk"

  if [ -n "${_ffmpegversion}" ]; then
    # build against ffmpeg${_ffmpegversion}
    export PKG_CONFIG_PATH="/usr/lib/ffmpeg${_ffmpegversion}/pkgconfig"
  fi

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
    "java-runtime-openjdk=${_jre_dependversion}"
    "java-openjfx-license=${pkgver%%.*}"
    "libgl"
    "libx11"
    "libxtst"
  )
  optdepends=(
    "ffmpeg${_ffmpegversion}: Media support"
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
