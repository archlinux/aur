# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Contributor: youngunix <zagazaw2004 () gmail ()>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: eht16 <enrico.troeger@uvena.de>
# Contributor: Addict7 <nicolasfloquet@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: yochananmarqos <mark -dot- wagie -at- proton -dot- me>

_pkgname=geany-plugins
pkgname=$_pkgname-git
pkgver=2.0.0.r150.ga8aaca94
pkgrel=1
pkgdesc='Various plugins for Geany (git version)'
arch=(x86_64)
url='https://plugins.geany.org/'
license=(GPL-2.0-or-later GPL-3.0-or-later)
depends=(cairo ctpl discount enchant geany-git gdk-pixbuf2 glib2 glibc gpgme
         gtk3 gtkspell3 libgit2 libxml2 libsoup lua51 libxml2 webkit2gtk-4.1
         pango vte3)
makedepends=(git intltool python)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/geany/geany-plugins.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  # adapted commands from 'autogen.sh' to add include path for gettext m4 macros
  # as workaround for change of 'nls.m4' location in gettext >= 0.35, leading to
  # "error: possibly undefined macro: AM_NLS"
  mkdir -p build/cache
  intltoolize -c -f
  autoreconf -vfi -I /usr/share/gettext/m4
}

build() {
  cd $_pkgname
  export CFLAGS+=" -Wno-deprecated-declarations -Wno-incompatible-pointer-types -w"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(libcairo.so libenchant-2.so libgdk-3.so libgdk_pixbuf-2.0.so
            libgio-2.0.so libgit2.so libglib-2.0.so libgmodule-2.0.so
            libgobject-2.0.so libgpgme.so libgtk-3.so libpango-1.0.so
            libsoup-2.4.so libvte-2.91.so libwebkit2gtk-4.1.so libxml2.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
