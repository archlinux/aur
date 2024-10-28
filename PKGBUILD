# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=kibana-bin
pkgver=8.15.3
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
sha512sums=('ba914e4b424a3e55194d06174b31158d703b520af1859013266dd54bd21661de9aeb66dd1eefebda963270dcb2fd66dfef85184131c6f85fc8c0eb0343989535'
            'c8858f16fb04bd0f549e9e0b36b1792d7873650a6a78a6cad685f2f758f5bf07d7189abddb8a5f013453e74390b79d4217d3b56f1ac9e917ecc5002f61fdffef'
            'b27b0fe6af95d95b3c2113c969c03c72f0b2100e88e643b6303329c5039d5e480242a08e7dbfa9fa95023337b713729cf563889a98bdc0e979f377eb42cacbe8'
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
