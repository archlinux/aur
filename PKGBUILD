# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=referencer-bzr
pkgver=938
pkgrel=1
pkgdesc="a Gnome application to organise documents or references, and \
         ultimately generate a BibTeX bibliography file"
arch=('i686' 'x86_64')
url="https://launchpad.net/referencer/"
license=('GPL2')
makedepends=(   'autoconf'
                'automake' 
                'bzr'
                'pkgconfig'
                'glib2'
                'intltool'
                'gnome-common'
                'gnome-doc-utils'
                'gnome-icon-theme')
depends=(       'poppler-glib'
                'libgnomeuimm'
                'yelp'
                'boost'
                'python2>=2.5')
        #        'gtkmm-utils')
conflicts=('referencer' 'referencer-svn' 'referencer-hg')
replaces=('referencer-svn' 'referencer-hg')
provides=('referencer')
install=referencer.install
source=('referencer::bzr+https://code.launchpad.net/~referencer-devs/referencer/trunk')
md5sums=('SKIP')

# # # # #

pkgver() {
  cd "$srcdir/referencer"
  bzr revno
}

prepare() {
  cd "${srcdir}/referencer"
  gnome-doc-prepare --force
}


build() {
  cd "$srcdir/referencer"
  CXXFLAGS="$CXXFLAGS -std=gnu++11"
  export AUTOMAKE=automake
  msg "Starting autogen.sh..."
  ./autogen.sh --prefix="/usr" --disable-update-mime-database
  PYTHON="/usr/bin/python2" ./configure --prefix="/usr" \
      --disable-update-mime-database --enable-python
  sed -i 's|$(MAKE) $(AM_MAKEFLAGS) install-data-hook||' data/Makefile
  make
}

package() {
  cd "$srcdir/referencer"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
