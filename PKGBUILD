# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: erk <v at erk dot io>

pkgname=vnote
pkgver=2.0
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://tamlok.github.io/vnote/'
license=(MIT)
depends=(qt5-base qt5-webengine qt5-svg)
makedepends=(git)
source=("git+https://github.com/tamlok/vnote#tag=v${pkgver}"
        "git+https://github.com/chjj/marked.git"
        "git+https://github.com/tamlok/hoedown.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git config 'submodule.src/utils/marked.url' "${srcdir}/marked"
  git config 'submodule.hoedown.url' "${srcdir}/hoedown"
  git submodule update

  install -d build
}

build() {
  cd "$srcdir/$pkgname/build"
  qmake-qt5 ../VNote.pro
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
