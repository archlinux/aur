# Maintainer: AndyRTR <andyrtr@archlinux.org>

# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri <admin@richardmurri.com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>
# Contributor: Milan Knížek <knizek@volny.cz>

pkgname=x2goserver
pkgver=4.1.0.3
pkgrel=10
pkgdesc="Open source graphical Remote Desktop and terminal server based on NX technology"
arch=('x86_64')
url="https://www.x2go.org/"
license=('GPL2')
# https://code.x2go.org/gitweb?p=x2goserver.git;a=blob;f=x2goserver.spec

# from 4.0.1.20 changelog there could be new deps on bash, xkeyboard-config, perl-cwd-guard

depends=(
         'openssh'
         'nxagent' # FS#67024
         # certain shell script hardcode bash
         'bash'
         # for x2goruncommand - for now
         'bc'
         # for ss in x2gogetfreeport 
        'iproute'
         # for x2goshowblocks
         'lsof'
         # For killall in x2gosuspend-session
         'psmisc'
         # For x2godbadmin
         'pwgen' # in community
         # For printing, file-sharing
         'sshfs'
	 # for /etc/sudoers.d
         'sudo'
         'which'
         # For /etc/X11/Xresources
         'xorg-xinit' 
         'inetutils' # FS#68276
         'xorg-fonts-misc'
         'xorg-xauth'
         'xkeyboard-config'
         'xorg-xwininfo' # FS#38558
         'xorg-setxkbmap' # FS#53345

         # for useradd/groupadd
         'shadow'

         # for filemanager bindings
         'desktop-file-utils'
         'shared-mime-info'
         'xdg-utils'

         # We need a database
         'perl-dbd-sqlite' 

         'perl-capture-tiny'
         'perl-config-simple'
         'perl-file-basedir' # FS#38551
         'perl-file-which' # FS#44125
         'perl-switch'
         'perl-try-tiny' # FS#58226
 #        'perl-file-readbackwards' ?

         'dbus'
)
#makedepends=('man2html' 'perl-extutils-makemaker' 'systemd')
makedepends=('man2html' 'perl-extutils-makemaker' 'systemd' 
             # only needed for file system paths
             'sudo'
)
optdepends=('perl-dbd-pg: Postgres support')
#conflicts=('x2go-agent')
#replaces=('x2go-agent')
#provides=('x2go-agent' 'x2goagent')
options=('emptydirs')
install=x2goserver.install
backup=('etc/x2go/x2goserver.conf'
        'etc/x2go/desktopsharing/settings'
        # from old x2go-agent pkg now provided here
        etc/x2go/{keystrokes.cfg,x2goagent.keyboard,x2goagent.options}
)
# no https due to invalid certificate
source=(https://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc}
       tmpfiles.d
       sysusers.d
       reproducible-man-gzip.patch)
sha256sums=('6776aaa354f5a44e349f0b3c176d4988c88a618c2edf46c98a37ae89c069dcd0'
            'SKIP'
            '548d48925171aeca198494236cfba7232921a25a1c4c81f5d004a734d83d1350'
            '04d429e8d8fe02c8078d75ba63ba57774274df877b2c6ec942621312b7bf9118'
            '2d52a5ca28d5b65a9cc9bd8cdc74d030d7faddb6d727d2df520686934ea125fb')
validpgpkeys=('1AD23D1B8F087A35AB74BDE9F4A7678C9C6B0B2B') # X2go Git Administrator <git-admin@x2go.org>

prepare() {
  cd ${pkgname}-${pkgver}
  # -r option does not exist in Arch linux
  # (However, html man pages do not get installed anyway...)
  for Makefile in $(find . -type f -name Makefile); do
    sed -i 's@(MAN2HTML_BIN) -r @(MAN2HTML_BIN) < @g' $Makefile
    sed -i 's@ \$(MAN2HTML_SRC)/@ < \$(MAN2HTML_SRC)/@g' $Makefile
  done

  # fix some Makefile permission options
  for Makefile in $(find . -type f -name Makefile); do
    sed -i "s:-o root -g root ::g" $Makefile
  done
  # Do not ship xsession - Debian specific
  sed -i -e '/xsession/s/^/#/' Makefile

  # remove timestamp to solve reproducible build
  patch -Np1 -i ../reproducible-man-gzip.patch
}

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="$pkgdir" PERL_INSTALLDIRS=vendor
}

package() {
  cd ${pkgname}-${pkgver}
  make -j1 PREFIX=/usr SBINDIR=/usr/bin DESTDIR="$pkgdir" install

  # systemd files
  install -Dm 644 "$srcdir/${pkgname}-${pkgver}/x2goserver.service" "$pkgdir/usr/lib/systemd/system/x2goserver.service"
  # overwrite upstream systemd tmofile "x /tmp/.x2go-*" with ours
  cat ../tmpfiles.d >> "${pkgdir}"/usr/lib/tmpfiles.d/x2goserver.conf
  install -Dm644 ../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/x2goserver.conf
  
  # load fuse module at system start
  install -dm755 "$pkgdir"/usr/lib/modules-load.d
  echo "fuse" > "$pkgdir"/usr/lib/modules-load.d/x2goserver.conf

  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/"

  # fix permission - see INSTALL file
  chown root:111 "${pkgdir}"/usr/lib/x2go/libx2go-server-db-sqlite3-wrapper
  chmod 2755 "${pkgdir}"/usr/lib/x2go/libx2go-server-db-sqlite3-wrapper
  
  chown root:112 "${pkgdir}"/usr/bin/x2goprint
  chmod 2755 "${pkgdir}"/usr/bin/x2goprint
  
  chmod 750 "${pkgdir}"/etc/sudoers.d
  chmod 0440 "${pkgdir}"/etc/sudoers.d/x2goserver

  # Arch offer logcheck package - http://logcheck.org/
  rm -r "${pkgdir}"/etc/logcheck
}
