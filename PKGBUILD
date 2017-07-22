# Maintainer: Janosch Dobler <janosch.dobler AT gmx DOT de>
pkgname=libgtkflow-git
pkgver=r305.6033bac
pkgrel=1
pkgdesc="Flowgraphs for Gtk+3"
arch=('i686' 'x86_64')
url="https://github.com/grindhold/libgtkflow"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'meson' 'vala' 'valadoc' 'gobject-introspection')
optdepends=('python-gobject: usage from python'
            'lua-lgi: usage from lua')
source=("git+https://github.com/grindhold/libgtkflow.git")
md5sums=('SKIP')

_gitroot="https://github.com/grindhold/libgtkflow.git"
_gitname="libgtkflow"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  sed --in-place \
    's/arrange(List<Node> nodes)/arrange(List<unowned Node> nodes)/' \
    libgtkflow/layout.vala
}

build() {
  cd "$srcdir/$_gitname"

  rm -rf build
  mkdir build && cd build
  meson --prefix=/usr
  ninja
}

package() {
  cd "$srcdir/$_gitname/build"
  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
