# Maintainer: gilcu3 <gilcu3 at gmail dot com>

_pkgname=sslh
pkgname=$_pkgname-git
pkgver=2.3.0.r18.g70a776f
pkgrel=1
pkgdesc="SSL/SSH/OpenVPN/XMPP/tinc port multiplexer"
arch=('i686' 'x86_64')
url='http://www.rutschle.net/tech/sslh.shtml'
license=('GPL-2.0-only')
depends=('glibc' 'libcap' 'libconfig' 'pcre2' 'systemd-libs' 'libbsd' 'libev')
makedepends=('systemd')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/sslh/default.cfg')
source=($pkgname::'git+https://github.com/yrutschle/sslh'
        'sslh.service'
        'sslh-select.service'
        'sslh-ev.service'
        'sslh-fork.service')
sha256sums=('SKIP'
            '3d084889cb671df22382767d181e25f1c0a0d63b6937cadb550af0153c488c74'
            '42182146dfe6ca99c5e07e1009f017567a276c504308ed39ecc05b304f28f107'
            '6580a61b81a0a1a9806a9d23a82dcc2e601f237bd1e4bd66a550e385cca13d51'
            'a6aabd7ad68c9c1fdb0e2f5dcb9f8e108651a77d5422e718a1186607b8657bea')

install=${_pkgname}.install
pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  # sed -i 's|ExecStart=/usr/sbin/sslh -F/etc/sslh/%I.cfg -f $DAEMON_OPTS|ExecStart=/usr/bin/sslh-fork -F/etc/sslh/%I.cfg -f|;/EnvironmentFile/d;s|^\(CapabilityBoundingSet=CAP_NET_BIND_SERVICE\)|\1 CAP_NET_RAW|;s|^\(AmbientCapabilities=CAP_NET_BIND_SERVICE\)|\1 CAP_NET_RAW|' scripts/systemd.sslh@.service
  # sed -i 's|ExecStart=/usr/sbin/sslh-select -F/etc/sslh/%I.cfg -f $DAEMON_OPTS|ExecStart=/usr/bin/sslh-select -F/etc/sslh/%I.cfg -f|;/EnvironmentFile/d;s|^\(CapabilityBoundingSet=CAP_NET_BIND_SERVICE\)|\1 CAP_NET_RAW|;s|^\(AmbientCapabilities=CAP_NET_BIND_SERVICE\)|\1 CAP_NET_RAW|' scripts/systemd.sslh-select@.service
  sed '29 s|443|7443|;30 s|443|8443|;s|thelonious|0.0.0.0|;/user:/d;/pidfile:/d;s|^\(# example.cfg\)|\1 in /usr/share/doc/'${pkgname%-git}' folder|' < basic.cfg > default.cfg
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --bindir=/usr/bin
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
  install -Dm 644 default.cfg "$pkgdir/etc/sslh/default.cfg"
  # manually install to have sslh-fork, sslh-select and sslh-ev
  install -Dm 755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm 755 sslh-select "$pkgdir/usr/bin/sslh-select"
  install -Dm 755 sslh-ev "$pkgdir/usr/bin/sslh-ev"
  # install manpage
  install -Dm 644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-fork.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-select.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-ev.8.gz"
  # install examples files
  install -Dm 644 {basic,example,test,udp}.cfg -t "$pkgdir/usr/share/doc/$pkgname/"
  # systemd
  install -dm 755 "$pkgdir"/usr/lib/systemd/{system,system-generators}
  install -Dm 755 systemd-sslh-generator -t "$pkgdir/usr/lib/systemd/system-generators/systemd-sslh-generator"
  cd "$pkgdir"
  install -Dm 644 "$srcdir"/sslh{,-ev,-fork,-select}.service usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
