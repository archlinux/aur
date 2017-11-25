# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=ldb
pkgname=lib32-$_name
pkgver=1.3.0
pkgrel=1
pkgdesc="A schema-less, ldap like, API and database"
arch=('i686' 'x86_64')
url="https://ldb.samba.org/"
license=('GPL3')
depends=('lib32-talloc' 'lib32-tevent' 'lib32-tdb' 'lib32-popt' 'ldb')
makedepends=('lib32-python2' 'lib32-cmocka')
optdepends=('lib32-python2: for python bindings')
source=(https://samba.org/ftp/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('44b53e5a3bc45c8dc837a7e0e00a78e87911da5959ad1b026a62f5b9b4d5590d')

build() {
	cd "${_name}-${pkgver}"

    # fix python2
    sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" buildtools/bin/waf
    
    # set lib32 and python2 environment
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    export PYTHON='/usr/bin/python2-32'
    export PYTHON_CONFIG='/usr/bin/python2-32-config'
	
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
