# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>

pkgname=telegraf
pkgver=1.37.0
pkgrel=1
pkgdesc='Plugin-driven server agent for reporting metrics into InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://influxdb.org/'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
backup=('etc/telegraf/telegraf.conf')
install="${pkgname}.install"
source=("https://github.com/influxdata/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        "${pkgname}.install"
        "${pkgname}.service")
b2sums=('257c190a367ba9ff65c1dcc3e6681aa4f9b9229362f1a9c23052d70fbfba6df80221d5693b8062d99e9200735e323bcf7cbec02c3b8e781d3e34a658cdcb6b02'
        'a6b2fd7a688ef5a23539c1256380a6389e6fa474312ad9dee5cc77bcfabe92910a8913ffcf599c940a93bb3a5c89e01f3bedad4176f4d57dd33a68e0499c30bd'
        'd5a6845cb1ddb07f0cac20215c15d059f0c18aa43a7b549e7e738e58b8686b4db26b71426aafc8e682d6fd6f676fc0f468f53ea61968c4184feaaa22a23f5bc5')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.goos=$(go env GOOS) -X main.goarch=$(go env GOARCH) -X main.version=${pkgver} -X main.branch=tag-${pkgver} -X main.commit=tag-${pkgver}"
  go build -o build -ldflags="${_LDFLAGS}" "./cmd/telegraf"
  # Workaround to prevent deadlock between systemd-nspawn and go when
  # generating configuration (thanks to Robin Candau)
  timeout 2s ./build/telegraf config > telegraf.conf || true
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/build/telegraf" \
    "${pkgdir}/usr/bin/telegraf"

  # configuration files
  install -dD -m755 "${pkgdir}/etc/telegraf/telegraf.d"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/telegraf.conf" \
    "${pkgdir}/etc/telegraf/telegraf.conf"

  # license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # service
  install -D -m644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
