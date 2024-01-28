# Maintainer: HLFH <gaspard@dhautefeuille.eu>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: GARETTE Emmanuel <gnunux at laposte dot net>
# Contributor: Phillip Schichtel <phillip@schich.tel>

# --->>> remember to rebuild/bump the following packages TOGETHER with a new dovecot ABI:
#   +pigeonhole
#   +dovecot-fts-elastic
#   +dovecot-fts-xapian

pkgname=dovecot-with-stemmer
_pkgname=dovecot
pkgver=2.3.21
pkgrel=3

pkgdesc="An IMAP and POP3 server written with security primarily in mind"
url="https://dovecot.org/"
arch=('x86_64')
license=("LGPL")

depends=('krb5' 'openssl' 'sqlite' 'mariadb-libs' 'libsodium'
         'postgresql-libs' 'bzip2' 'lz4' 'expat' 'curl' 'pam' 'systemd-libs')
makedepends=('libcap' 'libldap' 'lua53' 'xz' 'clucene' 'systemd')
optdepends=('libldap: ldap plugin'
            'lua53: LUA auth and push support'
            'clucene: alternative FTS indexer')

provides=('imap-server' 'pop3-server')
conflicts=('dovecot' 'dovecot-stemmer')
backup=('etc/pam.d/dovecot')

# LTO seems to cause issues with at least up to 2.3.17.1
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=997513
# TODO regularly check if upstream has implemented in-code fixes w.r.t. LTO
options=('!emptydirs' '!lto')

source=("https://dovecot.org/releases/2.3/${_pkgname}-${pkgver}.tar.gz"{,.sig}
        'dovecot-2.3.14-opensslv3.patch'
        'dovecot.sysusersd'
        'dovecot.tmpfilesd'
        'dovecot.ld.so.conf'
        'dovecot.pam')

b2sums=('50d0b614e163240e798d272e4435dd51b498bc96468207d2c24132a7f8ac46f5b9393df254d7651046ce10af97d5ca1041b59800b9f71e40b331645d7eaa6326'
        'SKIP'
        '6ae72bd3ba6d9f39088d7dbca9ae74e3659dd75a2720f8ff9bda889e5001daa52bf3b199493972123742d18a780ea07efc71d35dae912fa96e5518e3fb204b46'
        '4f28042b7c6972a809688295bc7bd85339540c69ecdd603465b206c1fe59e48a2f7021cd95025caab1d5612409ed08416066b1704c01c78f061b9c64d24a43e2'
        'a8054e4fe7e3685f8ecc7600c65af88c03e82a96e9b952503501298fd16d12cdf70211d07d99ad9fcf5f8a2b437184d2b519303c7d15a87f92eafce62211fbdc'
        'bbd7f18d2a094683b8b2367253c860f43d6f96f8b3477c6ccd816feb13b86e88d66f25de19efd30d8cea6b778fc427c5aef03c0359e8659258c2035df461cfed'
        'de946fda01686df5533edfd0f0c9b9e1c95c270f000cc841d9085598b85a075b461f92c64b7efd57ff6c7621a83d56e51aeeb807b4d298dd9a390dd404b3d396')

validpgpkeys=(
  'E643F0BDFDCD04D9FFCB6279C948525140558AC9' # Timo Sirainen <tss@iki.fi>
  '2BE74AAB3EE754DFB9C80D3318A348AEED409DA1' # Dovecot Community Edition
)

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ../dovecot-2.3.14-opensslv3.patch

  # fix path in helper script
  sed -i 's:OPENSSLCONFIG=${OPENSSLCONFIG-dovecot-openssl.cnf}:OPENSSLCONFIG=${OPENSSLCONFIG- /etc/ssl/dovecot-openssl.cnf}:' doc/mkcert.sh
}

build() {
  cd "${_pkgname}-${pkgver}"

  # this uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-rundir=/run/dovecot \
    --with-moduledir=/usr/lib/dovecot/modules \
    --disable-static \
    --with-nss \
    --with-pam \
    --with-sqlite \
    --with-pgsql \
    --with-mysql \
    --with-ssl=openssl \
    --with-ssldir=/etc/ssl \
    --with-gssapi \
    --with-ldap=plugin \
    --with-lua=plugin \
    --with-zlib \
    --with-bzlib \
    --with-lzma \
    --with-lz4 \
    --with-zstd \
    --with-lucene \
    --with-solr \
    --with-sodium \
    --with-libcap \
    --with-docs \
    --with-stemmer

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  # system user/group dovenull - 74
  # system user/group dovecot  - 76

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 "${srcdir}/dovecot.sysusersd" \
    "${pkgdir}/usr/lib/sysusers.d/dovecot.conf"
  install -Dm644 "${srcdir}/dovecot.tmpfilesd" \
    "${pkgdir}/usr/lib/tmpfiles.d/dovecot.conf"
  install -d -m755 "${pkgdir}/etc/dovecot/conf.d"
  rm -f "${pkgdir}/etc/dovecot/README"

  # install mkcert helper script
  install -m 755  doc/mkcert.sh "${pkgdir}/usr/lib/dovecot/mkcert.sh"

  # add dovecot libdir
  install -Dm644 "${srcdir}/dovecot.ld.so.conf" "${pkgdir}/etc/ld.so.conf.d/dovecot.conf"

  # install PAM snippet for dovecot
  install -Dm644 "${srcdir}/dovecot.pam" "${pkgdir}/etc/pam.d/dovecot"
}
