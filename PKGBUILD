# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=qt5-quick1-git
pkgver=5.8.0.fa02271a
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
pkgdesc='Qt Declarative is provided for Qt 4 compatibility'
license=('LGPL2.1' 'GPL3')
depends=('qt5-webkit' 'qt5-script')
makedepends=('git')
provides=('qt5-quick1')
conflicts=('qt5-quick1')
source=("git+https://github.com/qt/qtquick1")
sha1sums=('SKIP')

_prlfix() {
  # Fix wrong path in prl files
  find "$pkgdir"/usr/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
}

pkgver() {
  cd "$srcdir"/qtquick1
  printf "%s.%s" "$(cat .qmake.conf | grep 'MODULE_VERSION = ' | sed 's/MODULE_VERSION = //')" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd qtquick1

  git checkout dev

  if [ ! -d include ]; then
    syncqt.pl-qt5 -version $pkgver sync.profile
  fi
}

build() {
  mkdir -p qtquick1/build
  cd qtquick1/build
  qmake-qt5 ..

  make

  make docs
}

package() {
  cd qtquick1/build
  make INSTALL_ROOT="$pkgdir" install
  make INSTALL_ROOT="$pkgdir" install_docs

  _prlfix

  # create some symlinks in /usr/bin, postfixed with -qt5
  install -d "$pkgdir"/usr/bin
  for i in $(ls "$pkgdir"/usr/bin); do
      ln -s /usr/bin/$i "$pkgdir"/usr/bin/$i-qt5
  done

  install -D -m644 ../LGPL_EXCEPTION.txt "$pkgdir"/usr/share/licenses/$pkgname/LGPL_EXCEPTION.txt
}
