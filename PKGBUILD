# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=('pidgin')
pkgname=('libpurple' 'pidgin' 'finch')
pkgver=2.6.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'python'
	'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10-base' 'farsight2' 'avahi'
	'tk' 'ca-certificates' 'intltool' 'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgbase}/${pkgver}/${pkgbase}-${pkgver}.tar.bz2)
sha256sums=('6ebbe9d339246dfebb244e4c855c4feb678f120d1024ef2ee269e2fde77b2ad9')

build() {
    cd "$srcdir/$pkgbase-$pkgver"

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
    depends=('farsight2' 'libsasl' 'dbus-glib' 'silc-toolkit' 'nss')
    optdepends=('cyrus-sasl-plugins: needed for facebook xmpp authentication')
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
    depends=("libpurple=$pkgver" 'libidn')
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
