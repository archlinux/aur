# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=notepadqq
pkgver=2.0.0beta
pkgrel=3
pkgdesc='Notepad++-like text editor for Linux'
arch=('x86_64')
url='https://notepadqq.com/'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-svg' 'qt5-webengine' 'qt5-websockets' 'uchardet')
makedepends=('git' 'qt5-tools')
optdepends=('mathjax2: Math rendering')
options=('!emptydirs')
_commit=5317c21678e71687aaab56862339354e1ea07306
source=("git+https://github.com/notepadqq/notepadqq.git#commit=$_commit"
        "git+https://github.com/notepadqq/CodeMirror.git"
        fix-autosave.patch)
sha256sums=('e66199693ae087109ea749594ffe44ec7059bfef2faf1e744e67a48896b2ea2a'
            'SKIP'
            'a461affdcd9246098c07b9ca4f1c978fa5444a233595fa7ee97d99ca03893426')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g' | sed 's/\+//'
}

prepare() {
  cd $pkgname
  git config submodule.src/editor/libs/codemirror.url "$srcdir/CodeMirror"
  git submodule update --init

  # Fix segfault on autosave
  # https://github.com/notepadqq/notepadqq/pull/1140
  patch -Np1 -i ../fix-autosave.patch

  # Unbundle MathJax
  sed -i 's|libs/MathJax/MathJax|../../mathjax2/MathJax|' src/editor/features/latex/latex.js
  sed -i '/MathJax/d' src/editor/Makefile
}

build() {
  cd $pkgname
  qmake-qt5 PREFIX=/usr LRELEASE=/usr/bin/lrelease notepadqq.pro
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}
