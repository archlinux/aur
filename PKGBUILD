# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=kibana
pkgver=9.2.2
pkgrel=1
pkgdesc='Browser based analytics and search dashboard for Elasticsearch'
url='https://www.elastic.co/products/kibana'
arch=('any')
license=('Apache')
depends=('nodejs')
optdepends=('elasticsearch')
backup=('etc/kibana/kibana.yml')
options=('!strip' 'emptydirs')
source=(https://artifacts.elastic.co/downloads/${pkgname}/${pkgname}-${pkgver}-linux-x86_64.tar.gz
        https://artifacts.elastic.co/downloads/${pkgname}/${pkgname}-${pkgver}-linux-x86_64.tar.gz.asc
        kibana.service
        tmpfile.conf
        user.conf)

sha512sums=('11c6701523cb17b43b160229f7958885ff6dbd5a321bc8883bd2fc51101baf31f2a30cf6839efff6dee3570161ccfd4db36b8592f7f405050a784e12a1f0fe61'
            'SKIP'
            '3002f529c0960f1a0c233f7589819ed9c06c8ec6539ef416529d212bd1657d61bf0662b954b2b2dbff8a33cea2d545ea34e06df9088590156564e08bfc20216b'
            'afed49c164561f3c658a6d2423519adcf4d5293c416cd93fa5c9d12421416c1e9cb4287e832009049cfd014b365dc1cd93d9cf879117c701cce4caad3b772a8e'
            '9085884430c656cc68b855c3d6740e5fd0854a8785930341b29e15e201deacc1870d8223255d9ebe096cb111319bea9bf4faa03d0760d5819976ebf912221c7d')

validpgpkeys=('46095ACC8548582C1A2699A9D27D666CD88E42B4')

prepare() {
  cd ${pkgbase}-${pkgver}

  # remove nodejs strict version requirements
  sed "s@^var isVersionValid = .*@var isVersionValid = true;@" -i src/setup_node_env/node_version_validator.js

  # set default quiet mode for systemd, cli option forces specified values
  sed -r 's|#(logging.quiet:) false|\1 true|' -i config/kibana.yml
}

package() {
  cd ${pkgbase}-${pkgver}

  install -dm 755 "${pkgdir}/usr/share/kibana"
  cp -a * "${pkgdir}/usr/share/kibana"

  install -dm 750 "${pkgdir}/etc/kibana"
  install -Dm 640 config/kibana.yml -t "${pkgdir}/etc/kibana"
  install -Dm 644 "${srcdir}/kibana.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/user.conf" "${pkgdir}/usr/lib/sysusers.d/kibana.conf"
  install -Dm 644 "${srcdir}/tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/kibana.conf"

  rm -r "${pkgdir}/usr/share/kibana/node"
  find "${pkgdir}/usr/share/kibana/node_modules" -type d -empty -delete

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
