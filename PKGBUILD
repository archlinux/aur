# $Id: PKGBUILD 195875 2016-11-14 18:07:50Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=yahoo-t
pkgver=0.4
pkgrel=7
pkgdesc="jabber yahoo transport"
arch=('any')
url="http://xmpppy.sourceforge.net/yahoo/"
license=('GPL')
depends=('python2' 'xmpppy')
backup=(etc/ejabberd/yahoo.xml)
source=(https://downloads.sourceforge.net/xmpppy/yahoo-transport-$pkgver.tar.gz
	yahoo-t.service)
sha256sums=('99f6866dab0b53dfa2ebb56839e86669d7b8f5c307fb5edcf7e84fc048993249'
            'e6c1f5ab98ab989dc935ba447fc962260fe6fe16b49d2639e2eaeba28e868e0a')

package() {
  cd "$srcdir"
  rm -rf yahoo-transport-$pkgver/curphoo/CVS
  install -D -m0644 ./yahoo-transport-$pkgver/config_example.xml "$pkgdir"/etc/ejabberd/yahoo.xml

  install -d -m0755 "$pkgdir"/usr/lib
  cp -r yahoo-transport-$pkgver "$pkgdir"/usr/lib

  mv "$pkgdir"/usr/lib/yahoo-transport-$pkgver "$pkgdir"/usr/lib/yahoo-t
  ln -s ../../../etc/ejabberd/yahoo.xml "$pkgdir"/usr/lib/yahoo-t/config.xml
  find "$pkgdir" -type f -name \*.py -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;

  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
