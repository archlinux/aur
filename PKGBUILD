# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=xchat-gnome
pkgname=$_pkgname-git
pkgver=0.3.0.2753.eb12886
pkgrel=1
pkgdesc="GNOME frontend to the popular X-Chat IRC client"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Xchat-Gnome"
license=('GPL')
depends=('gconf>=2.8.0' 'libsexy>=0.1.11' 'libnotify>=0.7.0' 'libcanberra>=0.3' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'gnome-common' 'intltool>=0.40.0' 'gnome-doc-utils' 'python2' 'tcl')
optdepends=('python2: plugin support'
            'tcl: plugin support')
provides=('xchat-gnome')
conflicts=('xchat-gnome')
options=('!libtool')
install=$_pkgname.install

source=('git://git.gnome.org/xchat-gnome')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[XChat-GNOME IRC Chat\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=xchat-gnome\],\[xchat-gnome\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash  
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --disable-static --disable-scrollkeeper --disable-schemas-install \
               --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
               PYTHON=python2
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$_pkgname.schemas" "$pkgdir"/usr/share/gconf/schemas/*.schemas
}
