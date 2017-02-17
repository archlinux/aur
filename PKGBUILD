# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>

_pkgname=recipes
pkgname=$_pkgname-git
pkgver=0.12.0+82+g9b0ebf4
pkgrel=1
pkgdesc="A GNOME recipes cooking book"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'gtk3' 'gnome-autoar' 'gspell')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'git' 'gobject-introspection')
options=('!libtool' '!emptydirs')
groups=('gnome')
url="https://git.gnome.org/browse/recipes/"
replaces=('recipes')
provides=('recipes')
conflicts=('recipes')
source=("git://git.gnome.org/${_pkgname}"
	"git://git.gnome.org/libgd"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|+|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config libgd.url "${srcdir}/libgd"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-maintainer-mode \
      --enable-debug --disable-Werror
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
