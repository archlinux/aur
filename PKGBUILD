# $Id: PKGBUILD 266281 2017-11-12 10:09:48Z arojas $
# Maintainer: Alexandre Filgueira <alexfilgueira@antergos.com>
# Contributor: Adam Hani Schakaki <adam@schakaki.net>
# Contributor: Ner0

pkgname=muffin36
pkgver=3.6.0
pkgrel=1
pkgdesc="Cinnamon window manager based on Mutter (version 3.6.0)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/muffin"
license=('GPL')
depends=('clutter' 'gobject-introspection-runtime' 'cinnamon-desktop' 'libcanberra' 'libsm'
         'startup-notification' 'zenity' 'dconf')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'gobject-introspection' 'gtk-doc')
conflicts=('muffin')
provides=('muffin')
options=('!emptydirs')
source=("muffin-$pkgver.tar.gz::https://github.com/linuxmint/muffin/archive/$pkgver.tar.gz")
sha256sums=('b343b6bf86d83dad01dcfb12d224c7eb2d4b63e1fbbe8beb3240a618ffecf737')

prepare() {
  cd muffin-${pkgver}

}

build() {
  cd muffin-${pkgver}

  PYTHON=python2 ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/muffin \
  				 			 --localstatedir=/var --disable-static --disable-schemas-compile \
                 --enable-compile-warnings=minimum

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd muffin-${pkgver}
  make DESTDIR="$pkgdir/" install

  # Remove unused stuff
  make -C src DESTDIR="$pkgdir" uninstall-binPROGRAMS uninstall-desktopfilesDATA
  make -C src/tools DESTDIR="$pkgdir" uninstall
  make -C src/compositor/plugins DESTDIR="$pkgdir" uninstall
  make -C doc/man DESTDIR="$pkgdir" uninstall
}

# vim:set ts=2 sw=2 et:
