# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: erk <v at erk dot io>

pkgname=vnote-git
pkgver=2.10.r0.gde753706
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://tamlok.github.io/vnote/'
license=(MIT)
depends=(qt5-base qt5-webengine qt5-svg)
makedepends=(git)
source=("git+https://github.com/tamlok/vnote.git#branch=vnote2.0"
        "git+https://github.com/chjj/marked.git"
        "git+https://github.com/tamlok/hoedown.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  git submodule init
  git config 'submodule.src/utils/marked.url' "${srcdir}/marked"
  git config 'submodule.hoedown.url' "${srcdir}/hoedown"
  git submodule update

  install -d build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  qmake-qt5 ../VNote.pro
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
