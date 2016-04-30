# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prelude-lml
pkgver=3.0.0
pkgrel=1
pkgdesc="The prelude log analyzer"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
depends=('gamin' 'pcre' 'gtk-doc' 'libprelude')
optdepends=('syslog-ng: store logs in syslog files to let prelude-lml read it'
            'rsyslog: store logs in syslog files to let prelude-lml read it')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz"
        "prelude-lml.run"
        "prelude-lml.service"
        "prelude-lml-conf.patch")
install="$pkgname.install"
backup=('etc/prelude-lml/prelude-lml.conf'
        'etc/prelude-lml/plugins.rules')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/var/run
  install -d -m 0700 "$pkgdir/etc/prelude-lml/ruleset"
  install -D -m 0644 "$srcdir/$pkgname.run" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

prepare() {
  patch -p0 <prelude-lml-conf.patch
}

md5sums=('a3a78973f38d290918b2525d0334f148' '00192275d77f9ee2ebbb7f03ead213b4' '6afec530104f971f73a21d84e557c015' '8095b31d0f0d970813c59fbd6cd4297d')
