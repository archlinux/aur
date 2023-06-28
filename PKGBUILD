# Contributor: Phillip Smith <pkgbuild@phs.id.au>

pkgname=sysusage
pkgver=5.7.1
pkgrel=1
pkgdesc="Monitor your system, generate periodical graph reports, serve through a web interface"
arch=('any')
url="http://sysusage.darold.net/"
license=('GPL3')
depends=('inetutils' 'rrdtool' 'sysstat' 'perl' 'perl-proc-queue' 'procps-ng')
backup=('etc/sysusage.cfg')
install="$pkgname.install"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/darold/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('2854c16a1d09dbb262407cf426a09554dbf03f1aa15c4ae9e40ce5314db03718f24cf9b0ed44b52428a5d703e0e95f0fb680ac73472e092327650e764ecc84c4')

build() {
  cd $pkgname-$pkgver
  
  perl Makefile.PL \
    BINDIR=/usr/bin \
    CONFDIR=/etc \
    PIDDIR=/var/run \
    BASEDIR=/var/lib/$pkgname \
    HTMLDIR=/srv/http/$pkgname \
    MANDIR=/usr/share/man/man1 \
    DOCDIR=/usr/share/doc/$pkgname

  make
}

package() {
  cd $pkgname-$pkgver
  
  install -dm755 "$pkgdir"/var/lib/sysusage
  
  install -Dm644 Sar.pm "$pkgdir"/usr/share/perl5/vendor_perl/SysUsage/Sar.pm
  install -Dm644 sysusage.cfg "$pkgdir"/etc/sysusage.cfg
  install -Dm755 bin/sysusage "$pkgdir"/usr/bin/sysusage
  install -Dm755 bin/sysusagegraph "$pkgdir"/usr/bin/sysusagegraph
  install -Dm755 bin/sysusagewarn "$pkgdir"/usr/bin/sysusagewarn
  install -Dm644 resources/sysusage-logo.png "$pkgdir"/srv/http/sysusage/sysusage-logo.png
  install -Dm644 resources/sysusage.css "$pkgdir"/srv/http/sysusage/sysusage.css
  install -Dm644 resources/sysusage.js "$pkgdir"/srv/http/sysusage/sysusage.js
  install -Dm644 resources/sysusage_arrow.png "$pkgdir"/srv/http/sysusage/sysusage_arrow.png
  install -Dm644 resources/favicon.ico "$pkgdir"/srv/http/sysusage/favicon.ico
  install -Dm644 doc/sysusage.1 "$pkgdir"/usr/share/man/man1/sysusage.1
  install -Dm644 README "$pkgdir"/usr/share/doc/sysusage/README
  install -Dm644 ChangeLog "$pkgdir"/usr/share/doc/sysusage/ChangeLog
  install -Dm755 plugins/plugin-sample1.pl "$pkgdir"/usr/share/doc/sysusage/plugins/plugin-sample1.pl
  install -Dm755 plugins/plugin-sample2.pl "$pkgdir"/usr/share/doc/sysusage/plugins/plugin-sample2.pl

  # install sysusagejqgraph as per request from @cerb
  install -Dm755 bin/sysusagejqgraph "$pkgdir"/usr/bin/sysusagejqgraph
  tar xzf resources/jqplot-sysusage.tar.gz --directory "$pkgdir"/srv/http/sysusage
}

# vim:set ts=2 sw=2 et:
