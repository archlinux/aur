# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Tinx <arch at tinx dot eu>
# Contributor: Jens Kapitza <j dot kapitza at schwarze-allianz dot de>
# Contributor: Olli <olli at coderkun dot de>

# Demos available in `apps/samples`
# To build them: `ant -Dplatforms.JDK_1.8.home=/usr/lib/jvm/default jar`

pkgbase=java-openjfx
pkgname=('java-openjfx' 'java-openjfx-doc' 'java-openjfx-src')
_java_ver=8
_jdk_update=121
_jdk_build=13
_hgtag=${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgver=${_java_ver}.u${_jdk_update}
pkgrel=1
pkgdesc='Java OpenJFX 8 client application platform (open-source implementation of JavaFX)'
arch=('i686' 'x86_64')
url='https://wiki.openjdk.java.net/display/OpenJFX/Main'
license=('GPL')
makedepends=('java-environment-openjdk=8' 'bison' 'gperf' 'gtk2'
             'libxtst' 'ffmpeg' 'python2' 'qt5-base' 'webkit2gtk' 'ruby' 'cmake')
source=(http://hg.openjdk.java.net/openjfx/8u-dev/rt/archive/${_hgtag}.tar.bz2
        gradle.properties
        https://services.gradle.org/distributions/gradle-1.8-bin.zip
        # https://anonscm.debian.org/cgit/pkg-java/openjfx.git/tree/debian/patches/17-gcc-compatibility.patch
        17-gcc-compatibility.patch
        # https://anonscm.debian.org/cgit/pkg-java/openjfx.git/tree/debian/patches/18-fix-ambiguous-pow.patch
        18-fix-ambiguous-pow.patch)

sha256sums=('51008376a03c6603d0d0f039f3253cda98822fdda757f6cee385b594ef4ac85b'
            '1d09385ac23d755aec079954247365de3875507641f5ecd7bd3511ebf3fa9e3c'
            'a342bbfa15fd18e2482287da4959588f45a41b60910970a16e6d97959aea5703'
            '864967467efeaffdabe1e60b7cfd0a27ce93be55ef45ef9993790219ad164554'
            'e909ae1dcb1d6c0fb0148815c3fcdbff8a15b2f05520eed2c830dc0859f75115')

_openjdk8dir="/usr/lib/jvm/java-8-openjdk"

case $CARCH in
  'i686') _CARCH='i386' ;;
  'x86_64')_CARCH='amd64' ;;
esac

prepare() {
  cd "rt-${_hgtag}"
  for p in 17-gcc-compatibility.patch 18-fix-ambiguous-pow.patch; do
    patch -p1 < "${srcdir}/${p}"
  done
}

build() {
  cd "rt-${_hgtag}"

  ln -sf "${srcdir}/gradle.properties" .
  export GRADLE_USER_HOME="${srcdir}/gradle_home"
  mkdir -p ${GRADLE_USER_HOME}

  "${srcdir}"/gradle-1.8/bin/gradle
}

package_java-openjfx() {
  pkgdesc='Java OpenJFX 8 client application platform (open-source implementation of JavaFX)'
  depends=('java-runtime-openjdk=8' 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
  conflicts=('openjfx')
  replaces=('openjfx')

  local _builddir="${srcdir}/rt-${_hgtag}/build"
  local _sdkdir="${_builddir}/sdk"

  install -d "${pkgdir}${_openjdk8dir}/jre/lib/${_CARCH}"
  install -m755 "${_sdkdir}/rt/lib/${_CARCH}"/*.* "${pkgdir}${_openjdk8dir}/jre/lib/${_CARCH}"

  install -d "${pkgdir}${_openjdk8dir}/jre/lib/ext"
  install -m644 "${_sdkdir}/rt/lib/ext"/*.* "${pkgdir}${_openjdk8dir}/jre/lib/ext"
  install -m644 "${_sdkdir}/rt/lib"/*.* "${pkgdir}${_openjdk8dir}/jre/lib"

  install -d "${pkgdir}${_openjdk8dir}/lib"
  install -m644 "${_sdkdir}/lib"/*.* "${pkgdir}${_openjdk8dir}/lib"

  install -d "${pkgdir}${_openjdk8dir}/bin"
  install -m755 "${_sdkdir}/bin"/* "${pkgdir}${_openjdk8dir}/bin"

  install -m644 -D "${_sdkdir}/man/man1/javapackager.1" "${pkgdir}/usr/share/man/man1/javapackager.1"
}

package_java-openjfx-doc() {
  pkgdesc='Java OpenJFX 8 client application platform (open-source implementation of JavaFX) - documentation'
  conflicts=('openjfx-doc')
  replaces=('openjfx-doc')

  local _builddir="${srcdir}/rt-${_hgtag}/build"
  local _sdkdir="${_builddir}/sdk"
  local docdir="/usr/share/doc"

  install -d "${pkgdir}${docdir}/openjfx"
  cp -dr --no-preserve=ownership "${_builddir}/javadoc"/* "${pkgdir}${docdir}/openjfx"
}

package_java-openjfx-src() {
  pkgdesc='Java OpenJFX 8 client application platform (open-source implementation of JavaFX) - sources'
  conflicts=('openjfx-src')
  replaces=('openjfx-src')

  local _builddir="${srcdir}/rt-${_hgtag}/build"
  local _sdkdir="${_builddir}/sdk"

  install -d "${pkgdir}${_openjdk8dir}"
  install -m644 "${_builddir}/javafx-src.zip" "${pkgdir}${_openjdk8dir}"
}
