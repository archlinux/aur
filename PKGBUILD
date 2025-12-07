pkgname=qtjambi
pkgver=6.10.1
pkgrel=3
qtver=6.10.1
qtjambiver=6.10.1
pkgdesc="QtJambi is Qt bindings for the Java programming language originally developed by Trolltech"
arch=(x86_64)
url="https://github.com/OmixVisualization/qtjambi"
license=("LGPL" "GPL")
makedepends=(
  "ant"
  "chrpath"
  "gcc"
  "jdk25-openjdk"
  "make"
  "patch"
  "qt6-3d=${qtver}"
  "qt6-5compat=${qtver}"
  "qt6-base=${qtver}"
  "qt6-charts=${qtver}"
  "qt6-connectivity=${qtver}"
  "qt6-datavis3d=${qtver}"
  "qt6-declarative=${qtver}"
  "qt6-graphs=${qtver}"
  "qt6-grpc=${qtver}"
  "qt6-httpserver=${qtver}"
  "qt6-imageformats=${qtver}"
  "qt6-languageserver=${qtver}"
  "qt6-location=${qtver}"
  "qt6-lottie=${qtver}"
  "qt6-mqtt=${qtver}"
  "qt6-multimedia=${qtver}"
  "qt6-multimedia-ffmpeg=${qtver}"
  "qt6-multimedia-gstreamer=${qtver}"
  "qt6-networkauth=${qtver}"
  "qt6-positioning=${qtver}"
  "qt6-quick3d=${qtver}"
  "qt6-quick3dphysics=${qtver}"
  "qt6-quickeffectmaker=${qtver}"
  "qt6-quicktimeline=${qtver}"
  "qt6-remoteobjects=${qtver}"
  "qt6-scxml=${qtver}"
  "qt6-sensors=${qtver}"
  "qt6-serialbus=${qtver}"
  "qt6-serialport=${qtver}"
  "qt6-shadertools=${qtver}"
  "qt6-speech=${qtver}"
  "qt6-svg=${qtver}"
  "qt6-tools=${qtver}"
  "qt6-translations=${qtver}"
  "qt6-virtualkeyboard=${qtver}"
  "qt6-wayland=${qtver}"
  "qt6-webchannel=${qtver}"
  "qt6-webengine=${qtver}"
  "qt6-websockets=${qtver}"
  "qt6-webview=${qtver}"
  "qt6-xcb-private-headers=${qtver}"
)
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
  export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
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
