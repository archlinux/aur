pkgname=squid-git
pkgver=4.1
pkgrel=4
pkgdesc='Full-featured Web proxy cache server with the support SSL, eCAP, iCAP-client. Include patches for normal work with long url`s 
and CDN.'
arch=('x86_64')
url='https://github.com/squid-cache/squid'
depends=('openssl-1.0' 'libecap' 'pam' 'perl' 'libltdl' 'libcap' 'nettle' 'gnutls' 'libnsl')
makedepends=('git' 'krb5')
conflicts=('squid' 'squid4')
license=('GPL')
options=('emptydirs')
backup=('etc/squid/squid.conf'
	'etc/squid/cachemgr.conf'
	'etc/squid/errorpage.css'
	'etc/squid/mime.conf')
validpgpkeys=('B06884EDB779C89B044E64E3CD6DBF8EF3B17D3E')
source=("$pkgname::git+$url.git"
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
	cd "$srcdir/squid-git"
	msg "Preparing Squid..."
	msg2 "Getting the client_side_request patch..."
	wget https://raw.githubusercontent.com/bar0metr/squid/master/client_side_request.patch
	msg2 "Patching Squid..."
	patch -p0 -i client_side_request.patch
	msg2 "Getting the on_unsupported_protocol (bug 4861)..."
	wget https://raw.githubusercontent.com/bar0metr/squid/master/on_unsupported_protocol.patch
	msg2 "Patching Squid..."
	patch -p0 -i on_unsupported_protocol.patch
	msg2 "Done!"
}

build() {
  cd "$srcdir/squid-git"

  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
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
    --enable-auth-ntlm \
    --enable-auth-digest \
    --enable-auth-negotiate \
    --enable-removal-policies="lru,heap" \
    --enable-storeio="aufs,ufs,diskd" \
    --enable-delay-pools \
    --enable-arp-acl \
    --with-openssl=/usr/include/openssl-1.0/openssl \
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
    --enable-ssl-crtd 
  make -j$(nproc)
}

package() {
  cd "$srcdir"

  make -C "squid-git" DESTDIR="$pkgdir" install
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

