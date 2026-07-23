# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>

pkgname=telegraf
pkgver=1.39.2
pkgrel=1
pkgdesc='Plugin-driven server agent for reporting metrics into InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://influxdb.org/'
license=('MIT')
depends=('glibc')
optdepends=('smartmontools: for S.M.A.R.T. Input Plugin'
            'nvme-cli: for S.M.A.R.T. Input Plugin (NVMe devices)')
makedepends=('go' 'git')
options=('!lto')
backup=('etc/telegraf/telegraf.conf')
install="${pkgname}.install"
source=("https://github.com/influxdata/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}-nvme.rules")
b2sums=('75b5428719b17ae4db19c273e4fe13d3d76dde999bef6274efffdd17bb3fb2ad509ca9777d2175af83fd45a158bdb525b9ebe46a02fd40e457b2c842597ba939'
        'a6b2fd7a688ef5a23539c1256380a6389e6fa474312ad9dee5cc77bcfabe92910a8913ffcf599c940a93bb3a5c89e01f3bedad4176f4d57dd33a68e0499c30bd'
        '5e38b02b765eef0895b83999a743562f84e4d19ebdb0788f1fb2a2df1015fb45fc7192dd0452480f5e8ac6f1f5c4184d19a081635daa4b9d10815ba66b6a9a29'
        '00bd347eafd81eda1739c5e52e770d9800464d8bb0e85c1b6b2ad9f774ec93e90cd080f96c4ac65b6787a603939be6fa94f6315f202a34a04106e456b5bf4bb2')

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

  # udev rules
  install -dD -m755 "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/${pkgname}-nvme.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/20-${pkgname}-nvme.rules"

  # service
  install -D -m644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
