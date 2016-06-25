# Contributor: Russ Gibson <russ@russgibson.org>
# Maintener: Frederic Bezies <fredbezies@gmail.com>

pkgname=liferea-git
_gitname=liferea
pkgver=v1.11.7.r51.g3fc15de
pkgrel=1
pkgdesc="A news aggregator for GTK, git version."
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net"
license=('GPL')
depends=('libpeas' 'webkitgtk3' 'json-glib' 'libnotify' 'gnome-keyring')
makedepends=('autoconf' 'intltool' 'git' 'gobject-introspection' 'gconf')
optdepends=('python-gobject')
provides=('liferea')
conflicts=('liferea' 'liferea-unstable')
options=('!libtool' '!emptydirs')
source=('git+https://github.com/lwindolf/liferea.git')
md5sums=('SKIP')

pkgver() {
	cd liferea
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd liferea
  autoreconf -i
  intltoolize
  #./autogen.sh
  ./configure --prefix=/usr --disable-schema-install
  make 
} 

package() {
    cd liferea
    make DESTDIR="$pkgdir" install

    install -d "${pkgdir}/usr/share/gconf/schemas"
    gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" "${pkgdir}"/etc/gconf/schemas/*.schemas
    rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}

