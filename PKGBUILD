# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: mariusz - myswiat <my.swiat@o2.pl>

_realname=pango
pkgname=$_realname-git
pkgver=1.37.1.3744.65214f2
pkgrel=1
pkgdesc="A library for layout and rendering of text"
arch=('i686' 'x86_64')
url="http://gnome.org/"
license=('LGPL')
depends=('glib2' 'cairo' 'libxft' 'libthai' 'freetype2' 'harfbuzz' 'fontconfig')
makedepends=('gobject-introspection' 'libxt' 'gtk-doc')
provides=("${_realname}=${pkgver}")
conflicts=("${_realname}")
install=${_realname}.install
options=('!libtool' 'strip' 'debug')

source=("git+git://git.gnome.org/pango" "pango.install")

sha256sums=("SKIP" "1e69feead9d9e5a76e7e0dc1b3da3b8938f65f58c02449478900559be50e9ac7")

subver() {
  PREFIX="m4_define(\[pango_version_$1\], \["
  echo $(grep "$PREFIX" configure.ac | eval sed "'s/$PREFIX//'" | sed 's/\])//')
}
 
pkgver() {
  cd $_realname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver major).$(subver minor).$(subver micro).$revision.$hash
}

build() {
  cd $_realname
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-included-modules=basic-fc
  make
}

package() {
  cd $_realname
  make DESTDIR=$pkgdir install
  install -m755 -d "${pkgdir}/etc/pango"
}
