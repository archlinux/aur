# Maintainer: Michael Hansen <zrax0111 gmail com>
# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: ngoonee <ngoonee.talk@gmail.com>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
pkgname=openchange
_codename=VULCAN
pkgver=2.3
pkgrel=1
pkgdesc="A portable, open source implementation of Microsoft Exchange server \
and Exchange protocols."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.openchange.org"
license=('GPL3')
depends=('samba>=4.2.2' 'libical' 'sqlite3' 'file' 'boost' 'python2'
         'libmariadbclient' 'nanomsg>=0.5' 'libmemcached>=1.0.18')
makedepends=('ccache' 'docbook-xsl' 'libxslt' 'python2-setuptools'
             'python2-pylons')
optdepends=('python2-pylons: Needed for OCSManager')
options=(!makeflags)
# Releases are mirrored at http://tracker.openchange.org/projects/openchange/files
source=("https://github.com/openchange/openchange/archive/${pkgname}-${pkgver}-${_codename}.tar.gz"
        "ocsmanager.service"
        "openchange-provision-type-error.patch"
        "openchange-issue-249.patch")

sha256sums=('46ffdc779bb7bf6a823f6d1a78c5ca3f5548b981ad90164214a68279b403a05e'
            '45bd19e2a5725a94692ae606086be6d57423375c9b1c0eb5322c6e09ef2b5fb3'
            '65dc742e95dd1bff1581ea3d76b4dfe8d01ca52ab5e64ffc80efc10417a2ff97'
            'e3cfd2455a52d4b68153b3d546c70edbde5cf024ebcec1088a923aedaa938834')

# Used to be pkgname-pkgver-codename, but now we have two openchanges. WAT
_srcsubdir="${pkgname}-${pkgname}-${pkgver}-${_codename}"

build() {
    cd "${srcdir}/${_srcsubdir}"

    patch -p1 < "${srcdir}/openchange-provision-type-error.patch"
    patch -p1 < "${srcdir}/openchange-issue-249.patch"

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
    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" pyopenchange-install

    # NOTE:  Not using `make installman' because that generates a bunch
    #   of doxygen-based manpages which may have conflicting names with
    #   other system man pages
    install -d "${pkgdir}/usr/share/man"
    cp -r doc/man/man* "${pkgdir}/usr/share/man"

    cd "${pkgdir}/usr/lib"
    ln -s libmapi.so libmapi.so.0
    ln -s libocpf.so libocpf.so.0

    # Install OCSManager
    cd "${srcdir}/${_srcsubdir}"
    make srcdir="${srcdir}/${_srcsubdir}" DESTDIR="${pkgdir}" ocsmanager-install
    install -vdm700 -o http -g http "${pkgdir}/var/cache/ntlmauthhandler"
    install -vDm644 "${srcdir}/ocsmanager.service" \
                    "${pkgdir}/usr/lib/systemd/system/ocsmanager.service"
    install -vDm644 "${srcdir}/${_srcsubdir}/mapiproxy/services/ocsmanager/ocsmanager.ini" \
                    "${pkgdir}/etc/ocsmanager/ocsmanager.ini"
    install -vDm644 "${srcdir}/${_srcsubdir}/mapiproxy/services/ocsmanager/ocsmanager-apache.conf" \
                    "${pkgdir}/etc/httpd/conf/extra/ocsmanager.conf"

    # Install RPC Proxy
    cd "${srcdir}/${_srcsubdir}/mapiproxy/services/web/rpcproxy"
    install -vdm755 "${pkgdir}/usr/lib/openchange/web/rpcproxy"
    install -vm644  "${srcdir}/${_srcsubdir}/mapiproxy/services/web/rpcproxy/rpcproxy.conf" \
                    "${pkgdir}/etc/httpd/conf/extra/rpcproxy.conf"
    python2 setup.py install \
              --root="${pkgdir}" \
              --install-lib=/usr/lib/openchange/web/rpcproxy \
              --install-scripts=/usr/lib/openchange/web/rpcproxy

    find "${pkgdir}/usr/lib/python${_pyver}/site-packages" -name '*.py' | \
         xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}
