# Contributor: Sascha Weaver <wzyboies at gmail dot com>
# Maintainer: Natrio <natrio list ru>

pkgname=vtun
pkgver=3.0.3.2013.d
_pkgver=3.0.3
pkgrel=14
pkgdesc="The easiest way to create Virtual Tunnels over TCP/IP networks with traffic shaping, compression, encryption and IPv6 support."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://vtun.sourceforge.net/"
license=('GPL')
depends=('openssl-1.1' 'zlib' 'lzo')
backup=('etc/vtund.conf' 'etc/tun-cfg.conf')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
 cvs-2013.patch
 openlog.patch
 00-sslauth.patch
 01-pidfile.patch
 02-dumpfile.patch
 03-signedness-warnings.patch
 04-implicit-pointer-conversions.patch
 05-unix98pty.patch
 06-ipv6.patch
 07-dual-family-transport.patch
 08-gcc5-inline.patch
 09-client-uses-lot-of-CPU-after-a-SIGHUP.patch
 11-libssl-1.1.patch
 vtund-ipv6-client.conf
 vtund-ipv6-server.conf
 android-dev.patch
 tun-cat.c
 tun-cfg
 tun-cfg.conf
 README.tun-cfg)
sha512sums=('5fa789d08b556f97492b89515a89c2322c4b0a8fa95bd1035f5ed19061b3654a6a36a9911792096ac872ae9ae5451848cab87d0343dc0ffc064affea1f7d0d54'
 SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
 SKIP)
install=vtun.install

prepare() {
  cd "${srcdir}"
  HELPSTR=/usr/bin/tun-cfg ./tun-cfg --help > README.tun-cfg
  cd "${srcdir}/${pkgname}-${_pkgver}"
  # latest CVS 3_X2 branch changes, openlog bugfix and patches ported from Debian
  for p in \
    cvs-2013.patch \
    openlog.patch \
    00-sslauth.patch \
    01-pidfile.patch \
    02-dumpfile.patch \
    03-signedness-warnings.patch \
    04-implicit-pointer-conversions.patch \
    05-unix98pty.patch \
    06-ipv6.patch \
    07-dual-family-transport.patch \
    08-gcc5-inline.patch \
    09-client-uses-lot-of-CPU-after-a-SIGHUP.patch \
    11-libssl-1.1.patch \
    ; do
   patch -p1 -i "${srcdir}/$p" || exit 1
  done
  [[ "$CARCH" =~ ^(arm|aarch) ]] && patch -p1 -i "${srcdir}/android-dev.patch"
  grep -v setproctitle configure.in > tmp
  mv tmp configure.in
  autoreconf -f
}

build() {
  export CFLAGS="$CFLASG -I/usr/include/openssl-1.1"
  export LDFLAGS="$LDFLAGS -L/usr/lib/openssl-1.1"
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./configure \
    --build=$CHOST \
    --with-ssl-headers=/usr/include/openssl-1.1/openssl \
    --with-blowfish-headers=/usr/include/openssl-1.1/openssl \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man
  make
  cd "${srcdir}"
  gcc tun-cat.c -o tun-cat
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make PREFIX=/usr/bin DESTDIR="${pkgdir}" install

  install -Dm644 vtund.conf "${pkgdir}/usr/share/doc/vtun/examples/vtund.conf"
  sed -n '/--- Client config ---/,$p' vtund.conf > vtund-client.conf
  install -Dm600 vtund-client.conf "${pkgdir}/etc/vtund.conf"
  install -Dm644 Credits "${pkgdir}/usr/share/doc/vtun/Credits"
  install -Dm644 README.Setup "${pkgdir}/usr/share/doc/vtun/README.Setup"
  install -Dm644 README.Shaper "${pkgdir}/usr/share/doc/vtun/README.Shaper"
  install -Dm644 FAQ "${pkgdir}/usr/share/doc/vtun/FAQ"
  install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/vtun/ChangeLog"
  cd "${pkgdir}"
  rm -r var/run var/lock
  cd "${srcdir}"
  install -Dm644 vtund-ipv6-client.conf "${pkgdir}/usr/share/doc/vtun/examples/vtund-ipv6-client.conf"
  install -Dm644 vtund-ipv6-server.conf "${pkgdir}/usr/share/doc/vtun/examples/vtund-ipv6-server.conf"
  install -Dm755 tun-cat "${pkgdir}/usr/bin/tun-cat"
  install -Dm755 tun-cfg "${pkgdir}/usr/bin/tun-cfg"
  install -Dm644 tun-cfg.conf "${pkgdir}/etc/tun-cfg.conf"
  install -Dm644 README.tun-cfg "${pkgdir}/usr/share/doc/vtun/README.tun-cfg"
}
