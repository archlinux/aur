# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>

pkgname=telegraf
pkgver=1.29.3
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
b2sums=('759a62783b4bcdd59aec796ba2f0b7945905f52dd14f40ed2c9d4e9cb59547942e12b07007bf9532d5b27b9017d0b4bc8ea2a8ab233aa43a449e64a47fd86efb'
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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.goos=$(go env GOOS) -X main.goarch=$(go env GOARCH) -X main.version=${pkgver} -X main.branch=tag-${pkgver} -X main.commit=tag-${pkgver} -extldflags ${LDFLAGS}"
  go build -o build -ldflags="${_LDFLAGS}" "./cmd/telegraf"
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/build/telegraf" \
    "${pkgdir}/usr/bin/telegraf"

  # configuration files
  install -dD -m755 "${pkgdir}/etc/telegraf/telegraf.d"
  "${srcdir}/${pkgname}-${pkgver}/build/telegraf" -sample-config > \
    "${pkgdir}/etc/telegraf/telegraf.conf"

  # license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # service
  install -D -m644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
