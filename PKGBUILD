# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=('pidgin')
pkgname=('libpurple' 'pidgin' 'finch')
pkgver=2.7.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'python'
	'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10-base' 'farsight2' 'avahi'
	'tk' 'ca-certificates' 'intltool' 'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgbase}/${pkgver}/${pkgbase}-${pkgver}.tar.bz2
	msn_fix.patch)
sha256sums=('dc59cbae75db8ecf2850c35e82fc11ac33bbf2542e901e6e1e4525688635783d'
	    '1910ea7dd816d3e9b123fa9dc204ad586396a820ae3c870a6aa15dd1eff0ad49')

build() {
    cd "$srcdir/$pkgbase-$pkgver"

    patch -Np0 -i "${srcdir}/msn_fix.patch" || return 1
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-schemas-install \
                --disable-meanwhile \
                --disable-perl \
                --disable-gnutls \
                --enable-cyrus-sasl \
                --disable-doxygen \
		--enable-nm \
                --with-system-ssl-certs=/etc/ssl/certs || return 1
    make || return 1
}
package_libpurple(){
    pkgdesc="IM library extracted from Pidgin"
    depends=('farsight2' 'libsasl' 'dbus-glib' 'silc-toolkit' 'nss' 'cyrus-sasl-plugins')
    cd "$srcdir/$pkgbase-$pkgver"

    for dir in libpurple share/sounds share/ca-certs m4macros po
    do
	make -C "$dir" DESTDIR="$pkgdir" install || return 1
    done
#    rm -rf "$pkgdir/etc" || return 1
}

package_pidgin(){
    pkgdesc="Multi-protocol instant messaging client"
    depends=("libpurple=$pkgver" 'startup-notification' 'gtkspell' 'libxss' 'python'
            'hicolor-icon-theme' 'gstreamer0.10-base')
    optdepends=('gstreamer0.10-good: to play sounds'
                'avahi: Bonjour protocol support'
                'tk: Tcl/Tk scripting support'
                'ca-certificates: SSL CA certificates'
                'aspell: for spelling correction')

    install=pidgin.install
    cd "$srcdir/$pkgbase-$pkgver"
    #for linking
    make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES || return 1

    make -C pidgin DESTDIR="$pkgdir" install || return 1
    make -C doc DESTDIR="$pkgdir" install || return 1

    #clean up libpurple
    make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES || return 1

    install -D -m 0644 pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop || return 1

    rm -f "$pkgdir"/usr/share/man/man1/finch.1 || return 1
}
package_finch(){
    pkgdesc="A ncurses-based messaging client"
    depends=("libpurple=$pkgver" 'python')
    optdepends=('avahi: Bonjour protocol support'
    		'tk: Tcl/Tk scripting support'
		'ca-certificates: SSL CA certificates')

    cd "$srcdir/$pkgbase-$pkgver"
    #for linking
    make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES || return 1

    make -C finch DESTDIR="$pkgdir" install || return 1
    make -C doc DESTDIR="$pkgdir" install || return 1

    #clean up libpurple
    make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES || return 1
    rm -f "$pkgdir"/usr/share/man/man1/pidgin.1 || return 1
}
