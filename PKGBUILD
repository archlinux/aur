# Maintainer: rafaelff <rafaelff@gnome.org>

_name=ldb
pkgname=lib32-$_name
pkgver=1.1.26
pkgrel=2
pkgdesc="A schema-less, ldap like, API and database"
arch=('i686' 'x86_64')
url="http://ldb.samba.org/"
source=(http://samba.org/ftp/${_name}/${_name}-${pkgver}.tar.gz)
license=('GPL3')
depends=('lib32-talloc' 'lib32-tevent' 'lib32-tdb' 'lib32-popt' 'ldb')
makedepends=('lib32-python2')
optdepends=('lib32-python2: for python bindings')
md5sums=('31780b702b638ad32aa5d9853d257839')

build() {
	cd "${_name}-${pkgver}"

    # fix python2
    sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" buildtools/bin/waf
    
    # set lib32 and python2 environment
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    export PYTHON='/usr/bin/python2.7-32'
    export PYTHON_CONFIG='/usr/bin/python2.7-32-config'
	
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
