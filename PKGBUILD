# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Mario Vazquez <mario_vazq@hotmail.com>

pkgname=bind-development
_pkgname=bind
pkgver=9.19.2
pkgrel=1
pkgdesc='A complete, highly portable implementation of the DNS protocol (development version)'
url='https://www.isc.org/bind/'
license=('MPL2')
arch=('x86_64')
options=('!emptydirs')
makedepends=(
  'git'
  'python'
  'python-ply'
  'python-sphinx'
)
depends=(
  'bash'
  'dnssec-anchors'
  'e2fsprogs'
  'fstrm'
  'glibc'
  'icu'
  'jemalloc'
  'json-c'
  'krb5'
  'libcap'
  'libedit'
  'libidn2'
  'libmaxminddb'
  'libnghttp2'
  'libnsl'
  'libuv'
  'libxml2'
  'lmdb'
  'openssl'
  'protobuf-c'
  'readline'
  'xz'
  'zlib'
)
conflicts=('bind' 'bind-tools' 'dnsutils')
replaces=('bind-tools' 'dnsutils' 'host')
provides=('bind' 'bind-tools' 'dnsutils' 'dns-server')
backup=(
  'etc/named.conf'
  'var/named/127.0.0.zone'
  'var/named/localhost.zone'
  'var/named/localhost.ip6.zone'
)
_commit='f7c233e8e90b88856803ae28590818babf888d24'
source=(
  "git+https://gitlab.isc.org/isc-projects/bind9.git#commit=$_commit"
  'tmpfiles.conf'
  'sysusers.conf'
  'named.conf'
  'named.service'
  'localhost.zone'
  'localhost.ip6.zone'
  '127.0.0.zone'
)
sha512sums=('SKIP'
            'c344fd4949eb80114d0c157517ece3f4b9505b94e3de00489d4b2b23beb74612f38cf3443f2f3b98fe01d98ad1842f45ff1d1826d67937e72e4629bbdf683a59'
            'b39f74ea752a95997a12f1b9a3efc3e346d5b1f59e9f3fd906a7aa3e7fe5d2e09a61fac91dc8b9dca7fcb093c9030d86ec8479a1c30051d212c573aaa2749821'
            '5de98b7b39e39083793d45c09697edf4c664159334b0dd5ee4c377b548ff37d08eda03aa4595781e04b61cab4130b101eb80f978ac84b4345fc14d25d19c808e'
            'bf7687b94bb826a57c0e9dcee453cc9830da0e5ee4bc688d7ff20d717a13fb2a31d696397b452695856fffb5da7b951a888bc448e58e517590b3506f95e05ca8'
            '83eb5576a6f0fa1d469ef205e64a56ad296fdf91855b3c89391ae2edfb15bfae1c2fd05f60403cd6f53dd9daddd08ad36d8b2e83af86d6f2dc8efe6d3743828a'
            '6c02c9d9d81183bae826feba69d5bde9549aa4fb825cc804519b429d302e5cdd0c56e527e7bbb09c8a068eb8831468520cff2fec66c946b4c8e9f8e9a0fe9af7'
            '8a8824bea352e91329c9621fe60d5475f2a95cda522f72860f22929a73224d912cf51cd179307489bac6178ffad469b4ad7a3737fec2d44bd54ebfea9c479c11')
b2sums=('SKIP'
        '15548145717b526be3d7898a0c2144a13e29b0595a3c27d220cc45646156cc8ddae954cb3b3907ca845765fc8ce30508d8e570c0a492b965027531a0f6df43ac'
        '12c2206292857b9bdbbb7acc683cbb243aa666fcc85b37e83015f576d7fdfc6e4ae74ff222ff8870d8acf4cd68c5fac9e7a050bbcd39fd8f8709aeb414e6b7a9'
        '5681731a6c92690c51f1e4f2fc90bcac9b37f23d61b89f1c64998e4da33b610a0f98c26a562ea3049dc1af98e101c197aaf6b2a465fb15d61c29a7158d56b311'
        '21a5a03ebed7f54e242700093997ce2ddf437b41a4e83afc4b7b5c20491a56031b921ef8bbfe01c38154a1bc15dc21682243a28d2372b0f81d861b48ef153647'
        '91c5cb79393c9d2c86c88111fe224963eeacaf8d2e67a03fb6f336e848f9329e1e9d2f7fd97b95dba659d577da9df404b050c549bec39dc4a3d5a057e6f4b5a1'
        '71866f895d6577c21666705073c2eeff9bd24fc156d4fa8fbd228b68097ad1fe25561de86a1815a1a5f23fe80f6d274d0041806968ea75a50af59e1f69b55f75'
        '38e629ad4451c51b2a4133c297b8f9d4ad0c935760f811201e74f37620aebc60387744ded7d99d432af736d8b1d268bc3c330e41dcd14b4be90331dba3bc9c10')

pkgver() {
  cd bind9

  git describe --tags | sed "s/^[Vv]//;s/_/./g"
}

build() {
  cd bind9

  export CFLAGS
  # support to chase DNSSEC signature chains
  CFLAGS+=' -DDIG_SIGCHASE'
  # compile with gcc10, https://gcc.gnu.org/gcc-10/porting_to.html
  CFLAGS+=' -fcommon'

  autoreconf -fiv

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-fixed-rrset \
    --enable-full-report \
    --enable-dnsrps \
    --enable-dnsrps-dl \
    --enable-doh \
    --enable-dnstap \
    --with-maxminddb \
    --with-openssl \
    --with-libidn2 \
    --with-json-c \
    --with-libxml2 \
    --with-lmdb

  make
}

package() {
  # systemd integration
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 named.service "$pkgdir/usr/lib/systemd/system/named.service"

  # configuration
  install -vDm640 -o 0 -g 40 named.conf "$pkgdir/etc/named.conf"

  # default zones
  install -d -m770 -o 0 -g 40 "$pkgdir/var/named"
  install -m640 -o 0 -g 40 -t "$pkgdir/var/named" \
    localhost.zone \
    localhost.ip6.zone \
    127.0.0.zone

  cd bind9

  # package
  make DESTDIR="$pkgdir" install

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE COPYRIGHT
}

# vim:set ts=2 sw=2 et:
