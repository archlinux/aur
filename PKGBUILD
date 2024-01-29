# Maintainer: gilcu3 <gilcu3 at gmail dot com>

_pkgname=sslh
pkgname=$_pkgname-git
pkgver=2.0.1.r23.g3117c15
pkgrel=2
pkgdesc="Network port multiplexer. Allows sharing of HTTP, SSL, SSH, OpenVPN, tinc, XMPP, etc. on the same port"
arch=('i686' 'x86_64')
url='http://www.rutschle.net/tech/sslh.shtml'
license=('GPLv2')
depends=('glibc' 'libcap' 'libconfig' 'pcre2' 'systemd-libs' 'libbsd' 'libev')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/sslh.cfg')
source=($pkgname::'git+https://github.com/yrutschle/sslh')
sha256sums=('SKIP')
install=${_pkgname}.install
pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|ExecStart=/usr/sbin/sslh --foreground $DAEMON_OPTS|ExecStart=/usr/sbin/sslh-fork --foreground --config /etc/sslh.cfg|;/EnvironmentFile/d;s|^\(CapabilityBoundingSet=CAP_NET_BIND_SERVICE\)|\1 CAP_NET_RAW|;s|^\(AmbientCapabilities=CAP_NET_BIND_SERVICE\)|\1 CAP_NET_RAW|' scripts/systemd.sslh.service
  sed '29 s|443|7443|;30 s|443|8443|;s|thelonious|0.0.0.0|;/user:/d;/pidfile:/d;s|^\(# example.cfg\)|\1 in /usr/share/doc/'${pkgname%-git}' folder|' < basic.cfg > sslh.cfg
}

build() {
  cd $pkgname
  ./configure
  make \
    VERSION=\"$pkgver-$pkgrel\" \
    USELIBCAP=1 \
    USESYSTEMD=1 \
    USELIBBSD=1 \
    all systemd-sslh-generator
}

package() {
  cd $pkgname
  # default arch config
  install -Dm 644 sslh.cfg "$pkgdir/etc/sslh.cfg"
  # manually install to have both ssl-fork and ssl-select
  install -Dm 755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm 755 sslh-select "$pkgdir/usr/bin/sslh-select"
  install -Dm 755 sslh-ev "$pkgdir/usr/bin/sslh-ev"
  # install manpage
  install -Dm 644 sslh.8.gz -t "$pkgdir/usr/share/man/man8/sslh.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-fork.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-select.8.gz"
  # install examples files
  install -Dm 644 {basic,example,test,udp}.cfg -t "$pkgdir/usr/share/doc/$pkgname/"
  # systemd
  install -dm 755 "$pkgdir"/usr/lib/systemd/{system,system-generators}
  install -Dm 755 systemd-sslh-generator -t "$pkgdir/usr/lib/systemd/system-generators/systemd-sslh-generator"
  install -Dm 644 scripts/systemd.sslh.service    ${pkgdir}/usr/lib/systemd/system/sslh.service
}

# vim:set ts=2 sw=2 et:
