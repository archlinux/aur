# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: John Lane <archlinux at jelmail dot com>
# Contributor: Fisher Duan <steamedfish@njuopen.com>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgbase=cyrus-imapd
pkgname=(cyrus-imapd cyrus-imapd-docs)
pkgver=3.12.1
pkgrel=1
pkgdesc="An email, contacts and calendar server"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://www.cyrusimap.org/"
license=('BSD-Attribution-HPND-disclaimer')
makedepends=('libsasl' 'icu' 'jansson' 'libical' 'libxml2' 'krb5' 'sqlite'
             'mariadb-libs' 'postgresql-libs' 'libnghttp2' 'brotli' 'zstd'
             'shapelib' 'libldap' 'libcap' 'xapian-core' 'perl' 'clamav' 'rsync'
             'libchardet' 'pcre2' 'xxd' 'libwslay' 'libcom_err.so' 'libuuid.so'
             'zlib' 'openssl')
checkdepends=('cunit')
source=("https://github.com/cyrusimap/cyrus-imapd/releases/download/${pkgbase}-${pkgver}/${pkgbase}-${pkgver}.tar.gz"{,.sig}
        "https://src.fedoraproject.org/rpms/cyrus-imapd/raw/4176c0e5983b3d19752f2db3860c33bafa7c259b/f/patch-cyrus-remove-always-inline-for-buf-len"
        "managesieve-libcap-dependency.patch"
        "libcyrus-imap-sieve-dependency.patch::https://github.com/cyrusimap/cyrus-imapd/pull/4996.diff"
        "imapd.conf.patch"
        "cyrus-imapd.service"
        "cyrus-imapd.sysusers.conf"
        "cyrus-imapd.tmpfiles.conf")
validpgpkeys=('5B55619A9D7040A9DEE2A2CB554F04FEB36378E0')
sha512sums=('ec2727eb0567ebf978ff4db9e9086bc01fdc2739b6e06cad73cf74f9af990c30a70130aa2474d822d8ca078e1012a60179101de90845bf40f7a9b47a8b5e4d92'
            'SKIP'
            '575db085359af83605e89972ab20e2e1f62e67418242f954f4ed5e60d29acf66dfea07f41537327688857eddb0b310b5ee6361155a7588299d5adbaea487307a'
            '281110cc226b110cf9825cf8c3b213400a7e8a7754e40631240d3f5d424472b1e496c477c57333b94ede3b4b1acb8a99fb33fa334464aec548019849b4b2ac5c'
            '09f5a1c7710676c387509e6ad30dd83b9032febaa639a97b563dbdfcdd231aab3c0f88af9ffed8098908e3494bec5fbe4803c848e0e372bd555729b14d1bab65'
            '0862ffc8c05208efd4d2fb50a6e3719ebc65fc2d72f8e6404235aa32cc44d8227056a17b78f2726e15ff8e38d473795f837c34bfbe89b694b2298c9baab9d5db'
            'c312ef8f838ce8d46b947f0425738a782526cdc7fb80e736b9f9cbf0f45f5542e7902a38e542323f9e05c143ae5c8be482c6ef32b4a6fa2aead25b226486664f'
            '8914e9330fb7f35de8bc64ffd598630d658e6c7105ffe06beef660ab0e1f95203381bc741d3abaa6f31abf4244ed076d7333a2321fd00348bc1b3562382f45b2'
            'e1e1d3a71881498fffeac2e117522532446488cd9bc4efc0093f35ed14064d8b53b5f704fb355fbcedc0ba41966f85967a5a46a7522d1472405c2b70b7530182')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # https://bugzilla.redhat.com/show_bug.cgi?id=2223951
  patch -Np1 < "${srcdir}/patch-cyrus-remove-always-inline-for-buf-len"

  # Fix managesieve not being linked against libcyrus_min dependency libcap
  patch -Np1 < "${srcdir}/managesieve-libcap-dependency.patch"

  # Fix libcyrus_imap not being linked against its dependency libcyrus_sieve
  # resulting in overlinking (sort of) in some of its dependents
  patch -Np1 < "${srcdir}/libcyrus-imap-sieve-dependency.patch"
  autoreconf -if -Wno-obsolete
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # libchardet's pkgconf flags are broken, so we have to specify them manually
  export LIBCHARDET_CFLAGS="-I/usr/include/chardet"
  # Work around Cyrus bug #3562
  export CFLAGS="${CFLAGS} -fno-toplevel-reorder"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/cyrus \
    --sysconfdir=/etc/cyrus \
    --sbindir=/usr/bin \
    $((( CHECKFUNC )) && echo --enable-unit-tests) \
    --enable-xapian \
    --enable-autocreate \
    --enable-idled \
    --enable-nntp \
    --enable-murder \
    --enable-http \
    --enable-calalarmd \
    --enable-jmap \
    --enable-replication \
    --with-mysql=yes \
    --with-pgsql=yes \
    --with-ldap \
    --with-libcap \
    --with-syslogfacility=MAIL \
    PERL_MM_OPT="NO_PACKLIST=true NO_PERLLOCAL=true"
  # Fix overlinking
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

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
           'pcre2' 'libwslay' 'libcom_err.so' 'libuuid.so' 'glibc' 'gcc-libs'
           'zlib' 'openssl')
  optdepends=('cyrus-imapd-docs: documentation'
              'clamav: for cyr_virusscan'
              'rsync: for compacting Xapian databases'
              'sh: for certain administrative tools')
  provides=('imap-server' 'pop3-server')
  backup=('etc/cyrus/cyrus.conf' 'etc/cyrus/imapd.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

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

  # Install license
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
