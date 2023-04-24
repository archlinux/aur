# Maintainer: bud of budlabs
# based on : pidgin-light and pidgin-mini on AUR

pkgname=pidgin-bud
pkgver=2.14.12
pkgrel=6
pkgdesc="minimal Pidgin (XMPP/IRC), includes input-box-bug fix"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'libidn' 'nss' 'python' 'gtkspell'
         'hicolor-icon-theme' 'libxml2' 'gtk-update-icon-cache')
makedepends=('ca-certificates' 'perl-xml-parser' 'intltool' 'pkg-config')
optdepends=('dbus-python: needed for purple-remote & purple-url-handler only')
replaces=('gaim')
provides=('pidgin' 'libpurple')
conflicts=('pidgin' 'libpurple')
options=('!libtool')
install='pidgin.install'
source=(https://downloads.sourceforge.net/project/pidgin/Pidgin/"$pkgver"/pidgin-"$pkgver".tar.bz2{,.asc}
        'anti-flood.patch'
        'input-box-fix.patch'
        )

sha256sums=('2b05246be208605edbb93ae9edc079583d449e2a9710db6d348d17f59020a4b7'
            SKIP
            '0b792053434d686131d090e77fb1d6e0e1739c7feb0e8c277bda575adc24f16a'
            '592a80863af2e87ee91846c69b4c7c653cc363a82a6499c82206c5fd0c9ee8c5')

validpgpkeys=('48F66AFFD9BDB729' '40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

prepare() {
  cd "$srcdir/pidgin-$pkgver"
  patch -p0 < ../anti-flood.patch
  patch -p0 < ../input-box-fix.patch
}

build() {

    cd "$srcdir/pidgin-$pkgver"

    # Pidgin doesn't explicitly link to libm
    LDFLAGS+=' -Wl,--copy-dt-needed-entries'

    ./configure --prefix=/usr --sysconfdir=/etc \
      --with-system-ssl-certs=/etc/ssl/certs \
      --with-dynamic-prpls=jabber,irc \
      --enable-cyrus-sasl \
      --disable-avahi \
      --disable-consoleui \
      --disable-doxygen \
      --disable-farstream \
      --disable-gestures \
      --disable-gevolution \
      --disable-gnutls \
      --disable-gstreamer \
      --disable-idn \
      --disable-meanwhile \
      --disable-mono \
      --disable-nls \
      --disable-nm \
      --disable-perl \
      --disable-schemas-install \
      --disable-screensaver \
      --disable-tcl \
      --disable-tk \
      --disable-dbus \
      --disable-vv
      
    make
}
package() {
  cd "$srcdir/pidgin-$pkgver"
  make DESTDIR="$pkgdir" install
  # Remove GConf schema file
  rm -rf "$pkgdir/etc"
}
