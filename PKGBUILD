# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=svpflow1
pkgname=vapoursynth-plugin-${_plug}
pkgver=4.5.0.205
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://www.svp-team.com/wiki/Manual:SVPflow'
license=('GPL')
depends=('gcc-libs'
         'glibc'
         'vapoursynth'
         )
makedepends=('nasm'
             'qt6-tools'
             )
source=("svpflow1-src-${pkgver}.zip::http://www.svp-team.com/files/gpl/svpflow1-src.zip")
sha256sums=('c384b3b969d66f2e22003f87b644fa79ce9093a8af326f7fc79cc305239d05f3')
options=('debug')

prepare() {
  sed -e 's|-msse2 -march=amdfam10|-msse2|g' \
      -e 's|CONFIG += X64 VS|CONFIG += X64|g' \
      -i "${srcdir}/svpflow1-src/plugins.pri"
}

build() {
  cd "${srcdir}/svpflow1-src/jsoncpp"
  qmake6
  make
  cd "${srcdir}/svpflow1-src/svpflow1"
  qmake6 CONFIG+="VS"
  make
}

package(){
  cd svpflow1-src/release
  install -Dm755 libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1.0.0"
  cd "${pkgdir}/usr/lib/vapoursynth/"
  ln -s libsvpflow1.so.1.0.0 libsvpflow1.so.1.0
  ln -s libsvpflow1.so.1.0.0 libsvpflow1.so.1
  ln -s libsvpflow1.so.1.0.0 libsvpflow1.so
}
