# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Contributor: Eric Liu <eric@hnws.me>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=kibana-xpack
_relpkgname=kibana
pkgver=8.12.2
pkgrel=1
pkgdesc='Browser based analytics and search dashboard for Elasticsearch'
url='https://www.elastic.co/products/kibana'
arch=('x86_64')
license=('custom:Elastic2')
depends=('nodejs-lts-gallium')
optdepends=('elasticsearch'
            'nss: screenshotting plugin')
provides=("kibana=$pkgver")
conflicts=('kibana')
backup=('etc/kibana/kibana.yml' 'etc/kibana/node.options')
options=('!strip' 'emptydirs')
source=(https://github.com/elastic/${_relpkgname}/archive/v${pkgver}.tar.gz
        kibana.service
        tmpfile.conf
        user.conf)
b2sums=('31bbee0c4ff0260146747daabb5876b135d8db75da65bdbd0101c304bfcbf6b13738de1e91bedf5d965c5e0b64c989f7929828491bdf9ad4fc287b56b25c99bb'
        '3ecea24096a7cb9dbcae29d41006b16d0e03dce23224ccaad0990813dae39a18f7bc4bfa72c4ec8b4ff3bf9fcf70e92eca404255531984b98bdaf1acce117fcf'
        'ad10e8943b1352eaac2a615e38a016e977c0662af7a4fe9f475c2cf94569d79bb91683c61d2467d93161a760fd95f1aebac566d60fbaa504cea20152e4f1333c'
        '5a80a4dc956212856a4a8740da305b50c399f01c6b189222c4c9b2b3ef0270611056acc92cccd2552b005a80ed3cbc8181dc6642a6611e44831487a1ca529c97')

validpgpkeys=('46095ACC8548582C1A2699A9D27D666CD88E42B4') # Elasticsearch (Elasticsearch Signing Key) <dev_ops@elasticsearch.org>

prepare() {
  cd $_relpkgname-${pkgver}

  # remove nodejs strict version requirements
  sed "s@^require('./node_version_validator');@// \0@" -i src/setup_node_env/no_transpilation_dist.js
}

package() {
  cd $_relpkgname-${pkgver}

  install -dm 755 "${pkgdir}/usr/share/kibana"
  cp -a * "${pkgdir}/usr/share/kibana"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"

  install -dm 750 "${pkgdir}/etc/kibana"
  install -Dm 640 config/{kibana.yml,node.options} -t "${pkgdir}/etc/kibana"
  install -Dm 644 "${srcdir}/kibana.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/user.conf" "${pkgdir}/usr/lib/sysusers.d/kibana.conf"
  install -Dm 644 "${srcdir}/tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/kibana.conf"

  rm -r "${pkgdir}/usr/share/kibana/node"
  find "${pkgdir}/usr/share/kibana/node_modules" -type d -empty -delete

  if [ -f "${pkgdir}/usr/share/kibana/data/uuid" ];then
    rm -v "${pkgdir}/usr/share/kibana/data/uuid"
  fi
}

# vim: ts=2 sw=2 et:
