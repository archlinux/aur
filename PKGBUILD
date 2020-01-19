# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=prometheus-remo-exporter
pkgver=0.6.0
pkgrel=2
pkgdesc="Prometheus Nature Remo Exporter"
arch=('x86_64')
url="https://github.com/kenfdev/remo-exporter"
license=('unknown')
makedepends=('go-pie' 'dep')
backup=('etc/conf.d/prometheus-remo-exporter')
source=(
  "prometheus-remo-exporter.service"
  "confd"
  "https://github.com/kenfdev/remo-exporter/archive/v${pkgver}.tar.gz"
)

prepare() {
  mkdir -p gopath/src/github.com/kenfdev
  ln -rTsf "remo-exporter-$pkgver" gopath/src/github.com/kenfdev/remo-exporter
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/kenfdev/remo-exporter
  dep ensure
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/kenfdev/remo-exporter

  go build \
      -trimpath \
      -ldflags "-extldflags $LDFLAGS" \
      -o prometheus-remo-exporter .
}

package() {
  cd "remo-exporter-$pkgver"
  install -Dm0755 prometheus-remo-exporter "${pkgdir}/usr/bin/prometheus-remo-exporter"
  install -Dm0644 "${srcdir}/prometheus-remo-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-remo-exporter.service"
  install -Dm0600 "${srcdir}/confd" "${pkgdir}/etc/conf.d/prometheus-remo-exporter"
}
sha256sums=('67e6c571a5fd3ce5976000174fc192ee593efe1138ee2d69ac53a8648de57768'
            '99fc228ee0df5acf136467a7200e056628aa92d55795ee57b982753bcb6105e3'
            'fb47bb6ef0ecb7e3437092bee9e001a71d550d99df372cfb47732785c2a2690b')
sha512sums=('cbc798a97a7e8d4319bc35bdc7f330ebb9a8f6887f7c4a6ed2297008ba1c4b2aa3ffd7fa91b2a1559731bd2e513e3058259937f495d2b80bf5ad91bbf647478d'
            'dfd37357bbed68855309044a275429c538d150c6cfce9e780f1126ed1aa1399101f983f1a3ff046aec0e5c827a5f06f0b27f7c98c881acd1d056e8f064b77425'
            '5c9fbbf542ae460f5fa2c3fbdc78eb0c3caa4810c3d44889c88de8114292c72a554d3172f04763f100016eca65389c8242901d58a8a38cc6d975ae5e11cf9be0')
