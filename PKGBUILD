# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: DJ Lucas <dj@linuxfromscratch.org>
# Contributor: ngoonee <ngoonee.talk@gmail.com>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
pkgname=openchange
_codename=NANOPROBE
pkgver=2.2
pkgrel=4
pkgdesc="A portable, open source implementation of Microsoft Exchange server \
and Exchange protocols.  This package was originally created to support \
evolution-mapi and may not work for any other purpose."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.openchange.org"
license=('GPL3')
depends=('samba>=4.2' 'libical' 'sqlite3' 'file' 'boost' 'python2' 'libmariadbclient')
makedepends=('ccache' 'python2' 'docbook-xsl' 'libxslt')
options=(!makeflags)
# Releases are mirrored at http://tracker.openchange.org/projects/openchange/files
source=("https://github.com/openchange/openchange/archive/${pkgname}-${pkgver}-${_codename}.tar.gz"
        "openchange-samba42.patch")

sha256sums=('84e22ea408b46e2c7ba2894af3b8514cc45434c85f55198a321dc5ea194ac6d8'
            '8e4c2afede896e16a74be87323412bdcad8173d6943107a0aab38c6b77860887')

# Used to be pkgname-pkgver-codename, but now we have two openchanges. WAT
_srcsubdir="${pkgname}-${pkgname}-${pkgver}-${_codename}"

build() {
    cd "${srcdir}/${_srcsubdir}"

    patch -p1 < "${srcdir}/openchange-samba42.patch"

    PYTHON_CALLERS="$(find ${srcdir}/${_srcsubdir} -name '*.py')
                    $(find ${srcdir}/${_srcsubdir} -name 'configure.ac')
                    setup/openchange_newuser setup/openchange_provision
                    mapiproxy/services/web/rpcproxy/rpcproxy.wsgi"
    sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" \
           -e "s|python-config|python2-config|" \
           -e "s|bin/python|bin/python2|" \
        ${PYTHON_CALLERS}

    # Fix linking of boost_thread in autoconf test
    sed -i -e "s|-lboost_thread\$BOOST_LIB_SUFFIX|-lboost_thread\$BOOST_LIB_SUFFIX -lboost_system\$BOOST_LIB_SUFFIX|" \
        configure.ac

    export PYTHON=/usr/bin/python2

    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --datadir=/usr/share/samba \
        --enable-pyopenchange \
        --with-modulesdir=/usr/lib/samba/modules
    make FLEX=/usr/bin/flex BISON=/usr/bin/bison || return 1
}

package() {
    _pyver=`python2 -c 'import sys; print(sys.version[:3])'`

    cd "${srcdir}/${_srcsubdir}"
    make DESTDIR="$pkgdir/" install

    # NOTE:  Not using `make installman' because that generates a bunch
    #   of doxygen-based manpages which may have conflicting names with
    #   other system man pages
    install -d "${pkgdir}/usr/share/man"
    cp -r doc/man/man* "${pkgdir}/usr/share/man"

    cd "${pkgdir}/usr/lib"
    ln -s libmapi.so libmapi.so.0
    ln -s libocpf.so libocpf.so.0

    find "${pkgdir}/usr/lib/python${_pyver}/site-packages" -name '*.py' | \
         xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}
