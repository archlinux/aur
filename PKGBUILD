# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: lilac
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=cups-git
pkgname=(libcups-git cups-git)
pkgver=2.4.1.r14.g55359b905
pkgrel=1
arch=(x86_64)
license=(Apache)
url="https://openprinting.github.io/cups/"
makedepends=(git libtiff libpng acl pam xdg-utils krb5 gnutls
             cups-filters bc colord xinetd gzip autoconf libusb dbus
             avahi hicolor-icon-theme systemd inetutils libpaper)
source=("git+https://github.com/OpenPrinting/cups.git"
        cups.logrotate
        cups.pam
        cups.sysusers
        cups-2.4.0-statedir.patch
        # bugfixes
        cups-freebind.patch
        guid.patch)
sha256sums=('SKIP'
            'd87fa0f0b5ec677aae34668f260333db17ce303aa1a752cba5f8e72623d9acf9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '06173dfaea37bdd9b39b3e09aba98c34ae7112a2f521db45a688907d8848caa2'
            'f0b15192952c151b1843742c87850ff3a7d0f3ba5dd236ed16623ef908472ad7'
            '3385047b9ac8a7b13aeb8f0ca55d15f793ce7283516db0155fe28a67923c592d'
            '0bf6a75ba1b051771f155d9a5d36b307a6d40c6857d645b250fe93f3fb713474')
#validpgpkeys=('3737FD0D0E63B30172440D2DDBA3A7AB08D76223') # CUPS.org (CUPS.org PGP key) <security@cups.org>
#validpgpkeys+=('45D083946E3035282B3CCA9AF434104235DA97EB') # "CUPS.org <security@cups.org>"
#validpgpkeys+=('845464660B686AAB36540B6F999559A027815955') # "Michael R Sweet <michael.r.sweet@gmail.com>"

pkgver() {
  cd "cups"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "cups"

  # move /var/run -> /run for pid file
  patch -Np1 -i "${srcdir}"/cups-2.4.0-statedir.patch

  # bug fixes

  # https://github.com/OpenPrinting/cups/issues/53
  # use IP_FREEBIND, because cupsd cannot bind to not yet existing IP address
  patch -Np1 -i "${srcdir}"/cups-freebind.patch

  # FS#56818 - https://github.com/apple/cups/issues/5236
  patch -Np1 -i "${srcdir}"/guid.patch

  # Rebuild configure script
  aclocal -I config-scripts
  autoconf -I config-scripts
}

build() {
  cd "cups"

  # The build system uses only DSOFLAGS but not LDFLAGS to build some libraries.
  export DSOFLAGS=${LDFLAGS}

  # use fixed cups user (id 209) since systemd adds "lp" group without a fixed id
  ./configure --prefix=/usr \
     --sysconfdir=/etc \
     --localstatedir=/var \
     --sbindir=/usr/bin \
     --libdir=/usr/lib \
     --with-logdir=/var/log/cups \
     --with-docdir=/usr/share/cups/doc \
     --with-exe-file-perm=0755 \
     --with-cups-user=209 \
     --with-cups-group=209 \
     --with-max-log-size=0 \
     --enable-pam=yes \
     --enable-raw-printing \
     --enable-dbus=yes \
     --with-dbusdir=/usr/share/dbus-1 \
     --enable-relro \
     --enable-libpaper \
     --with-optim="$CFLAGS" #--help
  make
}

check() {
  cd "cups"
  #make -k check
}

package_libcups-git() {
  pkgdesc="The CUPS Printing System - client libraries and headers"
  depends=(gnutls libtiff libpng krb5 avahi libusb)
  provides=("libcups=${pkgver%.r*}")
  conflicts=(libcups)

  cd "cups"
  make -j1 BUILDROOT=${pkgdir} install-headers install-libs
  # put this into the libs pkg to make other software find the libs(no pkg-config file included)
  mkdir -p ${pkgdir}/usr/bin
  install -m755 ${srcdir}/cups/cups-config ${pkgdir}/usr/bin/cups-config
}

package_cups-git() {
  pkgdesc="The CUPS Printing System - daemon package"
  install=cups.install
  backup=(etc/cups/cupsd.conf
          etc/cups/snmp.conf
          etc/cups/printers.conf
          etc/cups/classes.conf
          etc/cups/cups-files.conf
          etc/cups/subscriptions.conf
          etc/logrotate.d/cups
          etc/pam.d/cups)
  depends=(acl pam cups-filters bc
           dbus systemd libpaper hicolor-icon-theme)
  depends+=(libcups-git)
  optdepends=('xdg-utils: xdg .desktop file support'
              'colord: for ICC color profile support')
  provides=(cups)
  conflicts=(cups)


  cd "cups"
  make -j1 BUILDROOT=${pkgdir} install-data install-exec

  make BUILDROOT="${pkgdir}" install-data install-exec

  # this one we ship in the libcups pkg
  rm -f "${pkgdir}"/usr/bin/cups-config

  # kill the sysv stuff
  rm -rf "${pkgdir}"/etc/rc*.d
  rm -rf "${pkgdir}"/etc/init.d
  install -D -m644 ../cups.logrotate "${pkgdir}"/etc/logrotate.d/cups
  install -D -m644 ../cups.pam "${pkgdir}"/etc/pam.d/cups

  # fix perms on /var/spool and /etc
  chmod 755 "${pkgdir}"/var/spool
  chmod 755 "${pkgdir}"/etc

  # use cups group FS#36769
  install -Dm644 "$srcdir"/cups.sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  sed -i "s:#User 209:User 209:" "${pkgdir}"/etc/cups/cups-files.conf{,.default}
  sed -i "s:#Group 209:Group 209:" "${pkgdir}"/etc/cups/cups-files.conf{,.default}

  # install ssl directory where to store the certs, solves some samba issues
  install -dm700 -g 209 "${pkgdir}"/etc/cups/ssl
  # remove directory from package, it will be recreated at each server start
  rm -rf "${pkgdir}"/run

  # install some more configuration files that will get filled by cupsd
  touch "${pkgdir}"/etc/cups/printers.conf
  touch "${pkgdir}"/etc/cups/classes.conf
  touch "${pkgdir}"/etc/cups/subscriptions.conf
  chgrp -R 209 "${pkgdir}"/etc/cups

  # fix .desktop file
  sed -i 's|^Exec=htmlview http://localhost:631/|Exec=xdg-open http://localhost:631/|g' "${pkgdir}"/usr/share/applications/cups.desktop

  # compress some driver files, adopted from Fedora
  find "${pkgdir}"/usr/share/cups/model -name "*.ppd" | xargs gzip -n9f

  # remove client.conf man page
  rm -f "${pkgdir}"/usr/share/man/man5/client.conf.5

  # comment out removed filters that are now part of cups-filters
  perl -p -i -e 's:^(.*\s+bannertops\s*)$:#\1:' "$pkgdir"/usr/share/cups/mime/mime.convs

  # comment out unnecessary PageLogFormat entry
  sed -i -e 's:PageLogFormat:#PageLogFormat:' "$pkgdir"/etc/cups/cupsd.conf*

  # no more xinetd support
  rm -rf "${pkgdir}"/etc/xinetd.d
}
