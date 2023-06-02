# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgbase=qt5-doc
pkgname=(qt5-doc qt5-examples)
_basever=5.15.9
pkgver=$_basever
pkgrel=1
arch=('any')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
makedepends=('qt5-tools' 'python' 'pciutils' 'libxtst' 'libxcursor' 'libxrandr' 'libxss' 'libxcomposite' 'libxkbfile'
             'gperf' 'nss' 'clang' 'nodejs')
groups=('qt' 'qt5')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/single/${_pkgfqn}.tar.xz"
         qt5-webengine-python3.patch
         no-qmake.patch)
sha256sums=('26d5f36134db03abe4a6db794c7570d729c92a3fc1b0bf9b1c8f86d0573cd02f'
            '398c996cb5b606695ac93645143df39e23fa67e768b09e0da6dbd37342a43f32'
            'db90fa31381fa0814c9c8c803c9e2f9b36bdd6f52da753399e500c0692352498')

prepare() {
  cd ${_pkgfqn/opensource-/}

  ln -s /usr/bin qttools/
  ln -s /usr/bin/{rcc,uic,moc,qmake} qtbase/bin/

  patch -d qtbase -p1 < "$srcdir"/no-qmake.patch # Use system qmake
  patch -d qtwebengine -p1 < "$srcdir"/qt5-webengine-python3.patch # Fix build with Python 3
}

build() {
  cd ${_pkgfqn/opensource-/}

  ./configure -confirm-license -opensource \
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -nomake examples
  make docs
}

package_qt5-doc() {
  pkgdesc='A cross-platform application and UI framework (Documentation)'
  depends=('qt5-base')

  cd ${_pkgfqn/opensource-/}
  make INSTALL_ROOT="$pkgdir" install_docs

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}

package_qt5-examples() {
  pkgdesc='Examples and demos from qt5 documentation'
  depends=('qt5-doc')

  _base="$pkgdir"/usr/share/doc/qt/examples

  # The various example dirs have conflicting .pro files, but
  # QtCreator requires them to be in the same top-level directory.
  # Matching the Qt installer, only the qtbase project is kept.
  mkdir -p $_base
  cp ${_pkgfqn/opensource-/}/qtbase/examples/examples.pro $_base
  _fdirs=$(find "${_pkgfqn/opensource-/}" -maxdepth 2 -type d -name examples)
  for _dir in $_fdirs; do
    rm -f $_dir/{examples.pro,README}
    cp -rn $_dir/* $_base
  done
}
