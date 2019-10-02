# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
_pkgname=gvls
pkgname=${_pkgname}-git
pkgver=0.10.2+65+gb8cfdb7
pkgrel=1
pkgdesc='GNOME Vala Language Server'
arch=(i686 x86_64)
url='https://gitlab.gnome.org/esodan/gvls'
license=(LGPL3)
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=(vala libgee libpeas gtksourceview3 gtksourceview4 jsonrpc-glib)
makedepends=(git meson)
optdepends=()
groups=()
source=("git+https://gitlab.gnome.org/esodan/gvls.git"
        "fix-valadoc-icon-dir.patch")
sha256sums=('SKIP'
            'f56f8cc2b42ef491f6f2088b313e6d34d7bfe307b81990f842d2f6e8df829196')

pkgver() {
  cd ${_pkgname}

  git describe --tags  | sed 's/^gvls-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd ${_pkgname}

  patch -Np1 -i ../fix-valadoc-icon-dir.patch
}

build() {
  arch-meson ${_pkgname} build \
             -Ddisable-valadocs=false

  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
