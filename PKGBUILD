# Contributor: Russ Gibson <russ@russgibson.org>
# Maintener: Frederic Bezies <fredbezies@gmail.com>

pkgname=liferea-git
_gitname=liferea
pkgver=1.11.r5330.g5c1bd2c
pkgrel=1
pkgdesc="A news aggregator for GTK, git version."
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net"
license=('GPL')
depends=('libpeas' 'webkitgtk3' 'json-glib' 'libnotify' 'gnome-keyring')
makedepends=('autoconf' 'intltool' 'git' 'gobject-introspection')
optdepends=('python2-gobject')
provides=('liferea')
conflicts=('liferea' 'liferea-unstable')
replaces=()
backup=()
options=('!libtool' '!emptydirs')
install=liferea.install
source=('git+https://github.com/lwindolf/liferea.git')
md5sums=('SKIP')

pkgver() {
	cd liferea
	echo "1.11.r$(git rev-list --count master).g$(git log -1 --format="%h")" 
}

build() {
  cd liferea
  autoreconf -i
  intltoolize
  ./autogen.sh
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

