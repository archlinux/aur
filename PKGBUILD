# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Maintainer: Eric Liu <eric@hnws.me>
# Official repo maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Official repo maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Official repo Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=kibana-xpack
relpkgname=kibana
pkgver=7.13.4
pkgrel=1
pkgdesc='Browser based analytics and search dashboard for Elasticsearch'
url='https://www.elastic.co/products/kibana'
arch=('x86_64')
license=('custom:Elastic2')
depends=('nodejs-lts-fermium')
optdepends=('elasticsearch')
provides=("kibana=$pkgver")
conflicts=('kibana')
backup=('etc/kibana/kibana.yml')
options=('!strip' 'emptydirs')
source=(https://artifacts.elastic.co/downloads/$relpkgname/$relpkgname-${pkgver}-linux-x86_64.tar.gz{,.asc}
        kibana.service
        tmpfile.conf
        user.conf)
sha512sums=('1accd5d6933f3f2f54174e53da626bc275b99b2f102d5f8cfee934d3520ee55a97c9c545cca32ddffec06a96114ce284e2e128cf334538214566c6530d1d673e'
            'SKIP'
            'be50713d4e4db3a8b2d0d02ec68b56ce1636ffa9a41738b0abf276c562c36ef6118f440f25b220f39302ba23b2351b5a38f961c8693ad03ea19424e4d40409e6'
            'afed49c164561f3c658a6d2423519adcf4d5293c416cd93fa5c9d12421416c1e9cb4287e832009049cfd014b365dc1cd93d9cf879117c701cce4caad3b772a8e'
            '9085884430c656cc68b855c3d6740e5fd0854a8785930341b29e15e201deacc1870d8223255d9ebe096cb111319bea9bf4faa03d0760d5819976ebf912221c7d')
validpgpkeys=('46095ACC8548582C1A2699A9D27D666CD88E42B4') # Elasticsearch (Elasticsearch Signing Key) <dev_ops@elasticsearch.org>

prepare() {
  cd $relpkgname-${pkgver}-linux-x86_64

  # remove nodejs strict version requirements
  sed "s@^require('./node_version_validator');@// \0@" -i src/setup_node_env/no_transpilation.js

  # set default quiet mode for systemd, cli option forces specified values
  sed -r 's|#(logging.quiet:) false|\1 true|' -i config/kibana.yml
}

package() {
  cd $relpkgname-${pkgver}-linux-x86_64

  install -dm 755 "${pkgdir}/usr/share/kibana"
  cp -a * "${pkgdir}/usr/share/kibana"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  install -dm 750 "${pkgdir}/etc/kibana"
  install -Dm 640 config/kibana.yml -t "${pkgdir}/etc/kibana"
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
