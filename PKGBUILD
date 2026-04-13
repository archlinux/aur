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

# OpenJFX 25 ships gradle scripts that require Gradle 8.x (Project.exec()
# was removed in Gradle 9). System gradle is currently 9.x in Arch, so
# default to the bundled wrapper which pins gradle 8.14.2.
: ${_use_gradle_wrapper:=1}

pkgbase=java25-openjfx
pkgname=(
  java25-openjfx
  java25-openjfx-doc
  java25-openjfx-src
)
# Gradle 8.14.2 (required by JFX 25) cannot run on JDK 25 — it needs JDK <=24.
# We launch Gradle with JDK $_java_gradle_ver, then point JFX at JDK
# $_java_build_ver via $JDK_HOME for the actual JFX compilation.
_java_gradle_ver=21
_java_build_ver=25
_java_run_ver=25
_tag='25+29'
pkgver=${_tag//+/.}
pkgrel=1
pkgdesc="Java OpenJFX client application platform (open-source implementation of JavaFX) - latest version"
arch=(x86_64 x86_64_v3)
url='https://wiki.openjdk.java.net/display/OpenJFX/Main'
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
  gtk3
  java-environment-openjdk=$_java_gradle_ver
  java-environment-openjdk=$_java_build_ver
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
if (( !_use_gradle_wrapper )); then
  makedepends+=(gradle)
fi
options=(!lto)
source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/openjdk/jfx/archive/refs/tags/${_tag}.tar.gz"
  "${pkgbase}-gradle.properties"
  "${pkgbase}-flags.patch"
  "${pkgbase}-profile"{.sh,.csh}
  "${pkgbase}-env.sh"
)
b2sums=('f2c669b10c23d291ed9fbada59cd21ee25b4cebf429c712c1a24f20ffc08102840091ebb5f4c35da53a18d67b45d8f9a37d7a40172b2fa7637950a30cfcdd105'
        '0c023ef99e7ee600710c54dad0ad59070620595109ca42c5057fa2ab74ef6d244631745f5cd4c1bea9c0321ee69f1e1efaab820ff124ad1d4f453121e77fd14f'
        '5b6dafc22995b57564fda89aaedeb2b6ee58b2c635336ac43a123ea4ac6ced3a20eba39d99cc4eb7ec7b29fc7541f5c3bee454ee55ca79fd2d7ce5ef4ed65cd3'
        '490b45c4761248cad1e9194566f80c6fa2155268653bb758224b214d86fc92735d893332fc5dfdf914ac58a770491193cf5f9a9bd67f018b81122965bbc0d684'
        'f0afa911a4e705b9cb0a9d8837247cede3e8854afc10c955c9a21d04082f6698f5d795865ddea147ce3047f2efb9e756f4c7b9cd6df762b40e1be1cbf16ebd38'
        '5e706a82299b464aef4563f634f6820e28187f6c7d50d3dd32882c951a990970cd3204103585981cbab6d3a57f53fdcfdb227ef81b2bc07fc3c537020d0adaa1')

_jfxdir="jfx-${_tag//+/-}"
if (( _use_gradle_wrapper )); then
  _gradle=(sh ./gradlew)
else
  _gradle=(gradle)
fi

prepare() {
  cd $_jfxdir

  # Clean from potential previous runs
  "${_gradle[@]}" --stop
  rm -rf build buildSrc/build

  ln -sf "../${pkgbase}-gradle.properties" 'gradle.properties'
  patch -Np1 -i "../${pkgbase}-flags.patch"
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  cd $_jfxdir

  # Run Gradle on openjdk $_java_gradle_ver (Gradle 8.x cannot run on JDK 25),
  # but compile JavaFX itself against openjdk $_java_build_ver via JDK_HOME
  # (jfx/build.gradle picks up JDK_HOME for JAVA, JAVAC, JAVADOC, JMOD).
  export PATH="/usr/lib/jvm/java-$_java_gradle_ver-openjdk/bin/:$PATH"
  export JDK_HOME="/usr/lib/jvm/java-$_java_build_ver-openjdk"

  # Workaround for situation where the linker treats whitespace as arguments
  export LDFLAGS="${LDFLAGS//+([[:space:]]|[[:blank:]])/ }"

  export CFLAGS+=" -Wno-error=implicit-function-declaration"

  "${_gradle[@]}" --no-daemon zips
}

package_java25-openjfx() {
  depends=(
    "java-runtime-openjdk>=$_java_run_ver"
    libgl
    libx11
    libxtst
  )
  optdepends=('gtk3: GTK3 support')
  provides=(java-openjfx=${pkgver%%.*})
  conflicts=(java-openjfx)

  cd $_jfxdir

  # archlinux-java-run discovers JFX at /usr/lib/jvm/java-${major}-openjfx/lib/
  # — install JARs and native libs there so things like pdfsam find us.
  local _jfxroot="usr/lib/jvm/java-${_java_run_ver}-openjfx"
  install -dm 755 "${pkgdir}/${_jfxroot}/lib" "${pkgdir}/usr/share/licenses"
  cp -dr --no-preserve=ownership build/sdk/lib/*.jar "${pkgdir}/${_jfxroot}/lib/"
  cp -dr --no-preserve=ownership build/sdk/lib/*.so "${pkgdir}/${_jfxroot}/lib/"
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}/${_jfxroot}/jmods"
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}/usr/share/licenses/$pkgbase"

  install -Dm644 "${srcdir}/${pkgbase}-profile"{.sh,.csh} -t "${pkgdir}/etc/profile.d"
  install -Dm755 "${srcdir}/${pkgbase}-env.sh" "${pkgdir}/usr/bin/${pkgbase}-env"
}

package_java25-openjfx-doc() {
  arch=(any)
  provides=(java-openjfx-doc=${pkgver%%.*})
  conflicts=(java-openjfx-doc)

  cd $_jfxdir

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}/usr/share/doc/$pkgbase"
  ln -s "$pkgbase" "${pkgdir}/usr/share/licenses/$pkgbase-doc"
}

package_java25-openjfx-src() {
  arch=(any)
  provides=(java-openjfx-src=${pkgver%%.*})
  conflicts=(java-openjfx-src)

  cd $_jfxdir

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-$_java_build_ver-openjdk,share/licenses}
  install -m 644 build/sdk/src.zip "${pkgdir}/usr/lib/jvm/java-$_java_build_ver-openjdk/javafx-src.zip"
  ln -s "$pkgbase" "${pkgdir}/usr/share/licenses/$pkgbase-src"
}

# vim: ts=2 sw=2 et:
