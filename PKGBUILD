# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=('pidgin')
pkgname=('libpurple' 'pidgin' 'finch')
pkgver=2.7.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'python'
             'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10-base' 'farsight2' 'avahi'
             'tk' 'ca-certificates' 'intltool' 'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgbase}/${pkgver}/${pkgbase}-${pkgver}.tar.bz2
        icq_fix.patch oscar_xstatus_remote_crash_fix_2_for_pidgin_2.7.1.diff)
md5sums=('0dd2adb9e8214ac960f956823c84e7e2'
         '2ce887cf36e698282b9241832850defd'
         '29cb9bb0e74db8bf6c18c048e935a60a')

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    patch -Np0 -i "${srcdir}/icq_fix.patch"
    patch -Np0 -i "${srcdir}/oscar_xstatus_remote_crash_fix_2_for_pidgin_2.7.1.diff"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-schemas-install \
                --disable-meanwhile \
                --disable-perl \
                --disable-gnutls \
                --enable-cyrus-sasl \
                --disable-doxygen \
                --enable-nm \
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
    depends=("libpurple=$pkgver" 'startup-notification' 'gtkspell' 'libxss' 'python'
            'hicolor-icon-theme' 'gstreamer0.10-base')
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
    depends=("libpurple=$pkgver" 'python')
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
