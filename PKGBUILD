# Maintainer: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

_pkgname=epiphany
pkgname=$_pkgname-git
pkgver=3.27.90+63+ga41416c98
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine."
url="http://www.gnome.org/projects/epiphany/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(webkit2gtk gcr libdazzle)
makedepends=(meson docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools autoconf-archive appstream-glib git)
groups=(gnome)
replaces=(epiphany)
provides=(epiphany)
conflicts=(epiphany)
source=("git://git.gnome.org/epiphany"
	"git://git.gnome.org/gvdb"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config --local gvdb.url "${srcdir}/gvdb/gvdb"
  git submodule update
}

build() {
  cd $_pkgname
  [ -d build ] && rm -rf build
  meson build --prefix=/usr --buildtype=release -Denable_https_everywhere=false
  ninja -C build
}

# check() {
#   cd $_pkgname
#   ninja -C build test
# }

package() {
  cd $_pkgname
  DESTDIR=${pkgdir} ninja -C build install
}
