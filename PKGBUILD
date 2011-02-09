# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=('pidgin')
pkgname=('libpurple' 'pidgin' 'finch')
pkgver=2.7.10
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'python2' 'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10'
             'farsight2' 'avahi' 'tk' 'ca-certificates' 'intltool' 'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2)
md5sums=('7514a5e25cc0061e7e1b7a1928c99247')

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    sed -i "s#env python#env python2#" */plugins/*.py
    sed -i "s#env python#env python2#" libpurple/purple-{remote,notifications-example,url-handler}
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-schemas-install \
                --disable-meanwhile \
                --disable-gnutls \
                --enable-cyrus-sasl \
                --disable-doxygen \
                --enable-nm \
		--with-python=/usr/bin/python2 \
                --with-system-ssl-certs=/etc/ssl/certs
    make
}
package_libpurple(){
    pkgdesc="IM library extracted from Pidgin"
    depends=('farsight2' 'libsasl' 'dbus-glib' 'silc-toolkit' 'nss' 'cyrus-sasl-plugins')
    optdepends=('dbus-python: for purple-remote and purple-url-handler')
    cd "${srcdir}/${pkgbase}-${pkgver}"

    for dir in libpurple share/sounds share/ca-certs m4macros po
    do
        make -C "${dir}" DESTDIR="${pkgdir}" install
    done
#    rm -rf "$pkgdir/etc" || return 1
}

package_pidgin(){
    pkgdesc="Multi-protocol instant messaging client"
    depends=("libpurple=$pkgver" 'startup-notification' 'gtkspell' 'libxss' 'hicolor-icon-theme' 'gstreamer0.10')
    optdepends=('aspell: for spelling correction'
                'avahi: Bonjour protocol support'
                'ca-certificates: SSL CA certificates'
                'gstreamer0.10-good-plugins: video and voice support'
                'tk: Tcl/Tk scripting support')

    install=pidgin.install
    cd "${srcdir}/${pkgbase}-${pkgver}"
    #for linking
    make -C libpurple DESTDIR="${pkgdir}" install-libLTLIBRARIES

    make -C pidgin DESTDIR="${pkgdir}" install
    make -C doc DESTDIR="${pkgdir}" install

    #clean up libpurple
    make -C libpurple DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES

    install -D -m 0644 pidgin.desktop "${pkgdir}"/usr/share/applications/pidgin.desktop

    rm -f "${pkgdir}"/usr/share/man/man1/finch.1
}
package_finch(){
    pkgdesc="A ncurses-based messaging client"
    depends=("libpurple=$pkgver" 'python2' 'gstreamer0.10')
    optdepends=('avahi: Bonjour protocol support'
                'ca-certificates: SSL CA certificates'
                'tk: Tcl/Tk scripting support')

    cd "${srcdir}/${pkgbase}-${pkgver}"
    #for linking
    make -C libpurple DESTDIR="${pkgdir}" install-libLTLIBRARIES

    make -C finch DESTDIR="${pkgdir}" install
    make -C doc DESTDIR="${pkgdir}" install

    #clean up libpurple
    make -C libpurple DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES
    rm -f "${pkgdir}"/usr/share/man/man1/pidgin.1
}
