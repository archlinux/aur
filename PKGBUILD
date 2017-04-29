# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qgroundcontrol-git
pkgver=r10597.08f54ff7a
pkgrel=1
pkgdesc="Micro air vehicle ground control station."
arch=('x86_64')
url="http://qgroundcontrol.org/"
license=('GPL3')
depends=(\
  'espeak'  # optional but you have to decide if you want it at built-time\
)
  
makedepends=('git')

source=('qgroundcontrol::git+https://github.com/mavlink/qgroundcontrol.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  
  # QGC expets an icu version older than the one available on Arch
  # Why does 'make' triggers these copies? Ask upstream.
  sed s,\.so\.56,\.so\.59,g QGCSetup.pri -i
  git submodule update --init --recursive
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  qmake ../qgroundcontrol.pro
  make
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "$srcdir/${pkgname%-git}/build/release" "${pkgdir}/opt/qgroundcontrol-git"
  cp "$srcdir/qgroundcontrol/deploy/qgroundcontrol-start.sh" "${pkgdir}/opt/qgroundcontrol-git/"
  cp "$srcdir/qgroundcontrol/resources/icons/qgroundcontrol.png" "${pkgdir}/opt/qgroundcontrol-git/"
}

# vim:set ts=2 sw=2 et:

