# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: John Lane <archlinux at jelmail dot com>
# Contributor: Fisher Duan <steamedfish@njuopen.com>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgbase=cyrus-imapd
pkgname=(cyrus-imapd cyrus-imapd-docs)
pkgver=3.8.4
pkgrel=1
pkgdesc="An email, contacts and calendar server"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://www.cyrusimap.org/"
license=('BSD-Attribution-HPND-disclaimer')
makedepends=('libsasl' 'icu' 'jansson' 'libical' 'libxml2' 'krb5' 'sqlite'
             'mariadb-libs' 'postgresql-libs' 'libnghttp2' 'brotli' 'zstd'
             'shapelib' 'libldap' 'libcap' 'xapian-core' 'perl' 'clamav' 'rsync'
             'libchardet' 'pcre')
source=("https://github.com/cyrusimap/cyrus-imapd/releases/download/${pkgbase}-${pkgver}/${pkgbase}-${pkgver}.tar.gz"{,.sig}
        "https://src.fedoraproject.org/rpms/cyrus-imapd/raw/4176c0e5983b3d19752f2db3860c33bafa7c259b/f/patch-cyrus-remove-always-inline-for-buf-len"
        "imapd.conf.patch"
        "cyrus-imapd.service"
        "cyrus-imapd.sysusers.conf"
        "cyrus-imapd.tmpfiles.conf")
validpgpkeys=('5B55619A9D7040A9DEE2A2CB554F04FEB36378E0')
sha512sums=('2a0e8d0376c74da72dcbb43c99cc04c4ac4a6e5941338592f77a41154a10401d989075d539b42ee16dafbe71f0d2b728648a4a80d7eb0726e6b38e14d16397f0'
            'SKIP'
            '575db085359af83605e89972ab20e2e1f62e67418242f954f4ed5e60d29acf66dfea07f41537327688857eddb0b310b5ee6361155a7588299d5adbaea487307a'
            '0862ffc8c05208efd4d2fb50a6e3719ebc65fc2d72f8e6404235aa32cc44d8227056a17b78f2726e15ff8e38d473795f837c34bfbe89b694b2298c9baab9d5db'
            '738242e80cec2c25ae6a85a889cc8d35d7c2f43b2b4d64d74f99a230b21024f168a885f1e319aec1aab0e0599e41211478b99dc608a4ba036be90f8d7e23fd96'
            '28612e491371515b414ce6d34554f1c2286624f5b80872e6be7037a2cccba1ed5bd2c4bfed27ed978478debdfb5f3d56aaa30d767f50b125f2ad38e76a37702c'
            '70fedcd78f4e505038e2716a0446e7bb7f7a344faf2ab43c51f47380ff56a9c2407cfbe0f24c006618a901e44ff124a7f6ed19203478a6b852d7bda7771210c5')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # https://bugzilla.redhat.com/show_bug.cgi?id=2223951
  patch -Np1 < "${srcdir}/patch-cyrus-remove-always-inline-for-buf-len"
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  export PERL_MM_OPT="NO_PACKLIST=true NO_PERLLOCAL=true"
  # libchardet's pkgconf flags are broken, so we have to specify them manually
  export LIBCHARDET_CFLAGS="-I/usr/include/chardet"
  # Work around Cyrus bug #3562
  export CFLAGS="${CFLAGS} -fno-toplevel-reorder"
  # Work around Cyrus bug #2629
  export LDFLAGS="${LDFLAGS/-Wl,--as-needed}"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/cyrus \
    --sysconfdir=/etc/cyrus \
    --sbindir=/usr/bin \
    --enable-xapian \
    --enable-autocreate \
    --enable-idled \
    --enable-nntp \
    --enable-murder \
    --enable-http \
    --enable-calalarmd \
    --enable-jmap \
    --enable-replication \
    --enable-backup \
    --with-mysql=yes \
    --with-pgsql=yes \
    --with-ldap \
    --with-libcap \
    --with-pidfile=/run/cyrus-master.pid \
    --with-syslogfacility=MAIL

  make
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  make check
}

package_cyrus-imapd() {
  depends=('libsasl' 'icu' 'jansson' 'libical' 'libxml2' 'krb5' 'sqlite'
           'mariadb-libs' 'postgresql-libs' 'libnghttp2' 'brotli' 'zstd'
           'shapelib' 'libldap' 'libcap' 'xapian-core' 'perl' 'libchardet'
           'pcre')
  optdepends=('cyrus-imapd-docs: documentation'
              'clamav: for cyr_virusscan'
              'rsync: for compacting Xapian databases')
  provides=('imap-server' 'pop3-server')
  backup=('etc/cyrus/cyrus.conf' 'etc/cyrus/imapd.conf')
  #install="${pkgname}.install"

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  # Rename restore so it doesn't conflict with the identically named command
  # from tar
  mv "${pkgdir}/usr/bin/restore" \
    "${pkgdir}/usr/bin/cyr_restore"
  mv "${pkgdir}/usr/share/man/man8/restore.8" \
    "${pkgdir}/usr/share/man/man8/cyr_restore.8"

  # Rename httpd.8 and master.8 so they don't conflict with the identically
  # named manpages from postfix and apache
  mv "${pkgdir}/usr/share/man/man8/httpd.8" \
    "${pkgdir}/usr/share/man/man8/httpd.8cyrus"
  mv "${pkgdir}/usr/share/man/man8/master.8" \
    "${pkgdir}/usr/share/man/man8/master.8cyrus"

  # Install additional utilities
  for i in arbitronsort.pl.1 masssievec.8 mkimap.8 mknewsgroups.8 rehash.8 \
           translatesieve.8; do
    install -Dm755 "tools/${i::-2}" "${pkgdir}/usr/bin/${i::-2}"
    install -Dm755 "man/${i}" "${pkgdir}/usr/share/man/man${i: -1}/${i}"
  done

  # Install configuration files
  install -Dm644 doc/examples/cyrus_conf/normal.conf \
    "${pkgdir}/etc/cyrus/cyrus.conf"
  install -Dm644 doc/examples/imapd_conf/normal.conf \
    "${pkgdir}/etc/cyrus/imapd.conf"
  patch "${pkgdir}/etc/cyrus/imapd.conf" "${srcdir}/imapd.conf.patch"

  # Install default directories
  install -dm750 -o70 -g12 \
    "${pkgdir}/var/lib/cyrus" \
    "${pkgdir}/var/spool/cyrus" \
    "${pkgdir}/var/spool/sieve"

  # Install system configuration
  install -Dm644 "${srcdir}/cyrus-imapd.service" \
    "${pkgdir}/usr/lib/systemd/system/cyrus-imapd.service"
  install -Dm644 "${srcdir}/cyrus-imapd.sysusers.conf" \
    "${pkgdir}/usr/lib/sysusers.d/cyrus-imapd.conf"
  install -Dm644 "${srcdir}/cyrus-imapd.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/cyrus-imapd.conf"

  # Install basic documentation
  install -Dm644 -t "${pkgdir}/usr/share/doc/cyrus-imapd/" \
    README.md doc/README.*
  cp -r doc/examples "${pkgdir}/usr/share/doc/cyrus-imapd/examples"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_cyrus-imapd-docs() {
  pkgdesc="Documentation for the Cyrus IMAP server"
  arch=('any')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/doc/cyrus-imapd"
  cp -r doc/html doc/internal doc/legacy doc/text \
    "${pkgdir}/usr/share/doc/cyrus-imapd"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
