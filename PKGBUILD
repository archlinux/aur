pkgname=guile-lsp-server-git
pkgver=r481.gbda8785
pkgrel=1
pkgdesc="LSP server for Scheme (Guile implementation)"
arch=('any')
url="https://codeberg.org/rgherdt/scheme-lsp-server"
license=('MIT')
depends=('guile')
makedepends=('git' 'autoconf' 'automake' 'make')
provides=('guile-lsp-server')
conflicts=('guile-lsp-server')
source=("git+https://codeberg.org/rgherdt/scheme-lsp-server.git")
sha256sums=('SKIP')

pkgver() {
  cd "scheme-lsp-server"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "scheme-lsp-server/guile"
  
  ./scripts/install-deps.sh --prefix="${srcdir}/dep-install"
  
  export GUILE_LOAD_PATH="${srcdir}/dep-install/share/guile/site/3.0:$GUILE_LOAD_PATH"
  export GUILE_LOAD_COMPILED_PATH="${srcdir}/dep-install/lib/guile/3.0/site-ccache:$GUILE_LOAD_COMPILED_PATH"
  
  autoreconf -ivf
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "scheme-lsp-server/guile"
  
  ./scripts/install-deps.sh --prefix="${pkgdir}/usr"
  
  make DESTDIR="${pkgdir}" install
}
