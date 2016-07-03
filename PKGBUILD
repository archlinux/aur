# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qgroundcontrol-git
pkgver=r8802.32d572b
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
        'https://s3-us-west-2.amazonaws.com/qgroundcontrol/dependencies/Qt5.5.1-linux-min.tar.bz2')
md5sums=('SKIP'
         '3344fb42595d5d7e9b6a777fbc70b4a5')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  tar xf Qt5.5.1-linux-min.tar.bz2
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  export PKG_CONFIG_PATH="${srcdir}/Qt/5.5/gcc_64/lib/pkgconfig"
  "${srcdir}/Qt/5.5/gcc_64/bin/qmake" ../qgroundcontrol.pro
  make
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "$srcdir/${pkgname%-git}/build/release" "${pkgdir}/opt/qgroundcontrol-git"
  mkdir -p "${pkgdir}/opt/qgroundcontrol-git/Qt"
  cp "$srcdir/qgroundcontrol/deploy/qgroundcontrol-start.sh" "${pkgdir}/opt/qgroundcontrol-git/"
  cp -r "$srcdir/Qt/5.5/gcc_64/lib" "${pkgdir}/opt/qgroundcontrol-git/Qt/libs"
  cp -r "$srcdir/Qt/5.5/gcc_64/qml" "${pkgdir}/opt/qgroundcontrol-git/Qt/"
  cp -r "$srcdir/Qt/5.5/gcc_64/plugins" "${pkgdir}/opt/qgroundcontrol-git/Qt/"
  ln -s "/opt/qgroundcontrol-git/qgroundcontrol-start.sh" "${pkgdir}/usr/bin/qgroundcontrol-git"
}

# vim:set ts=2 sw=2 et:
