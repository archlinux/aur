# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname="cups-nosystemd"
pkgver=2.3.3op2
pkgrel=2
epoch=1
pkgdesc="The CUPS Printing System - daemon package"
arch=('i686' 'x86_64')
license=('Apache' 'custom')
url="https://github.com/OpenPrinting/cups"
groups=('eudev-base')
depends=('acl' 'pam' "libcups>=${pkgver}" 'cups-filters' 'bc'
         'dbus' 'hicolor-icon-theme' 'libpaper')
makedepends=('libtiff>=4.0.0' 'libpng>=1.5.7' 'xdg-utils' 'krb5' 'xinetd'
             'gzip' 'autoconf' 'avahi' 'gnutls' 'inetutils' 'libxcrypt')
optdepends=('ipp-usb: allows to send HTTP requests via a USB connection on devices without Ethernet or WiFi connections'
            'xdg-utils: xdg .desktop file support'
            'colord: for ICC color profile support'
            'logrotate: for logfile rotation support'
            'cups-openrc: cups openrc initscript')
provides=("cups=${pkgver}")
conflicts=('cups' 'cups-eudev')
replaces=('cups' 'cups-eudev')
install=cups-nosystemd.install
backup=(etc/cups/cupsd.conf
        etc/cups/snmp.conf
        etc/cups/printers.conf
        etc/cups/classes.conf
        etc/cups/cups-files.conf
        etc/cups/subscriptions.conf
        etc/logrotate.d/cups
	etc/pam.d/cups)
	#etc/xinetd.d/cups-lpd)
source=(https://github.com/OpenPrinting/cups/releases/download/v${pkgver}/cups-${pkgver}-source.tar.gz
        cups cups.logrotate cups.pam
        # improve build and linking
        cups-no-export-ssllibs.patch
        cups-1.6.2-statedir.patch
        # upstream fixes
        increase_timeout.patch
        )
sha256sums=('deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c94318a74efec86f96df'
            '87cd833e7c07a36298341e35d5ce0534ce68fdf76ce3e9eda697e5455b963d1b'
            'd87fa0f0b5ec677aae34668f260333db17ce303aa1a752cba5f8e72623d9acf9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            'ff3eb0782af0405f5dafe89e04b1b4ea7a49afc5496860d724343bd04f375832'
            '23349c96f2f7aeb7d48e3bcd35a969f5d5ac8f55a032b0cfaa0a03d7e37ea9af'
            '72a04cb74c4b6240affbc32cf759562cca94efccc213210780b1e7b98f00dfd5')

prepare() {
  cd cups-${pkgver}

  # improve build and linking
  # Do not export SSL libs in cups-config
  patch -Np1 -i "$srcdir"/cups-no-export-ssllibs.patch

  # move /var/run -> /run for pid file
  patch -Np1 -i "$srcdir"/cups-1.6.2-statedir.patch

  # FS#70382 - https://github.com/OpenPrinting/cups/pull/174
  patch -Np1 -i "${srcdir}"/increase_timeout.patch

  # Rebuild configure script for not zipping man-pages.
  aclocal -I config-scripts
  autoconf -I config-scripts
}

build() {
  cd cups-${pkgver}

  # The build system uses only DSOFLAGS but not LDFLAGS to build some libraries.
  export DSOFLAGS=${LDFLAGS}

  ./configure \
     --prefix=/usr \
     --sysconfdir=/etc \
     --localstatedir=/var \
     --sbindir=/usr/bin \
     --libdir=/usr/lib \
     --with-logdir=/var/log/cups \
     --with-docdir=/usr/share/cups/doc \
     --with-exe-file-perm=0755 \
     --with-cups-user=daemon \
     --with-cups-group=lp \
     --with-max-log-size=0 \
     --enable-pam=yes \
     --enable-raw-printing \
     --enable-dbus=yes \
     --with-dbusdir=/usr/share/dbus-1 \
     --enable-ssl=yes \
     --enable-relro \
     --enable-threads \
     --enable-avahi \
     --enable-libpaper \
     --with-optim="$CFLAGS"
  make
}

package() {
  cd "$srcdir"/cups-${pkgver}
  make BUILDROOT="$pkgdir" install-data install-exec

  # this one we ship in the libcups pkg
  rm -f "$pkgdir"/usr/bin/cups-config

  # kill the sysv stuff
  rm -rf "$pkgdir"/etc/rc*.d
  rm -rf "$pkgdir"/etc/init.d
  install -D -m755 ../cups "$pkgdir"/etc/rc.d/cupsd
  install -D -m644 ../cups.logrotate "$pkgdir"/etc/logrotate.d/cups
  install -D -m644 ../cups.pam "$pkgdir"/etc/pam.d/cups

  # fix perms on /var/spool and /etc
  chmod 755 "$pkgdir"/var/spool
  chmod 755 "$pkgdir"/etc

  # install ssl directory where to store the certs, solves some samba issues
  install -dm700 -g lp "$pkgdir"/etc/cups/ssl
  # remove directory from package, we create it in cups rc.d file
  rm -rf "$pkgdir"/run

  # install some more configuration files that will get filled by cupsd
  touch "$pkgdir"/etc/cups/printers.conf
  touch "$pkgdir"/etc/cups/classes.conf
  touch "$pkgdir"/etc/cups/subscriptions.conf
  chgrp -R lp "$pkgdir"/etc/cups

  # fix .desktop file
  sed -i 's|^Exec=htmlview http://localhost:631/|Exec=xdg-open http://localhost:631/|g' "$pkgdir"/usr/share/applications/cups.desktop

  # compress some driver files, adopted from Fedora
  find "$pkgdir"/usr/share/cups/model -name "*.ppd" | xargs gzip -n9f

  # remove client.conf man page
  rm -f "$pkgdir"/usr/share/man/man5/client.conf.5

  # comment out all conversion rules which use any of the removed filters that are now part of cups-filters
  perl -p -i -e 's:^(.*\s+bannertops\s*)$:#\1:' "$pkgdir"/usr/share/cups/mime/mime.convs

  # comment out unnecessary PageLogFormat entry
  sed -i -e 's:PageLogFormat:#PageLogFormat:' "$pkgdir"/etc/cups/cupsd.conf*
}
