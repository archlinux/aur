# Maintainer: Petr Špaček <pspacek@isc.org>

pkgname=bind-git
reponame=bind9
pkgver=9.main.r40093.8983bf8ed2
pkgrel=1
pkgdesc='A complete, highly portable implementation of the DNS protocol: development version'
url='https://www.isc.org/software/bind/'
license=('MPL2')
arch=('x86_64')
options=('!emptydirs' 'debug')
makedepends=(
    'git' 'dnssec-anchors' 'icu' 'jemalloc' 'json-c' 'krb5' 'libcap'
    'libidn2' 'libmaxminddb' 'libnsl' 'libuv' 'liburcu' 'libxml2' 'lmdb' 'openssl'
    'python' 'python-ply' 'python-sphinx' 'readline' 'xz' 'zlib')
depends=('bash' 'dnssec-anchors' 'glibc' 'icu' 'jemalloc' 'json-c' 'krb5'
    'libcap' 'libedit' 'libidn2' 'libmaxminddb' 'libnsl' 'liburcu' 'libuv' 'libxml2'
    'lmdb' 'openssl' 'python' 'python-ply' 'readline' 'xz' 'zlib')
conflicts=('bind' 'bind-tools' 'dnsutils')
replaces=('bind-tools' 'dnsutils' 'host')
provides=('bind' 'bind-tools' 'dnsutils' 'dns-server')
backup=('etc/named.conf'
        'var/named/127.0.0.zone'
        'var/named/localhost.zone'
        'var/named/localhost.ip6.zone')
install=bind.install
source=("git+https://gitlab.isc.org/isc-projects/bind9.git#branch=main"
        'tmpfiles.conf'
        'sysusers.conf'
        'named.conf'
        'named.service'
        'localhost.zone'
        'localhost.ip6.zone'
        '127.0.0.zone')
sha256sums=('SKIP'
            'f0423c4ee8495da487e07e9144bec1d25f46a0cd2dfa7cfd7a761ef15bfefc98'
            '7c0acefcfcc3ae093550caed7ec90fe84bec8f7477459ffa7e71dda76bcbdb2c'
            'e08a01d41b18bdb771d534daca99642314939aafdb088e5cfcf0ef2d33f8e7eb'
            '3f0f8db0a1deae270dd166b4750be7c1041b4b44891176f35a8df7dd55d24d34'
            '0011708e516128647dd25b59b6ebc465f36e85bbe0a8fbdc3eb04b7f28c2197f'
            'c06fc270e32a843c8b6d86335a2ec607d405dfba6875de8d8a9abde39a9e2c17'
            'b88fd2b99e7d42d414b329b814b9ff3304fa0ef9c67df81bde235bbfa0f3a3b8')

pkgver() {
    cd "${srcdir}/${reponame}"
    # git describe does not produce meaningful results
    # (because of the way how upstream tags releases)
    echo -n "9.main.r$(git log --oneline | wc -l).$(git log -1 --format="%h")"
}

build() {
  cd "${srcdir}/${reponame}"
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
    --disable-static \
    --enable-fixed-rrset \
    --enable-full-report \
    --with-maxminddb \
    --with-openssl \
    --with-libidn2 \
    --with-json-c \
    --with-libxml2 \
    --with-lmdb
  make
}

package() {
  cd "${srcdir}/${reponame}"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -D -m644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  install -D -m644 named.service "$pkgdir/usr/lib/systemd/system/named.service"
  install -D -m640 -o 0 -g 40 named.conf "$pkgdir/etc/named.conf"

  install -d -m770 -o 0 -g 40 "$pkgdir/var/named"
  install -m640 -o 0 -g 40 localhost.zone "$pkgdir/var/named"
  install -m640 -o 0 -g 40 localhost.ip6.zone "$pkgdir/var/named"
  install -m640 -o 0 -g 40 127.0.0.zone "$pkgdir/var/named"
}

# vim:set ts=2 sw=2 et:
