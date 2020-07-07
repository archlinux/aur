# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: lp76 <l.peduto@gmail.com>
pkgname=mailgraph
pkgver=1.14
pkgrel=6
pkgdesc="A very simple mail statistics RRDtool frontend for Postfix and Sendmail"
url="https://mailgraph.schweikert.ch/"
arch=('any')
license=('GPL')
options=(emptydirs)
depends=('rrdtool' 'perl-file-tail')
source=("https://mailgraph.schweikert.ch/pub/$pkgname-$pkgver.tar.gz"
mailgraph.service)
md5sums=('0f0ae91968ea7ae0c1d14985c560530b'
         '92d411ab7f14083a77faa07b2ade653f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s:mailgraph.rrd:/var/lib/mailgraph/mailgraph.rrd:" mailgraph.cgi
  sed -i "s:mailgraph_virus.rrd:/var/lib/mailgraph/mailgraph_virus.rrd:" mailgraph.cgi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #CGI_DIR=`grep 'ScriptAlias /cgi-bin/' /etc/httpd/conf/httpd.conf | awk '{print $3}' | sed 's|"||g'`
  CGI_DIR="/usr/share/webapps/mailgraph"

  install -D -m755 mailgraph.pl "$pkgdir/usr/bin/mailgraph.pl"
  install -D -m755 mailgraph.cgi "$pkgdir/$CGI_DIR/mailgraph.cgi"
  install -D -m755 mailgraph.css "$pkgdir/$CGI_DIR/mailgraph.css"
  install -D -m644 "$srcdir/mailgraph.service" "$pkgdir/usr/lib/systemd/system/mailgraph.service"
  install -d -m755 "$pkgdir/var/lib/mailgraph"
}
