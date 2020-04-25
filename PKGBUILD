# Maintenance: Felix Golatofski <contact@xdfr.de>
# Contributor: Jeremy MountainJohnson <jskier[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

_pkgname=kibana
pkgname=kibana5
pkgver=5.6.16
pkgrel=2
pkgdesc='Browser based analytics and search dashboard for Elasticsearch5 series'
url='https://www.elastic.co/products/kibana'
arch=('any')
license=('Apache')
depends=('nodejs')
optdepends=('elasticsearch5')
conflicts=('kibana' 'kibana4')
provides=("kibana=$pkgver")
backup=('etc/kibana/kibana.yml')
options=('!strip' 'emptydirs')
source=(https://artifacts.elastic.co/downloads/${_pkgname}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz
        kibana.service
        tmpfile.conf
        user.conf)
sha512sums=('e3b8cd5911444be3c8f39d2060216d968456cae123a3ac47805bbf1e3d5ca581ecfd061988655926a5c6243df0ea2e127e5cf6fe35d336df570cd5b82cfd338f'
            '3216c2864cf184cea0883677a05bf83cf396fda52dbd3d9a187de22f0c45d13db58f8fb4dc926694ba7d7a24000cf6d5f6218805f74fb5d729fc85c643ca8f2f'
            'afed49c164561f3c658a6d2423519adcf4d5293c416cd93fa5c9d12421416c1e9cb4287e832009049cfd014b365dc1cd93d9cf879117c701cce4caad3b772a8e'
            '9085884430c656cc68b855c3d6740e5fd0854a8785930341b29e15e201deacc1870d8223255d9ebe096cb111319bea9bf4faa03d0760d5819976ebf912221c7d')

prepare() {
  cd ${_pkgname}-${pkgver}-linux-x86_64

  # remove nodejs strict version requirements
  sed "s@^require('./node_version_validator');@// \0@" -i src/setup_node_env/index.js

  # set default quiet mode for systemd, cli option forces specified values
  sed -r 's|#(logging.quiet:) false|\1 true|' -i config/kibana.yml
}

package() {
  cd ${_pkgname}-${pkgver}-linux-x86_64

  install -dm 755 "${pkgdir}/usr/share/kibana"
  cp -a * "${pkgdir}/usr/share/kibana"

  install -dm 750 "${pkgdir}/etc/kibana"
  install -Dm 640 config/kibana.yml -t "${pkgdir}/etc/kibana"
  install -Dm 644 "${srcdir}/kibana.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/user.conf" "${pkgdir}/usr/lib/sysusers.d/kibana.conf"
  install -Dm 644 "${srcdir}/tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/kibana.conf"

  rm -r "${pkgdir}/usr/share/kibana/node"
  find "${pkgdir}/usr/share/kibana/node_modules" -type d -empty -delete
}
