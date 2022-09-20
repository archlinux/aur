# Maintainer: gilcu3 <gilcu3 at gmail dot com>

_pkgname=sslh
pkgname=$_pkgname-git
pkgver=2.0.rc1.r24.g72c743e
pkgrel=1
pkgdesc="Network port multiplexer. Allows sharing of HTTP, SSL, SSH, OpenVPN, tinc, XMPP, etc. on the same port"
arch=('i686' 'x86_64')
url='http://www.rutschle.net/tech/sslh.shtml'
license=('GPL2')
depends=('glibc' 'libcap' 'libconfig' 'libwrap' 'pcre2' 'systemd-libs')
makedepends=('git' 'libev' 'systemd' 'conf2struct-git' 'perl-conf-libconfig')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/sslh.cfg')
source=($pkgname::'git+https://github.com/yrutschle/sslh'
        'sslh.cfg'
        'sslh.service'
        'sslh-select.service'
        'sslh-fork.service')
sha256sums=('SKIP'
            '3feff7e2c096bc18d8f0073141c1017dccd4abbbc491fa16b55afd5c5ff6352c'
            '49ed1c88b0de079bc31a94e600b63edd7ea95b4aa9b5f533c15db1221d0892db'
            '885dfa4a4de75e28d0471debcb0473ecaf813eb21b83db4e855caf76a6d5cb3b'
            '46114de034266ea953eecb825730e4382faa8a97718f23df2a3ab2189623eb00')
pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|^\(ExecStart.*\) $DAEMON_OPTS|\1 -F/etc/sslh.conf|' scripts/systemd.sslh.service
}

build() {
  cd $pkgname
  make USELIBCAP=1 USELIBWRAP=1 USESYSTEMD=1 all systemd-sslh-generator
}

package() {
  # default arch config
  install -Dm 644 sslh.cfg "$pkgdir/etc/sslh.cfg"
  # manually install to have both ssl-fork and ssl-select
  cd $pkgname
  install -Dm 755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm 755 sslh-select "$pkgdir/usr/bin/sslh-select"
  ln -s sslh-fork "$pkgdir/usr/bin/sslh"
  # install manpage
  install -Dm 644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-fork.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-select.8.gz"
  # install examples files
  install -Dm 644 basic.cfg "$pkgdir/usr/share/doc/$pkgname/basic.cfg"
  install -Dm 644 example.cfg "$pkgdir/usr/share/doc/$pkgname/example.cfg"
  # systemd
  install -dm 755 "$pkgdir"/usr/lib/systemd/{system,system-generators}
  install -Dm 755 systemd-sslh-generator "$pkgdir/usr/lib/systemd/system-generators/systemd-sslh-generator"
  cd "$pkgdir"
  install -Dm 644 "$srcdir"/sslh{,-fork,-select}.service usr/lib/systemd/system
}

