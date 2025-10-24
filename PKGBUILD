# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Contributor: Eric Liu <eric@hnws.me>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=kibana-xpack
_relpkgname=kibana
pkgver=9.2.0
pkgrel=1
pkgdesc='Browser based analytics and search dashboard for Elasticsearch'
url='https://www.elastic.co/products/kibana'
arch=('x86_64')
license=('custom:Elastic2')
depends=('nodejs')
optdepends=('elasticsearch'
            'nss: screenshotting plugin')
provides=("kibana=$pkgver")
conflicts=('kibana')
backup=('etc/kibana/kibana.yml' 'etc/kibana/node.options')
options=('!strip' 'emptydirs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/elastic/kibana/archive/v${pkgver}.tar.gz"
        kibana.service
        tmpfile.conf
        user.conf)
sha512sums=('1f0d836ecdb55fad1324f80983eabf518057c6d12b1178cfac2de71496d2cfbde439e76f9e6b4f97bda9d2952dd876c9db485a69786009ebb70d31aec8e4adf5'
            'be50713d4e4db3a8b2d0d02ec68b56ce1636ffa9a41738b0abf276c562c36ef6118f440f25b220f39302ba23b2351b5a38f961c8693ad03ea19424e4d40409e6'
            'afed49c164561f3c658a6d2423519adcf4d5293c416cd93fa5c9d12421416c1e9cb4287e832009049cfd014b365dc1cd93d9cf879117c701cce4caad3b772a8e'
            '9085884430c656cc68b855c3d6740e5fd0854a8785930341b29e15e201deacc1870d8223255d9ebe096cb111319bea9bf4faa03d0760d5819976ebf912221c7d')
validpgpkeys=('46095ACC8548582C1A2699A9D27D666CD88E42B4') # Elasticsearch (Elasticsearch Signing Key) <dev_ops@elasticsearch.org>

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

  #rm -r "${pkgdir}/usr/share/kibana/node"
  #find "${pkgdir}/usr/share/kibana/node_modules" -type d -empty -delete

  #if [ -f "${pkgdir}/usr/share/kibana/data/uuid" ];then
  #  rm -v "${pkgdir}/usr/share/kibana/data/uuid"
  #fi
}

# vim: ts=2 sw=2 et:
