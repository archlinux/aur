pkgname=qtjambi
pkgver=6.9.1
pkgrel=1
pkgdesc="QtJambi is Qt bindings for the Java programming language originally developed by Trolltech"
arch=(x86_64)
url="https://github.com/OmixVisualization/qtjambi"
license=("LGPL" "GPL")
depends=("qt6-base" "qt6-declarative")
makedepends=("ant" "chrpath" "gcc" "jdk21-openjdk" "make" "patch")
source=(https://github.com/OmixVisualization/qtjambi/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=(f62f96bd64a0156dc4c8301ee0394bf8a0dc5d01e0f8272de160ffb9bfcf9e30)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../../build_release_only.patch
  patch -p1 < ../../warn_off.patch
  patch -p1 < ../../rm_warn_dollar.patch
  mkdir qtdir
  ln -s /usr/lib/qt6/bin qtdir/bin
  ln -s /usr/include/qt6 qtdir/include
  ln -s /usr/lib qtdir/lib
  ln -s /usr/lib/qt6 qtdir/libexec
  ln -s /usr/lib/qt6/mkspecs qtdir/mkspecs
  ln -s /usr/lib/qt6/plugins qtdir/plugins
  ln -s /usr/lib/qt6/qml qtdir/qml
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export QTDIR="${srcdir}/${pkgname}-${pkgver}/qtdir"
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  export JAVA_HOME_TARGET=$JAVA_HOME
  ant generator.make
  ant generator.run
  #patch -p1 < ../../xxx.patch
  ant library
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/java/qtjambi
  cp ${pkgver}/deployment/*.jar ${pkgdir}/usr/share/java/qtjambi
  cp ${pkgver}/deployment/sources/*.jar ${pkgdir}/usr/share/java/qtjambi
  mkdir -p ${pkgdir}/usr/lib
  cp -P ${pkgver}/deployment/platforms/linux-x64/release/lib/*[^.debug] ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/share/licenses/qtjambi
  cp LICENSE.* ${pkgdir}/usr/share/licenses/qtjambi
}
