# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qgroundcontrol-git
pkgver=r8408.1fb0f04
pkgrel=1
pkgdesc="Micro air vehicle ground control station."
arch=('any')
url="http://qgroundcontrol.org/"
license=('GPL3')
conflicts=('qgroundcontrol')
depends=(\
  'espeak'  # optional but you have to decide if you want it at built-time\
  'qt5-svg' 'qt5-graphicaleffects' 'qt5-webkit' 'phonon-qt4' 'qt5-serialport'\
  'qt5-quickcontrols')
makedepends=('git')

source=('qgroundcontrol::git+https://github.com/mavlink/qgroundcontrol.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  qmake ../qgroundcontrol.pro
  make
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "$srcdir/${pkgname%-git}/build/release" "${pkgdir}/opt/qgroundcontrol"
  cat <<EndOfFile > "${pkgdir}/usr/bin/qgroundcontrol"
#!/bin/bash
cd /opt/qgroundcontrol/
exec ./qgroundcontrol $*
EndOfFile
  chmod +x "${pkgdir}/usr/bin/qgroundcontrol"
}

# vim:set ts=2 sw=2 et:
