# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=kibana-bin
pkgver=8.15.1
pkgrel=1
pkgdesc="Browser based analytics and search dashboard for Elasticsearch"
arch=('x86_64')
url="https://github.com/elastic/kibana"
license=('Apache')
depends=('nodejs')
optdepends=('elasticsearch')
backup=('etc/kibana/kibana.yml')
options=('!strip' 'emptydirs')
source=("https://artifacts.elastic.co/downloads/kibana/kibana-${pkgver}-linux-x86_64.tar.gz"
        "kibana.service"
        "kibana.tmpfiles"
        "kibana.sysusers")
sha512sums=('fe2cec0fae976b4d299d60f0b5a71532d9d5c3bf993682f0044c09c93c2bb17bf4642848bdfcf62c0249da4179de7dda643aedcc12204682539a31ed01aabe63'
            'c8858f16fb04bd0f549e9e0b36b1792d7873650a6a78a6cad685f2f758f5bf07d7189abddb8a5f013453e74390b79d4217d3b56f1ac9e917ecc5002f61fdffef'
            'b3732aa30d88889f2269fa87fcf18fdfb76cf5e407a584e6706d0d46e32791773d9647c4646087b7043631cfd969b54fc3be776624df7c67000696937832b7a6'
            '5d783604a1afe56f075341405e2e05247a4dabf234c2a6861078a17d42cb884fb7e33ffba2b2b294c906e72b1d86fdd1a03189a6d6ac9d813b791ad7acf86b04')

prepare() {
  cd kibana-${pkgver}
  sed "s@^var isVersionValid = .*@var isVersionValid = true;@" -i src/setup_node_env/node_version_validator.js
  sed -r 's|#(logging.quiet:) false|\1 true|' -i config/kibana.yml
}

package() {
  cd kibana-${pkgver}
  find node_modules -type d -empty -delete
  rm -rf node
  install -Dm 640 config/kibana.yml "${pkgdir}/etc/kibana/kibana.yml"
  install -dm 755 "${pkgdir}/usr/share/webapps/kibana"
  cp -a * "${pkgdir}/usr/share/webapps/kibana"
  install -Dm 644 "${srcdir}/kibana.service" "${pkgdir}/usr/lib/systemd/system/kibana.service"
  install -Dm 644 "${srcdir}/kibana.sysusers" "${pkgdir}/usr/lib/sysusers.d/kibana.conf"
  install -Dm 644 "${srcdir}/kibana.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/kibana.conf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
