# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

_items=(jdbc mysql postgres)
#_items=(firebird jdbc mysql postgres)

_name=libgda
pkgbase="${_name}"5
pkgname=("${pkgbase}" "${_items[@]/#/${pkgbase}-}")

pkgver=5.2.10
_apiver="${pkgver%%.*}".0

pkgrel=1
pkgdesc="Database access library"
url="https://www.gnome-db.org/"
arch=(x86_64)
license=('GPL-2.0-or-later')
depends=(gtksourceview3 libxslt python libsecret graphviz goocanvas iso-codes libgee openssl)
makedepends=(glade mariadb-libs postgresql-libs libfbclient java-environment jdk-openjdk intltool
             gobject-introspection gtk-doc vala itstool gnome-common git db)

source=("git+https://gitlab.gnome.org/GNOME/libgda.git#tag=LIBGDA_${pkgver//./_}"
        0001-Use-single-header-with-GtkSource.patch
        0002-Use-goocanvas-3.0.patch
        0003-gettext-fix.patch
        0004-autogen-fix.patch
        0005-mysql-fixes.patch
        0006-java-fixes.patch
        0007-lemon-fixes.patch)
sha256sums=('3a435b5991f9dd915abf5e27cc1a2efc4f5da13d373a43e4402f1b6261da9170'
            '104594a6034b041d87c1129b0b5544c8899393d66a6a0fb7a8b55f7fcb77e560'
            '81ab26fd12f7174e880815f6aa624c24821b1f9c7f386ae566293df7f041b25b'
            '8ecbe800ed87e12098b936688c1eae3ffb470c8d8125c3bd854f8e57a06a047f'
            '4179312202e6b7af70cfb0498327b351130765905228d2583c29529be32c5b5a'
            '32ecec9147a442c0964378ae2a2a15bdbf530bbafd4452f97804df2eda20c599'
            'b8d90d6dc419253354384eb10fbcd51ae7e99cff09778053c1802f8e4cf5f8b1'
            'b3a0859aa4dbc8b4e4a78201331bd7540f9b412a1e31beb080a5e510f9164e72')

prepare() {
  mkdir -p providers

  cd ${_name}

  # Remove conflicting typedef
  git revert -n e1aea5ffb3fd9b49ad8c0dc01a915b47de3dc3d2

  # 0001: Fix use of gtksourceview headers
  # 0002: Port to goocanvas-3.0
  for p in \
    0001-Use-single-header-with-GtkSource.patch \
    0002-Use-goocanvas-3.0.patch
  do
    git apply -3 ../"$p"
  done

  # 0003: Allow for current autotools to detect gettext correctly
  # 0004: Run autopoint, intltoolize, and autoconf explicitly
  # 0005: Fix MySQL detection (add missing stdio.h #include in tests)
  # 0006: Fix Java detection (add LTS versions, 26, and 27)
  # 0007: Fix function declarations in "lemon.c"
  for p in \
    0003-gettext-fix.patch \
    0004-autogen-fix.patch \
    0005-mysql-fixes.patch \
    0006-java-fixes.patch \
    0007-lemon-fixes.patch
  do
    patch -p1 -F0 -i ../"$p"
  done

  chmod +x ./autogen.sh
  ./autogen.sh
}

build() {
  cd ${_name}

  local more_c_flags=(
    '-Wno-old-style-definition'
    '-Wno-deprecated-declarations'
    '-Wno-unused-variable'
    '-Wno-unused-result'
    '-Wno-address'
    '-Wno-unused-function'
    '-Wno-unused-but-set-variable'
    '-Wno-error=incompatible-pointer-types'
    '-Wno-error=int-conversion'
  )

  for f in "${more_c_flags[@]}"; do
    CFLAGS+=" $f"
  done

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
      --with-bdb=/usr --with-bdb-libdir-name=lib \
      --enable-json --enable-system-sqlite --enable-binreloc \
      --enable-vala --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package_libgda5() {
#  optdepends=('libgda-firebird: provider for Firebird'
#              'libgda-jdbc: provider for JDBC'
#              'libgda-mysql: provider for MySQL'
#              'libgda-postgres: provider for PostgreSQL')
  depends=(python-reportlab)
  optdepends=('libgda-jdbc: provider for JDBC'
              'libgda-mysql: provider for MySQL'
              'libgda-postgres: provider for PostgreSQL')
  options+=(emptydirs)

  cd ${_name}

  make DESTDIR="$pkgdir" install

  mkdir -p providers
  local provider
  for provider in "${_items[@]}"; do
    mv "$pkgdir"/usr/lib/libgda-$_apiver/providers/libgda-$provider[-.]*so \
       "$pkgdir"/usr/lib/pkgconfig/libgda-$provider-$_apiver.pc \
       "$pkgdir"/usr/share/libgda-$_apiver/${provider}_specs_*.xml \
       "$srcdir/providers"
  done

  mv "$pkgdir"/usr/lib/libgda-$_apiver/providers/gdaprovider-${_apiver}.jar \
     "$pkgdir"/usr/bin/gda-list-jdbc-providers-${_apiver} \
     "$srcdir/providers"
}

_packageprovider() {
  install -d "$pkgdir"/usr/lib/{pkgconfig,libgda-$_apiver/providers} \
             "$pkgdir"/usr/share/libgda-$_apiver
  mv providers/libgda-${1}[-.]*so "$pkgdir/usr/lib/libgda-$_apiver/providers"
  mv providers/libgda-${1}-$_apiver.pc "$pkgdir/usr/lib/pkgconfig"
  mv providers/${1}_specs_*.xml "$pkgdir/usr/share/libgda-$_apiver"
}

#package_libgda5-firebird() {
#  pkgdesc="libgda provider for Firebird"
#  depends=("$pkgbase" libfbclient)
#  _packageprovider firebird
#}

package_libgda5-jdbc() {
  pkgdesc="libgda provider for JDBC"
  depends=("$pkgbase" java-environment libxml2)
  _packageprovider jdbc
  install -d "$pkgdir/usr/bin"
  mv providers/gda-list-jdbc-providers-$_apiver "$pkgdir/usr/bin"
  mv providers/gdaprovider-$_apiver.jar "$pkgdir/usr/lib/libgda-$_apiver/providers"
}

package_libgda5-mysql() {
  pkgdesc="libgda provider for MySQL"
  depends=("$pkgbase" mariadb-libs glib2)
  _packageprovider mysql
}

package_libgda5-postgres() {
  pkgdesc="libgda provider for PostgreSQL"
  depends=("$pkgbase" postgresql-libs glib2)
  _packageprovider postgres
}
