pkgname=qtjambi
pkgver=6.10.0
pkgrel=4
qtver=6.10.0
qtjambiver=6.10.0
pkgdesc="QtJambi is Qt bindings for the Java programming language originally developed by Trolltech"
arch=(x86_64)
url="https://github.com/OmixVisualization/qtjambi"
license=("LGPL" "GPL")
depends=("qt6-base=${qtver}" "qt6-declarative=${qtver}")
makedepends=("ant" "chrpath" "gcc" "jdk21-openjdk" "make" "patch")
options=(!debug)
source=(https://github.com/OmixVisualization/qtjambi/archive/refs/tags/v${qtjambiver}.tar.gz)
sha256sums=(SKIP)

prepare() {
  cd "${srcdir}/${pkgname}-${qtjambiver}"
  patch -p1 < ../../build_release_only.patch
  patch -p1 < ../../warn_off.patch
  patch -p1 < ../../rm_warn_dollar.patch
}

build() {
  cd "${srcdir}/${pkgname}-${qtjambiver}"
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  export JAVA_HOME_TARGET=$JAVA_HOME
  ant generator.make
  ant generator.run
  #patch -p1 < ../../xxx.patch
  ant library
}

package() {
  cd "${srcdir}/${pkgname}-${qtjambiver}"
  mkdir -p ${pkgdir}/usr/share/java/qtjambi
  cp ${pkgver}/deployment/*.jar ${pkgdir}/usr/share/java/qtjambi
  cp ${pkgver}/deployment/sources/*.jar ${pkgdir}/usr/share/java/qtjambi
  mkdir -p ${pkgdir}/usr/lib
  cp -P ${pkgver}/deployment/platforms/linux-x64/release/lib/*[^.debug] ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/share/licenses/qtjambi
  cp LICENSE.* ${pkgdir}/usr/share/licenses/qtjambi
}
