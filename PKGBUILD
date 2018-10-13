pkgname=squid5
pkgver=5.0.0
_pkgver=5.0.0-20181012-r518c743
pkgrel=5
pkgdesc='Full-featured Web proxy cache server with the support SSL, eCAP, iCAP-client. Include patches for normal work with long url`s and CDN.'
arch=('x86_64')
url='http://www.squid-cache.org'
depends=('libecap' 'pam' 'perl' 'openssl' 'gperftools' 'libltdl' 'libcap' 'nettle' 'gnutls' 'libnsl')
makedepends=('krb5')
conflicts=('squid' 'squid4' 'squid5')
license=('GPL')
options=('emptydirs')
backup=('etc/squid/squid.conf'
	'etc/squid/cachemgr.conf'
	'etc/squid/errorpage.css'
	'etc/squid/mime.conf')
validpgpkeys=('B06884EDB779C89B044E64E3CD6DBF8EF3B17D3E')
source=("http://www.squid-cache.org/Versions/v$pkgrel/squid-$_pkgver.tar.gz"
        'squid.pam'
        'squid.service'
        'squid.tmpfiles'
        'squid.sysusers'
        'squid-rotate.service'
        'squid-rotate.timer')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
	cd "$srcdir/squid-$_pkgver"
	msg "Preparing Squid..."
	msg2 "Getting the client_side_request patch..."
	wget https://raw.githubusercontent.com/bar0metr/squid/master/client_side_requestv5.patch
	msg2 "Patching Squid..."
	patch -p0 -i client_side_requestv5.patch
	msg2 "Done!"
}

build() {
  cd "$srcdir/squid-$_pkgver"

  PKG_CONFIG_PATH=/usr/lib \
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --datadir=/usr/share/squid \
    --sysconfdir=/etc/squid \
    --libexecdir=/usr/lib/squid \
    --localstatedir=/var \
    --with-logdir=/var/log/squid \
    --with-pidfile=/run/squid.pid \
    --enable-ecap \
    --enable-icap-client \
    --enable-auth \
    --enable-auth-basic \
    --disable-auth-ntlm \
    --disable-auth-digest \
    --enable-auth-negotiate \
    --enable-removal-policies="lru,heap" \
    --enable-storeio="ufs,aufs,diskd,rock" \
    --enable-delay-pools \
    --enable-arp-acl \
    --enable-zph-qos \
    --with-netfilter-conntrack \
    --with-openssl=/usr/include/openssl \
    --enable-snmp \
    --enable-linux-netfilter \
    --enable-ident-lookups \
    --enable-useragent-log \
    --enable-cache-digests \
    --enable-referer-log \
    --enable-arp-acl \
    --enable-htcp \
    --enable-carp \
    --enable-epoll \
    --with-large-files \
    --enable-arp-acl \
    --with-default-user=proxy \
    --enable-async-io \
    --enable-truncate \
    --enable-icap-client \
    --enable-ssl-crtd \
    --disable-arch-native \
    --disable-strict-error-checking \
    --enable-wccpv2 \
    --disable-wccp \
    --enable-ssl-crtd \
    --with-build-environment=POSIX_V6_LP64_OFF64 \
    --enable-build-info="Intercept/WCCPv2/SSL/CRTD/(A)UFS/DISKD/ROCK/eCAP/ICAP/64/GCC Production" \
    'CFLAGS=-g -O2 -fPIE -fstack-protector-strong -DNDEBUG -Wformat -Werror=format-security -Wall -ltcmalloc_minimal' \
    'LDFLAGS=-fPIE -pie -Wl,-z,relro -Wl,-z,now' \
    'CPPFLAGS=-D_FORTIFY_SOURCE=2' \
    'CXXFLAGS=-g -O2 -fPIE -fstack-protector-strong -DNDEBUG -Wformat -Werror=format-security -ltcmalloc_minimal'
  make -j$(nproc)

}

package() {
  cd "$srcdir"

  make -C "squid-$_pkgver" DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/squid.pam" "$pkgdir/etc/pam.d/squid"
  install -Dm644 "$srcdir/squid.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/squid.conf"
  install -Dm644 "$srcdir/squid.sysusers" "$pkgdir/usr/lib/sysusers.d/squid.conf"
  install -Dm644 "$srcdir/squid.service" \
    "$pkgdir/usr/lib/systemd/system/squid.service"
  install -Dm644 "$srcdir/squid-rotate.service" \
    "$pkgdir/usr/lib/systemd/system/squid-rotate.service"
  install -Dm644 "$srcdir/squid-rotate.timer" \
    "$pkgdir/usr/lib/systemd/system/squid-rotate.timer"
#  install -dm755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
#  ln -s ../squid-rotate.timer \
#    "$pkgdir/usr/lib/systemd/system/timers.target.wants/squid-rotate.timer"
  rm -rf "$pkgdir/run" "$pkgdir"/var/{cache,log,run}
}

