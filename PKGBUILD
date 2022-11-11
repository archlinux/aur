# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

#shellcheck disable=SC2034
_pkgname="libgda"
pkgname=("${_pkgname}5"
         "${_pkgname}5-"{"firebird","jdbc","mysql","postgres"})
pkgver=5.2.10
pkgrel=4
pkgdesc="Database access library"
url="https://www.gnome-db.org/"
arch=(x86_64)
license=(GPL)
depends=(gtksourceview3 libxslt python libsecret graphviz goocanvas iso-codes libgee openssl)
makedepends=(glade libmysqlclient postgresql-libs libfbclient jdk8-openjdk mysql-connector-java intltool
             gobject-introspection gtk-doc vala itstool gnome-common git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_commit=85a2532df64698306fd3be324bb2052fb1b80fd3  # tags/LIBGDA_5_2_10^0
_repo="https://gitlab.gnome.org/GNOME/${_pkgname}.git"
source=("git+${_repo}#commit=${_commit}"
        0001-Use-single-header-with-GtkSource.patch
        0002-Use-goocanvas-3.0.patch
	0003-my_bool-error.patch)
sha256sums=('SKIP'
            '104594a6034b041d87c1129b0b5544c8899393d66a6a0fb7a8b55f7fcb77e560'
            '81ab26fd12f7174e880815f6aa624c24821b1f9c7f386ae566293df7f041b25b'
	    'b41a40edde7ebf629310951cfa1cd693e0ec2077dc71fb2b81001ea5f6ad3f11')

_apiver=5.0

pkgver() {
  cd "${_pkgname}" || exit
  git describe --tags | sed 's/^LIBGDA_//;s/_/./g;s/-/+/g'
}

prepare() {
  mkdir providers

  cd "${_pkgname}" || exit

  # Remove conflicting typedef
  git revert -n e1aea5ffb3fd9b49ad8c0dc01a915b47de3dc3d2

  # Fix use of gtksourceview headers
  git apply -3 ../0001-Use-single-header-with-GtkSource.patch

  # Port to goocanvas-3.0
  git apply -3 ../0002-Use-goocanvas-3.0.patch

  # Apply my_bool patch
  git apply -3 ../0003-my_bool-error.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${_pkgname}" || exit
  autoreconf -i
  CFLAGS+=" -Wno-deprecated-declarations"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
	      --disable-static \
              --with-bdb=/usr \
	      --with-bdb-libdir-name=lib \
              --enable-json \
	      --enable-system-sqlite \
	      --enable-binreloc \
              --with-mysql=yes \
              --with-mysql-libdir-name=/usr/lib \
              --with-java=yes \
              --enable-vala \
	      --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

# shellcheck disable=SC2154
package_libgda5() {
  optdepends=("${_pkgname}-firebird: provider for Firebird"
              "${_pkgname}-jdbc: provider for JDBC"
              "${_pkgname}-mysql: provider for MySQL"
              "${_pkgname}-postgres: provider for PostgreSQL")
  options+=(emptydirs)

  cd "${_pkgname}" || exit
  make DESTDIR="${pkgdir}" install

  mkdir -p providers
  local provider
  for provider in firebird jdbc mysql postgres; do
    mv "${pkgdir}/usr/lib/${_pkgname}-${_apiver}/providers/${_pkgname}-${provider}"[-.]*so \
       "${pkgdir}/usr/lib/pkgconfig/${_pkgname}-${provider}-${_apiver}.pc" \
       "${pkgdir}/usr/share/${_pkgname}-${_apiver}/${provider}_specs_"*".xml" \
       "${srcdir}/providers"
  done

  mv "${pkgdir}/usr/lib/${_pkgname}-${_apiver}/providers/gdaprovider-${_apiver}.jar" \
     "${pkgdir}/usr/bin/gda-list-jdbc-providers-${_apiver}" \
     "${srcdir}/providers"
}

_packageprovider() {
  install -d "${pkgdir}/usr/lib/"{"pkgconfig","${_pkgname}-${_apiver}/providers"} \
             "${pkgdir}/usr/share/${_pkgname}-${_apiver}"
  mv "providers/${_pkgname}-${1}"[-.]*so "${pkgdir}/usr/lib/${_pkgname}-${_apiver}/providers"
  mv "providers/${_pkgname}-${1}-${_apiver}.pc" "${pkgdir}/usr/lib/pkgconfig"
  mv "providers/${1}_specs_"*".xml" "${pkgdir}/usr/share/${_pkgname}-${_apiver}"
}

package_libgda5-firebird() {
  pkgdesc="${_pkgname} provider for Firebird"
  depends=("${_pkgname}" "libfbclient")
  provides=("${_pkgname}-firebird")
  conflicts=("${_pkgname}-firebird")
  _packageprovider firebird
}

package_libgda5-jdbc() {
  pkgdesc="${_pkgname} provider for JDBC"
  depends=("${_pkgname}" "java-environment")
  provides=("${_pkgname}-jdbc")
  conflicts=("${_pkgname}-jdbc")
  _packageprovider jdbc
  install -d "${pkgdir}/usr/bin"
  mv "providers/gda-list-jdbc-providers-${_apiver}" "${pkgdir}/usr/bin"
  mv "providers/gdaprovider-${_apiver}.jar" "${pkgdir}/usr/lib/${_pkgname}-${_apiver}/providers"
}

package_libgda5-mysql() {
  pkgdesc="${_pkgname} provider for MySQL"
  depends=("${_pkgname}" "libmysqlclient")
  provides=("${_pkgname}-mysql")
  conflicts=("${_pkgname}-mysql")
  _packageprovider mysql
}

package_libgda5-postgres() {
  pkgdesc="${_pkgname} provider for PostgreSQL"
  depends=("${_pkgname}" "postgresql-libs")
  provides=("${_pkgname}-postgres")
  conflicts=("${_pkgname}-postgres")
  _packageprovider postgres
}
