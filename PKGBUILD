# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kamil Śliwak <cameel2/at/gmail/com>

pkgbase=mdbtools-git
pkgname=(mdbtools-git gmdb2-git)
pkgver=0.7.r220.gd6f5745
pkgrel=1
pkgdesc="Utilities for viewing data and exporting schema from Microsoft Access database files"
arch=('i686' 'x86_64')
url="https://github.com/brianb/mdbtools"
license=('LGPL' 'GPL')
makedepends=('bison' 'flex' 'txt2man' 'autoconf' 'rarian' 'unixodbc' 'libgnomeui' 'git' 'gtk-doc'
	     'gnome-doc-utils')
options=('!libtool' '!emptydirs')
source=("${pkgbase}::git://github.com/brianb/mdbtools.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  echo $(git describe --always | sed -r 's|([^-]*-g)|r\1|;s|-|.|g')
}

prepare() {
  cd ${pkgbase}
  sed -i -e 's, -export-symbols-regex.*,,' src/sql/Makefile.am
# sed -i -e 's, -export-symbols-regex.*,,' src/libmdb/Makefile.am
# sed -i -e 's, -export-symbols-regex.*,,' src/odbc/Makefile.am
  echo "mdb_export_LDADD = ../libmdb/libmdb.la ../sql/libmdbsql.la" >>src/util/Makefile.am
  autoreconf -i -f
}

build() {
  cd ${pkgbase}
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --with-unixodbc=/usr
  make V=0
}

package_mdbtools-git() {
  depends=('unixodbc' 'glib2' 'flex')
  provides=(mdbtools)
  conflicts=(mdbtools)
  optdepends=('gmdb2-git: graphical viewer for MDB files')
  
  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C src/gmdb2 uninstall
}

package_gmdb2-git() {
  pkgdesc='Graphical viewer for Microsoft Access database files'
  license=('GPL')
  provides=(gmdb2)
  conflicts=(gmdb2)
  depends=("mdbtools-git=$pkgver" 'libgnomeui' 'desktop-file-utils')

  cd ${pkgbase}/src/gmdb2
  make DESTDIR="${pkgdir}" install
  install -Dm644 gmdb.desktop "$pkgdir"/usr/share/applications/gmdb2.desktop
}
