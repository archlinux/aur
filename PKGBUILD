# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_use_gradle_wrapper:=0}

_java_ver=24
pkgbase=java${_java_ver}-openjfx
pkgname=(
  java${_java_ver}-openjfx
  java${_java_ver}-openjfx-doc
  java${_java_ver}-openjfx-src
)
_tag='27+2'
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
if (( !_use_gradle_wrapper )); then
  makedepends+=(gradle)
fi
options=(!lto)
source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/openjdk/jfx/archive/refs/tags/${_tag}.tar.gz"
  "${pkgbase}-gradle.properties"
  "${pkgbase}-flags.patch"
  "${pkgbase}-env.sh"
)
b2sums=('e9f6d830f34910ba684851e077e3fd67052b37129e228f63671631076db44c4e25b34e23f7caad6f296f281e4101940a74639257d209580c4144f434c2a3c197'
        '0c023ef99e7ee600710c54dad0ad59070620595109ca42c5057fa2ab74ef6d244631745f5cd4c1bea9c0321ee69f1e1efaab820ff124ad1d4f453121e77fd14f'
        '5b6dafc22995b57564fda89aaedeb2b6ee58b2c635336ac43a123ea4ac6ced3a20eba39d99cc4eb7ec7b29fc7541f5c3bee454ee55ca79fd2d7ce5ef4ed65cd3'
        '4e67afda5db9e48dfe1341c25fc597f2b4c21d784b65a510bf56c4bf5c475db5f995dcfbf4db417ba9ebe99dc5b1c286dbf43e948669ace93906f45720100a50')

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
  rm -rf build

  ln -sf "../${pkgbase}-gradle.properties" 'gradle.properties'
  patch -Np1 -i "../${pkgbase}-flags.patch"
  sed 's|, "-Werror"||g' -i buildSrc/linux.gradle
}

build() {
  cd $_jfxdir

  # Build with openjdk $_java_ver
  export PATH="/usr/lib/jvm/java-$_java_ver-openjdk/bin/:$PATH"

  # Workaround for situation where the linker treats whitespace as arguments
  export LDFLAGS="${LDFLAGS//+([[:space:]]|[[:blank:]])/ }"

  export CFLAGS+=" -Wno-error=implicit-function-declaration"

  "${_gradle[@]}" --no-daemon zips
}

package_java24-openjfx() {
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
  cp -dr --no-preserve=ownership build/sdk/lib/*.jar "${pkgdir}/usr/share/java/$pkgbase"
  cp -dr --no-preserve=ownership build/sdk/lib/*.so "${pkgdir}/usr/lib/$pkgbase"
  cp -dr --no-preserve=ownership build/jmods "${pkgdir}/usr/share/java/$pkgbase"
  cp -dr --no-preserve=ownership build/sdk/legal "${pkgdir}/usr/share/licenses/$pkgbase"

  install -Dm755 "${srcdir}/${pkgbase}-env.sh" "${pkgdir}/usr/bin/${pkgbase}-env"
}

package_java24-openjfx-doc() {
  arch=(any)
  cd $_jfxdir

  install -dm 755 "${pkgdir}"/usr/share/{doc,licenses}
  cp -dr --no-preserve=ownership build/javadoc "${pkgdir}/usr/share/doc/$pkgbase"
  ln -s "$pkgbase" "${pkgdir}/usr/share/licenses/$pkgbase-doc"
}

package_java24-openjfx-src() {
  arch=(any)
  cd $_jfxdir

  install -dm 755  "${pkgdir}"/usr/{lib/jvm/java-$_java_ver-openjdk,share/licenses}
  install -m 644 build/sdk/src.zip "${pkgdir}/usr/lib/jvm/java-$_java_ver-openjdk/javafx-src.zip"
  ln -s "$pkgbase" "${pkgdir}/usr/share/licenses/$pkgbase-src"
}

# vim: ts=2 sw=2 et:
