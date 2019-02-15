# Contributor: Russ Gibson <russ@russgibson.org>
# Maintener: Frederic Bezies <fredbezies@gmail.com>

pkgname=liferea-git
_gitname=liferea
pkgver=v1.12.6.r35.g1f0bee8d
pkgrel=1
pkgdesc="A news aggregator for GTK, git version."
arch=('i686' 'x86_64')
url="https://lzone.de/liferea/"
license=('GPL')
depends=('libpeas' 'webkit2gtk')
makedepends=('autoconf' 'intltool' 'git' 'gobject-introspection' 'gconf')
optdepends=('python-gobject' 'python-cairo' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-base')
provides=('liferea')
conflicts=('liferea' 'liferea-unstable')
options=('!libtool' '!emptydirs')
source=('git+https://github.com/lwindolf/liferea.git')
sha1sums=('SKIP')

pkgver() {
	cd liferea
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd liferea
  autoreconf -i
  intltoolize
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

