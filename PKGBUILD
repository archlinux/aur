# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=kibana-bin
pkgver=8.15.1
pkgrel=1
pkgdesc="Browser based analytics and search dashboard for Elasticsearch"
arch=("x86_64")
url="https://github.com/elastic/kibana"
license=("Apache")
depends=("nodejs")
optdepends=("elasticsearch")
backup=("etc/kibana/kibana.yml")
options=("!strip" "emptydirs")
source=("https://artifacts.elastic.co/downloads/kibana/kibana-${pkgver}-linux-x86_64.tar.gz"
        "kibana.service"
        "kibana.tmpfiles"
        "kibana.sysusers")
sha512sums=('fe2cec0fae976b4d299d60f0b5a71532d9d5c3bf993682f0044c09c93c2bb17bf4642848bdfcf62c0249da4179de7dda643aedcc12204682539a31ed01aabe63'
            'c8858f16fb04bd0f549e9e0b36b1792d7873650a6a78a6cad685f2f758f5bf07d7189abddb8a5f013453e74390b79d4217d3b56f1ac9e917ecc5002f61fdffef'
            '76fea3f5feed21398a05f8ad7789f72d7e08d89d19ed48e7eda6ebd90168b2b9b25829d54d8f15785783dd14380399c5d1c58b0e5c2e52e2ed3c3db5fa3c69d7'
            'f3dca652c1ce3f292391a8c8b3d021e1e769d936e7598978d23e20f710bb0b79aae8acfd1b32aebcb87b2cb15d765c83db5584a9df904590350e0fc0570a3193')

prepare() {
  cd kibana-${pkgver}
  sed "s@^var isVersionValid = .*@var isVersionValid = true;@" -i src/setup_node_env/node_version_validator.js
  sed -r "s|#(logging.quiet:) false|\1 true|" -i config/kibana.yml
}

package() {
  cd kibana-${pkgver}
  find node_modules -type d -empty -delete
  rm -rf node
  install -Dm 640 config/kibana.yml "${pkgdir}/etc/kibana/kibana.yml"
  install -dm 755 "${pkgdir}/usr/share/webapps/kibana"
  cp -a * "${pkgdir}/usr/share/webapps/kibana"
  chmod -R 755 "${pkgdir}/usr/share/webapps/kibana" "${pkgdir}/etc/kibana/"
  install -Dm 644 "${srcdir}/kibana.service" "${pkgdir}/usr/lib/systemd/system/kibana.service"
  install -Dm 644 "${srcdir}/kibana.sysusers" "${pkgdir}/usr/lib/sysusers.d/kibana.conf"
  install -Dm 644 "${srcdir}/kibana.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/kibana.conf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
