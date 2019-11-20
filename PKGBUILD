# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: John Lane <archlinux at jelmail dot com>
# Contributor: Fisher Duan <steamedfish@njuopen.com>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgbase=cyrus-imapd
pkgname=(cyrus-imapd cyrus-imapd-docs)
pkgver=3.0.12
pkgrel=1
pkgdesc="An email, contacts and calendar server"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.cyrusimap.org/"
license=('BSD')
makedepends=('libsasl' 'icu' 'jansson' 'libical' 'libxml2' 'krb5' 'sqlite'
             'mariadb-libs' 'postgresql-libs' 'libnghttp2' 'brotli' 'shapelib'
             'libldap' 'libcap' 'net-snmp' 'xapian-core' 'perl' 'clamav' 'rsync'
             'python-sphinx' 'perl-pod-pom-view-restructured')
source=("https://www.cyrusimap.org/releases/${pkgbase}-${pkgver}.tar.gz"{,.sig}
        "perl-libs.patch"
        "vzic-flags.patch"
        "imapd.conf.patch"
        "cyrus-imapd.service"
        "cyrus-imapd.sysusers.conf"
        "cyrus-imapd.tmpfiles.conf")
validpgpkeys=('5B55619A9D7040A9DEE2A2CB554F04FEB36378E0')
sha512sums=('cef5c361dacfac6ae5e8900aa0cba705387a94c06fb176326c890ef4ab3384be121cae3e196ce1dfbd0ff01358719c5479414095d108e61a28e27420f0fde2c7'
            'SKIP'
            '63fdce85cd89ea8cdce31c36546c1d600620ef2c9a2f2426e0301e76887c6b56602687c8551b2f5d1b1ae948b21a964dffcf6da41745d9481f2b734f936093d1'
            'ff1adb55abb059f0c022ae3e375c0a099278d69174bef712b85af40b00fa68a6d49604d09f80195a429ff842813e914557d7aff773231776cbbc5037164c180a'
            '0862ffc8c05208efd4d2fb50a6e3719ebc65fc2d72f8e6404235aa32cc44d8227056a17b78f2726e15ff8e38d473795f837c34bfbe89b694b2298c9baab9d5db'
            '738242e80cec2c25ae6a85a889cc8d35d7c2f43b2b4d64d74f99a230b21024f168a885f1e319aec1aab0e0599e41211478b99dc608a4ba036be90f8d7e23fd96'
            '28612e491371515b414ce6d34554f1c2286624f5b80872e6be7037a2cccba1ed5bd2c4bfed27ed978478debdfb5f3d56aaa30d767f50b125f2ad38e76a37702c'
            '70fedcd78f4e505038e2716a0446e7bb7f7a344faf2ab43c51f47380ff56a9c2407cfbe0f24c006618a901e44ff124a7f6ed19203478a6b852d7bda7771210c5')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  patch -Np1 < "${srcdir}/perl-libs.patch"
  patch -Np1 < "${srcdir}/vzic-flags.patch"
  autoreconf
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  export PERL_MM_OPT="NO_PACKLIST=true"
  # Work around Cyrus bug #2629
  export LDFLAGS="${LDFLAGS/,--as-needed}"

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
    --enable-replication \
    --enable-backup \
    --with-mysql=yes \
    --with-pgsql=yes \
    --with-ldap \
    --with-libcap \
    --with-pidfile=/run/cyrus-master.pid \
    --with-syslogfacility=MAIL

  make
  make -C tools/vzic
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  make check
}

package_cyrus-imapd() {
  depends=('libsasl' 'icu' 'jansson' 'libical' 'libxml2' 'krb5' 'sqlite'
           'mariadb-libs' 'postgresql-libs' 'libnghttp2' 'brotli' 'shapelib'
           'libldap' 'libcap' 'net-snmp' 'xapian-core' 'perl')
  optdepends=('cyrus-imapd-docs: documentation'
              'clamav: for cyr_virusscan'
              'rsync: for compacting Xapian databases')
  provides=('imap-server' 'pop3-server')
  backup=('etc/cyrus/cyrus.conf' 'etc/cyrus/imapd.conf')
  install="${pkgname}.install"

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  # perllocal.pod is undesired in packages
  eval local $(perl -V:installarchlib)
  rm "${pkgdir}/${installarchlib}/perllocal.pod"
  rmdir "${pkgdir}/${installarchlib}"
    
  # Rename httpd.8 and master.8 so they don't conflict with the identically
  # named manpages from postfix and apache
  mv "${pkgdir}/usr/share/man/man8/httpd.8" \
    "${pkgdir}/usr/share/man/man8/httpd.8cyrus"
  mv "${pkgdir}/usr/share/man/man8/master.8" \
    "${pkgdir}/usr/share/man/man8/master.8cyrus"

  # Install additional utilities
  for i in arbitronsort.pl masssievec mkimap mknewsgroups rehash \
           translatesieve; do
    install -Dm755 "tools/${i}" "${pkgdir}/usr/bin/${i}"
  done
  # Vzic is needed to convert timezone information for CalDAV. Since Cyrus
  # includes a variant that has been modified for its own needs, we're
  # installing it under a different name to avoid conflicts
  install -Dm755 tools/vzic/vzic \
    "${pkgdir}/usr/bin/cyrus-vzic"
  install -Dm755 tools/vzic/vzic-merge.pl \
    "${pkgdir}/usr/bin/cyrus-vzic-merge.pl"
  # vzic-test.pl and vzic-dump.pl appear to be meant for development/testing

  # Install additional manpages
  for i in arbitronsort.pl synctest dav_reconstruct; do
    install -Dm644 "man/${i}.1" "${pkgdir}/usr/share/man/man1/${i}.1"
  done
  for i in cvt_xlist_specialuse cyradm cyrdump cyr_sequence cyr_userseen \
           lmtpproxyd masssievec mkimap mknewsgroups mupdate pop3proxyd proxyd \
           ptdump ptexpire ptloader rehash sievec sieved translatesieve; do
    install -Dm644 "man/${i}.8" "${pkgdir}/usr/share/man/man8/${i}.8"
  done

  # Install configuration files
  install -Dm644 doc/examples/cyrus_conf/normal.conf \
    "${pkgdir}/etc/cyrus/cyrus.conf"
  install -Dm644 doc/examples/imapd_conf/normal.conf \
    "${pkgdir}/etc/cyrus/imapd.conf"
  patch "${pkgdir}/etc/cyrus/imapd.conf" "${srcdir}/imapd.conf.patch"
  # Example cyrus.conf and imapd.conf use different socket paths, but they need
  # to match
  sed -i 's@/var/imap/socket/@/run/cyrus/socket/@' \
    "${pkgdir}/etc/cyrus/cyrus.conf"

  # Install default directories
  install -dm750 -o70 -gmail \
    "${pkgdir}/var/lib/cyrus" \
    "${pkgdir}/var/spool/cyrus" \
    "${pkgdir}/var/spool/sieve"

  # Install system files
  install -Dm644 "${srcdir}/cyrus-imapd.service" \
    "${pkgdir}/usr/lib/systemd/system/cyrus-imapd.service"
  install -Dm644 "${srcdir}/cyrus-imapd.sysusers.conf" \
    "${pkgdir}/usr/lib/sysusers.d/cyrus-imapd.conf"
  install -Dm644 "${srcdir}/cyrus-imapd.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/cyrus-imapd.conf"

  # Install Documentation
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
