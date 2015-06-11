# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.1.0
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch. Please note; this package replaces the distributed precompiled binary 'node'"
arch=('i686' 'x86_64')
url="http://www.elasticsearch.org/overview/kibana/"
license=('apache')
makedepends=('git')
depends=('nodejs')
backup=('etc/webapps/kibana/kibana.yml')
install=kibana.install
source=(
	kibana.service
	"https://download.elasticsearch.org/kibana/kibana/$pkgname-${pkgver/r/-r}-linux-x64.tar.gz")
[[ $CARCH == 'i686' ]] && ${source[1]}=${source[1]/x64/x86}
md5sums=('SKIP'
         '77b65888f0ab6b8fa403732b3bf9fbe5')

package() {
  p=$srcdir/`basename ${source[1]%.tar.gz}`
  mkdir -p $pkgdir/usr/{share/webapps/kibana,lib/systemd/system} $pkgdir/etc/webapps/
  mv $p/config $pkgdir/etc/webapps/kibana
  cp -Rp $p/* $pkgdir/usr/share/webapps/kibana/
  cp $srcdir/kibana.service $pkgdir/usr/lib/systemd/system/
  ln -s /etc/webapps/kibana/ $pkgdir/usr/share/webapps/kibana/config

  # If you want the vanilla experience, remove these 2 lines to use the distributed binary
  rm $pkgdir/usr/share/webapps/kibana/node/bin/node
  ln -s /usr/bin/node $pkgdir/usr/share/webapps/kibana/node/bin/node
}
