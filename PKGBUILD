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

source=('qgroundcontrol::git+https://github.com/mavlink/qgroundcontrol.git'
        'https://s3-us-west-2.amazonaws.com/qgroundcontrol/dependencies/Qt5.7.1-linux-min.tar.bz2')
md5sums=('SKIP'
         'ec8a27edd22f3d1bdf2e53f9e8153923')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  tar xf Qt5.7.1-linux-min.tar.bz2
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init --recursive
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  export PKG_CONFIG_PATH="${srcdir}/Qt5.7-linux/5.7/gcc_64/lib/pkgconfig"
  "${srcdir}/Qt5.7-linux/5.7/gcc_64/bin/qmake" ../qgroundcontrol.pro
  make
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "$srcdir/${pkgname%-git}/build/release" "${pkgdir}/opt/qgroundcontrol-git"
  mkdir -p "${pkgdir}/opt/qgroundcontrol-git/Qt"
  cp "$srcdir/qgroundcontrol/deploy/qgroundcontrol-start.sh" "${pkgdir}/opt/qgroundcontrol-git/"
  cp "$srcdir/qgroundcontrol/resources/icons/qgroundcontrol.png" "${pkgdir}/opt/qgroundcontrol-git/"
  #ln -s "/opt/qgroundcontrol-git/qgroundcontrol-start.sh" "${pkgdir}/usr/bin/qgroundcontrol-git"
}

# vim:set ts=2 sw=2 et:
