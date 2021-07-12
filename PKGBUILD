# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: erk <v at erk dot io>

pkgname=vnote-git
pkgver=3.4.0.r4.c13d1803
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://vnotex.github.io/vnote/en_us/'
license=(GPL3)
depends=(qt5-base qt5-webengine qt5-svg)
makedepends=(git)
source=("git+https://github.com/vnotex/vnote.git"
        "vnotex-vtextedit::git+https://github.com/vnotex/vtextedit"
        "vnotex-syntax-highlighting::git+https://github.com/vnotex/syntax-highlighting"
        "vnotex-hunspell::git+https://github.com/vnotex/hunspell"
        "vnotex-sonnet::git+https://github.com/vnotex/sonnet")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  #printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  TAG=$(git tag --list | tail -n 1 | sed 's/^v//')
  printf "${TAG}.r%s.%s" "$(git rev-list --count v${TAG}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  install -d build

  git submodule init
  git config 'submodule.libs/vtextedit.url' "${srcdir}/vnotex-vtextedit"
  git submodule update

  cd "libs/vtextedit"
  git submodule init
  git config 'submodule.src/libs/syntax-highlighting.url' "${srcdir}/vnotex-syntax-highlighting"
  git config 'submodule.src/libs/hunspell.url' "${srcdir}/vnotex-hunspell"
  git config 'submodule.src/libs/sonnet.url' "${srcdir}/vnotex-sonnet"
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  qmake-qt5 ../vnote.pro
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make INSTALL_ROOT="$pkgdir" install
}
