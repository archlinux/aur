# Maintainer: Fabian Maurer <dark.shadow4@web.de>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

_name=ldb
pkgname=lib32-$_name
pkgver=1.5.4
pkgrel=1
pkgdesc="A schema-less, ldap like, API and database"
arch=('x86_64')
url="https://ldb.samba.org/"
license=('GPL3')
depends=('lib32-talloc' 'lib32-tevent' 'lib32-tdb' 'lib32-popt' 'lib32-libbsd' 'ldb')
makedepends=('lib32-python3' 'lib32-cmocka')
optdepends=('lib32-python3: for python bindings')
source=(https://samba.org/ftp/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('24d9f18b085ba27f96d4dec643abea39')

build() {
  cd ${_name}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python3-32'
  export PYTHON_CONFIG='/usr/bin/python3-32-config'
  export PYTHONPATH="/usr/lib32/python3.7/site-packages"

  ./configure --prefix=/usr \
    --disable-rpath \
    --disable-rpath-install \
    --bundled-libraries=NONE \
    --builtin-libraries=replace \
    --libdir=/usr/lib32 \
    --with-modulesdir=/usr/lib32/ldb/modules \
    --with-privatelibdir=/usr/lib32/ldb
  
  make
}

package() {
  cd "${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
