# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Tom Richards <tom@tomrichards.net>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: David Danier <david.danier@team23.de>

pkgname=solr
pkgver=7.2.0
pkgrel=1
pkgdesc="Popular, blazing fast open source enterprise search platform from the Apache Lucene project"
arch=('any')
license=('Apache')
url="http://lucene.apache.org/solr/"
depends=('java-runtime-headless>=8')
source=("http://archive.apache.org/dist/lucene/$pkgname/$pkgver/solr-$pkgver.tgz"{,.asc}
        "solr.service"
        "solr.sysusers")
backup=(opt/solr/server/etc/jetty{,-http,-https,-ssl}.xml
        opt/solr/server/etc/webdefault.xml
        opt/solr/server/solr/solr.xml
        opt/solr/server/solr/zoo.cfg)
install="$pkgname.install"
options=(!strip)
validpgpkeys=('E6E21FFCDCEA14C95910EA65051A0FAF76BC6507') # Adrien Grand (CODE SIGNING KEY) <jpountz@apache.org>
sha256sums=('1b2cedf176a62c259bfa72db5bf0ba18cc3af255bc8e25187d3b58213535011f'
            'SKIP'
            'e4ca86de2ef9425913280deeeec42d6e8ff310b08ea55d9156193ceef3c847bd'
            'a336c1a16742b100b3d28fe49722366477bb805e262f36b83cc2fdd9e85d5bf9')
build() {
  cd "$srcdir/$pkgname-$pkgver"/bin
  rm *.cmd
  rm install_solr_service.sh
  rm -rf init.d
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir"/opt/solr
  cp -R * "$pkgdir"/opt/solr
  chown -R 114:114 "$pkgdir"/opt/solr
  install -Dm644 "$srcdir/solr.service" "$pkgdir/usr/lib/systemd/system/solr.service"
  install -Dm644 "$srcdir/solr.sysusers" "$pkgdir/usr/lib/sysusers.d/solr.conf"
}
