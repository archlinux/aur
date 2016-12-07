# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=recipes
pkgname=$_pkgname-git
pkgver=0.2.0.14.gaee884d
pkgrel=1
install=$_pkgname.install
pkgdesc="A GNOME recipes cooking book"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'gtk3' 'gnome-autoar')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'git')
options=('!libtool' '!emptydirs')
groups=('gnome')
url="https://git.gnome.org/browse/recipes/"
replaces=('recipes')
provides=('recipes')
conflicts=('recipes')
source=("git://git.gnome.org/${_pkgname}"
	"git://git.gnome.org/libgd"
	"git://git.gnome.org/libglnx"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config libgd.url "${srcdir}/libgd"
  git config libglnx.url "${srcdir}/lbglnx"
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-maintainer-mode \
      --enable-debug --disable-Werror
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
