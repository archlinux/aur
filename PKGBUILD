# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.16.1
pkgrel=6
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('libgdamm' 'libxml++' 'gconfmm' 'pygtk'
         'python2-gda' 'libgtksourceviewmm2' 'goocanvasmm' 'libepc' 
         'iso-codes' 'postgresql' 'hicolor-icon-theme' 'shared-mime-info'
         'gtkmm' 'boost-libs' 'gettext')
makedepends=('intltool' 'gnome-doc-utils' 'boost' 'python-sphinx' 'mm-common')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glom/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('9ae56e0886f14a48cedaef9beb9c3cc9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # doctooldir is now owned by mm-common-util instead of glibmm
  # the following sed line can be removed once (if) upstream provides a fixed
  # configure script
  sed -i 's%\(MMDOCTOOLDIR=`$PKG_CONFIG --variable=doctooldir \)glibmm-2.4%\1mm-common-util%' configure

  ./configure --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-scrollkeeper \
    --disable-update-mime-database \
    --disable-static 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
