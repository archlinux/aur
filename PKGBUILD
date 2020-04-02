# Maintainer: Shatur95 <genaloner@gmail.com>

_qtcreatorver=4.11.1
_qnvimver=0.2.15

pkgname=qnvim-git
pkgver=v1.2.0.r2.gd6b658f
pkgrel=1
arch=(x86_64)
pkgdesc='Neovim backend for Qt Creator'
url='https://github.com/sassanh/qnvim'
license=(MIT)
depends=(qtcreator=$_qtcreatorver)
makedepends=(llvm python patchelf)
source=("git+${url}"
        "qtcreator-$_qtcreatorver.tar.gz::https://github.com/qt-creator/qt-creator/archive/v$_qtcreatorver.tar.gz"
        "neovim-qt-$_qnvimver.tar.gz::https://github.com/equalsraf/neovim-qt/archive/v$_qnvimver.tar.gz"
        qnvim.pro)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'b0c615975e0ec8c310d94bed283bdcd54fed61c308893f7f36cd3e1cda4d7c44')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp qnvim.pro "$srcdir"/qnvim
}

build() {
  mkdir -p "$srcdir"/noevim-qt-build
  cd "$srcdir"/noevim-qt-build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SYSTEM_MSGPACK=on \
    "$srcdir/neovim-qt-$_qnvimver"
  cmake --build .

  mkdir -p "$srcdir"/qtcreator-build
  cd "$srcdir"/qtcreator-build
  qmake KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    "$srcdir"/qt-creator-$_qtcreatorver/qtcreator.pro
  make

  mkdir -p "$srcdir"/qnvim-build
  cd "$srcdir"/qnvim-build
  qmake KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    IDE_SOURCE_TREE=$srcdir/qt-creator-$_qtcreatorver \
    IDE_BUILD_TREE=$srcdir/qtcreator-build \
    NEOVIM_SOURCE_TREE="$srcdir/neovim-qt-$_qnvimver" \
    NEOVIM_BUILD_TREE="$srcdir"/noevim-qt-build \
    "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir"/qnvim-build
  make install INSTALL_ROOT="$pkgdir/usr"
}
