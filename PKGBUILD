# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=kibana
pkgver=9.3.2
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

sha512sums=('a6fbf5f7bae8bf03fd20ae068fa0daa3461b58e612e2475e808d5cdcbe4daa5f22e95f350e2c19c51dd67160ad495717d88dbaff0641d6e2ad7065101456692e'
            'SKIP'
            '566296ee4d17a6cf68a04930ca6c1fcbb096a4c7d4ac8563c9e146ab084f10ec02333d19ba417b64831c63d76194c2d545874be9d4c12935599e96ba64e7d2ee'
            'afed49c164561f3c658a6d2423519adcf4d5293c416cd93fa5c9d12421416c1e9cb4287e832009049cfd014b365dc1cd93d9cf879117c701cce4caad3b772a8e'
            '9085884430c656cc68b855c3d6740e5fd0854a8785930341b29e15e201deacc1870d8223255d9ebe096cb111319bea9bf4faa03d0760d5819976ebf912221c7d')

validpgpkeys=('46095ACC8548582C1A2699A9D27D666CD88E42B4')

prepare() {
  cd ${pkgbase}-${pkgver}

  # remove nodejs strict version requirements
  sed "s@^var isVersionValid = .*@var isVersionValid = true;@" -i node_modules/@kbn/setup-node-env/node_version_validator.js

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

  find "${pkgdir}/usr/share/kibana/node_modules" -type d -empty -delete

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
