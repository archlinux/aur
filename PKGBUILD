pkgname=dovecot-stemmer
pkgver=2.2.18
pkgrel=1
pkgdesc="dovecot imap server build against libstemmer for improved searching"
arch=('i686' 'x86_64')
url="http://dovecot.org/"
license=("LGPL")
depends=('krb5' 'openssl' 'sqlite' 'libmariadbclient'
        'postgresql-libs' 'bzip2' 'lz4' 'expat' 'curl' 'snowball-c' 'pam')
makedepends=('libcap' 'libldap' 'clucene')
optdepends=('libldap: ldap plugin'
            'xz: imap zlib  plugin'
            'clucene: alternative FTS indexer')
provides=('imap-server' 'pop3-server' 'dovecot=2.2.18')
conflicts=('dovecot' 'dovecot-antispam-git' 'aur/dovecot2-antispam-hg' 'dovecot+sieve')
options=('!libtool')
install=$pkgname.install
source=(http://dovecot.org/releases/2.2/dovecot-${pkgver}.tar.gz{,.sig}
        dovecot.tmpfilesd)
#md5sums at the end of file

prepare() {
  cd dovecot-$pkgver

  # fix path in helper script
  sed -i 's:OPENSSLCONFIG=${OPENSSLCONFIG-dovecot-openssl.cnf}:OPENSSLCONFIG=${OPENSSLCONFIG- /etc/ssl/dovecot-openssl.cnf}:' doc/mkcert.sh
}

build() {
  cd dovecot-$pkgver
  # configure with openssl, mysql, and postgresql support
  ./configure --prefix=/usr --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-moduledir=/usr/lib/dovecot/modules \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --disable-static \
    --with-nss \
    --with-pam \
    --with-mysql \
    --with-pgsql \
    --with-sqlite \
    --with-ssl=openssl \
    --with-ssldir=/etc/ssl \
    --with-gssapi \
    --with-ldap=plugin \
    --with-zlib \
    --with-bzlib \
    --with-lzma \
    --with-lz4 \
    --with-libcap \
    --with-solr \
    --with-lucene \
    --with-docs \
    --with-stemmer
  make
}

check() {
  cd "$srcdir/dovecot-$pkgver"
  make
}

package() {

  # system user/group dovenull - 74
  # system user/group dovecot  - 76

  cd ${srcdir}/dovecot-$pkgver
  make DESTDIR=${pkgdir} install

  # install example conf files and ssl.conf
  install -d -m755 ${pkgdir}/etc/dovecot/conf.d
  install -m 644 ${pkgdir}/usr/share/doc/dovecot/example-config/dovecot.conf ${pkgdir}/etc/dovecot/dovecot.conf.sample
  install -d -m755 ${pkgdir}/etc/ssl
  install -m 644  ${srcdir}/dovecot-$pkgver/doc/dovecot-openssl.cnf ${pkgdir}/etc/ssl/dovecot-openssl.cnf.sample

  # install mkcert helper script
  install -m 755  ${srcdir}/dovecot-$pkgver/doc/mkcert.sh ${pkgdir}/usr/lib/dovecot/mkcert.sh

  rm ${pkgdir}/etc/dovecot/README

  # systemd tmpfile
  install -d -m755 ${pkgdir}/usr/lib/tmpfiles.d
  install -m 644  ${srcdir}/dovecot.tmpfilesd ${pkgdir}/usr/lib/tmpfiles.d/dovecot.conf
}
md5sums=('1e42eb3b69544c447ad882d7858f3630'
         'SKIP'
         '342a28251d40f983c98c0d1f1bf3d07d')
sha1sums=('8309b5ef8d33d464eb7a6e1d3cba0b4e87c55eff'
          'SKIP'
          '35131bd31b62c6b7e04bdb00e504a0f4087f21f8')
sha256sums=('b6d8468cea47f1227f47b80618f7fb872e2b2e9d3302adc107a005dd083865bb'
            'SKIP'
            'bb7620be7fc0217d77fcac940441c2abbd9efc6ef660153288d09ba412e27e06')
