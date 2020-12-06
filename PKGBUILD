# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Yaron de Leeuw < me@jarondl.net >
# Maintained at : https://github.com/funilrys/PKGBUILD/tree/master/pidgin-light
# Lately maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>
# Contributor: Adriano Foschi <adriano.src gmail com>
# Contributor: Ismael Carnales <icarnales@gamail.com>
# Contributor: Ian Chou <forendef2846 at gmail dot com>

pkgname=pidgin-light
pkgver=2.14.1
pkgrel=1
pkgdesc="A light pidgin version: msn, jabber, irc supported protocols without gstreamer, tcl, tk, xscreensaver support.No video/voice.  Includes finch "
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'libidn' 'nss' 'python' 'gtkspell'
         'hicolor-icon-theme' 'libxml2' 'gtk-update-icon-cache')
makedepends=('ca-certificates' 'perl-xml-parser' 'intltool' 'pkg-config')
optdepends=('dbus-python: needed for purple-remote & purple-url-handler only' 'gstreamer0.10-good: sound')
replaces=('gaim')
provides=('pidgin' 'finch' 'libpurple')
conflicts=('pidgin' 'pidgin-msn' 'pidin-light-msn' 'finch' 'libpurple')
options=('!libtool')
install='pidgin-light.install'
source=("http://downloads.sourceforge.net/project/pidgin/Pidgin/${pkgver}/pidgin-${pkgver}.tar.bz2"
        'anti-flood.patch')

sha256sums=('f132e18d551117d9e46acce29ba4f40892a86746c366999166a3862b51060780'
            '0b792053434d686131d090e77fb1d6e0e1739c7feb0e8c277bda575adc24f16a')

prepare() {
  cd "$srcdir/pidgin-$pkgver"
  patch -p0 < ../anti-flood.patch
}

build() {

    cd "$srcdir/pidgin-$pkgver"

    # Pidgin doesn't explicitly link to libm
    LDFLAGS+=' -Wl,--copy-dt-needed-entries'

    ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install\
    --disable-meanwhile --disable-screensaver --disable-nm\
    --disable-gnutls --disable-doxygen --disable-tcl --disable-tk --disable-vv\
    --disable-avahi --disable-gstreamer\
    --disable-farstream --with-system-ssl-certs=/etc/ssl/certs
    make
}
package() {
cd "$srcdir/pidgin-$pkgver"
   make DESTDIR="$pkgdir" install

# Remove GConf schema file
  rm -rf "$pkgdir/etc"
}

# vim:set ts=2 sw=2 et:
