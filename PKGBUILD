# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

#_items=(firebird jdbc mysql postgres)
_items=(mysql postgres)

_name=libgda
pkgbase="${_name}"-git

pkgname=("${_name}" "${_items[@]/#/${_name}-}")
pkgname=("${pkgname[@]/%/-git}")

pkgver=6.0.0.r183.71ad957f4
pkgrel=1
pkgdesc="Database access library"
url="https://www.gnome-db.org/"
arch=(x86_64)
license=('GPL-2.0-or-later')

depends=(
  gtksourceview3 libxslt python libsecret graphviz goocanvas iso-codes libgee openssl
)
makedepends=(
  git meson
  glib2-devel
  mariadb-libs postgresql-libs
  intltool itstool
  glade libfbclient
  gobject-introspection gtk-doc vala gnome-common
#  jdk11-openjdk
)

source=("git+https://gitlab.gnome.org/GNOME/${_name}.git#branch=master"
        0001-Use-single-header-with-GtkSource.patch
        0002-Use-goocanvas-3.0.patch
        0003-Check-MariaDB-client.patch)
sha256sums=('SKIP'
            '104594a6034b041d87c1129b0b5544c8899393d66a6a0fb7a8b55f7fcb77e560'
            '9f601f0a762b22a45f5b98e5a344457c6f523e29339fea50c9fcb1b8e1fad19c'
            '8c40e218be66f9e9e1a5a354845be21b430f1707945d88cdc64502cc55802f0c')

_apiver=$(cut -d. -f1,2 <<< "$pkgver")

pkgver() {
  cd "${_name}"
  git describe --tags --long | sed "s/^LIBGDA_//; s/_/./g; s/\-/.r/;s/\-g/./"
}

prepare() {
  mkdir -p providers

  cd "${_name}"

  for p in \
    0001-Use-single-header-with-GtkSource.patch \
    0002-Use-goocanvas-3.0.patch \
    0003-Check-MariaDB-client.patch
  do
    git apply -3 ../"$p"
  done
}

build() {
  cd "${_name}"

  local nostrict="-Wno-error=unused-but-set-variable -Wno-error=deprecated-declarations -Wno-error=format"

#  CFLAGS+=" -Wno-deprecated-declarations"
#  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
#    --with-bdb=/usr --with-bdb-libdir-name=lib \
#    --enable-json --enable-system-sqlite --enable-binreloc \
#    --enable-vala --enable-gtk-doc
#  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
#  make

  arch-meson -Dc_args="$nostrict" \
      -Ddoc=true -Dpostgres=true -Dmysql=true \
      -Djson=true -Dvapi=true \
      build .

  meson compile -C build
}

package_libgda-git() {
  provides=("${_name}")
  conflicts=("${_name}")
  optdepends=(
#    'libgda-firebird: provider for Firebird'
#    'libgda-jdbc: provider for JDBC'
    'libgda-mysql: provider for MySQL'
    'libgda-postgres: provider for PostgreSQL'
  )
  options+=(emptydirs)

  cd "${_name}"
  meson install -C build --destdir "$pkgdir"

  mkdir -p providers

  local provider
  for provider in "${_items[@]}"; do
    mv "$pkgdir"/usr/lib/libgda-$_apiver/providers/libgda-$provider[-.]*so \
        "$srcdir/providers"
    mv "$pkgdir"/usr/lib/pkgconfig/libgda-$provider-$_apiver.pc \
        "$srcdir/providers"
#    mv "$pkgdir"/usr/lib/libgda-$_apiver/providers/libgda-$provider[-.]*so \
#       "$pkgdir"/usr/lib/pkgconfig/libgda-$provider-$_apiver.pc \
#       "$pkgdir"/usr/share/libgda-$_apiver/${provider}_specs_*.xml \
#       "$srcdir/providers"
  done

#  mv "$pkgdir"/usr/lib/libgda-$_apiver/providers/gdaprovider-${_apiver}.jar \
#     "$pkgdir"/usr/bin/gda-list-jdbc-providers-${_apiver} \
#     "$srcdir/providers"
}

_packageprovider() {
  install -d "$pkgdir"/usr/lib/{pkgconfig,libgda-$_apiver/providers} \
             "$pkgdir"/usr/share/libgda-$_apiver
  mv providers/libgda-${1}[-.]*so "$pkgdir/usr/lib/libgda-$_apiver/providers"
  mv providers/libgda-${1}-$_apiver.pc "$pkgdir/usr/lib/pkgconfig"
#  mv providers/${1}_specs_*.xml "$pkgdir/usr/share/libgda-$_apiver"
}

#package_libgda-firebird() {
#  pkgdesc="libgda provider for Firebird"
#  depends=(libgda libfbclient)
#  _packageprovider firebird
#}

#package_libgda-jdbc() {
#  pkgdesc="libgda provider for JDBC"
#  depends=(libgda java-environment)
#  _packageprovider jdbc
#  install -d "$pkgdir/usr/bin"
#  mv providers/gda-list-jdbc-providers-$_apiver "$pkgdir/usr/bin"
#  mv providers/gdaprovider-$_apiver.jar "$pkgdir/usr/lib/libgda-$_apiver/providers"
#}

package_libgda-mysql-git() {
  pkgdesc="libgda provider for MySQL"
  provides=("${_name}-mysql")
  conflicts=("${_name}-mysql")
  depends=("${pkgbase}" mariadb-libs glib2)
  _packageprovider mysql
}

package_libgda-postgres-git() {
  pkgdesc="libgda provider for PostgreSQL"
  provides=("${_name}-postgres")
  conflicts=("${_name}-postgres")
  depends=("${pkgbase}" postgresql-libs glib2)
  _packageprovider postgres
}

