# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: erk <v at erk dot io>

pkgname=vnote
pkgver=3.16.0
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://vnotex.github.io/vnote/en_us/"
license=(LGPL3)
depends=(qt5-webengine qt5-svg qt5-x11extras)
makedepends=(git)
source=("git+https://github.com/vnotex/vnote.git#tag=v${pkgver}"
        "vnotex-vtextedit::git+https://github.com/vnotex/vtextedit"
        "vnotex-QHotkey::git+https://github.com/vnotex/QHotkey.git"
        "vnotex-syntax-highlighting::git+https://github.com/vnotex/syntax-highlighting"
        "vnotex-hunspell::git+https://github.com/vnotex/hunspell"
        "vnotex-sonnet::git+https://github.com/vnotex/sonnet")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"

  install -d build

  git submodule init
  git config 'submodule.libs/vtextedit.url' "${srcdir}/vnotex-vtextedit"
  git config 'submodule.libs/QHotkey.url' "${srcdir}/vnotex-QHotkey"
  git -c protocol.file.allow=always submodule update

  cd "libs/vtextedit"
  git submodule init
  git config 'submodule.src/libs/syntax-highlighting.url' "${srcdir}/vnotex-syntax-highlighting"
  git config 'submodule.src/libs/hunspell.url' "${srcdir}/vnotex-hunspell"
  git config 'submodule.src/libs/sonnet.url' "${srcdir}/vnotex-sonnet"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname}/build"
  qmake-qt5 ../vnote.pro
  make
}

package() {
  cd "${pkgname}/build"
  make INSTALL_ROOT="$pkgdir" install
}
