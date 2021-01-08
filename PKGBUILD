# Maintainer: Tung Ha <tunght13488[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=kibana6
_pkgname=kibana
pkgver=6.8.13
pkgrel=1
pkgdesc='Browser based analytics and search dashboard for Elasticsearch'
url='https://www.elastic.co/products/kibana'
arch=('any')
license=('Apache')
depends=('nodejs')
optdepends=('elasticsearch6')
backup=('etc/kibana6/kibana.yml')
options=('!strip' 'emptydirs')
source=(https://artifacts.elastic.co/downloads/${pkgname}/${_pkgname}-oss-${pkgver}-linux-x86_64.tar.gz
        kibana6.service
        tmpfile.conf
        user.conf)
sha512sums=('58e3d52616ca306739642e7932ec2f6388231c966e6fd5ce3431fc39e46183745f90ae069d659ad6c59f5c1361220e012723ccccd7dc47f61f53bf6d14705cde'
            '47aa34d76af831761c0da4bf3a056894f51d8f6aee83c07b8b7c4d7f3dd561e7e26f3b7aed8371aee35bda162e256ba18fb7acfafb98f629197505535e98687f'
            'b9c09618bb5c41bb8de106d162db1a6efc0c5f26fd34ad16161d5719a30ef923e2a6b84c3e351335d622e5deef835f605aed01a21afd3db44b89da5fb85273c8'
            '1027e200a1d517d41a9e57fa4e30064c35065841ac4a602fcfd2a59cfbf1ec83f39fb6e5c29b69e6a78cbec126fac5cb9c82826f665243d36d4f58553f3140d8')

prepare() {
  cd ${_pkgname}-${pkgver}-linux-x86_64

  # remove nodejs strict version requirements
  sed "s@^require('./node_version_validator');@// \0@" -i src/setup_node_env/index.js

  # set default quiet mode for systemd, cli option forces specified values
  sed -r 's|#(logging.quiet:) false|\1 true|' -i config/kibana.yml
}

package() {
  cd ${_pkgname}-${pkgver}-linux-x86_64

  install -dm 755 "${pkgdir}/usr/share/kibana6"
  cp -a * "${pkgdir}/usr/share/kibana6"

  install -dm 750 "${pkgdir}/etc/kibana6"
  install -Dm 640 config/kibana.yml -t "${pkgdir}/etc/kibana6"
  install -Dm 644 "${srcdir}/kibana6.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/user.conf" "${pkgdir}/usr/lib/sysusers.d/kibana6.conf"
  install -Dm 644 "${srcdir}/tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/kibana6.conf"

  rm -r "${pkgdir}/usr/share/kibana6/node"
  find "${pkgdir}/usr/share/kibana6/node_modules" -type d -empty -delete
}

# vim: ts=2 sw=2 et:
