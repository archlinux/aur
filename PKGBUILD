# Maintainer: 9R <aur [at] 9-r [dot] net>

pkgname=prometheus-mumble-exporter
pkgver=1.0.1
pkgrel=1
pkgdesc='Prometheus Mumble Exporter'
arch=('x86_64')
url='https://github.com/mguentner/mumble_exporter'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('grafana: use the webhook with Grafana alerts'
            'prometheus: use the webhook with Prometheus')
backup=('etc/conf.d/prometheus-mumble-exporter')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mguentner/mumble_exporter/archive/refs/tags/${pkgver}.tar.gz"
        "prometheus-mumble-exporter.service"
        "prometheus-mumble-exporter"
        )
sha256sums=('4c9c2e9d1e0e9c24f05bfcd6ff339fafc00e98c84b53ca02959ab24b756cfd80'
            '8f7d795c625dda82c2b2bc6f0a45fd3319d9ea264fc3996f2090e3f67265fcd1'
            'e6651a64bf5367b71aba36e90bcd68c4367808f1da7418eaa47d15d92c8d3987'
)

#pkgver() {
#  cd "${pkgname}"
#  git describe --tags --long | sed s/-/_/g
#}

#prepare() {
#  patch -p1 ${pkgname}/xmpp-webhook.service xmpp-webhook.service.patch
#}

build() {
  cd mumble_exporter-${pkgver} 

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"
  go build -v -o prometheus-mumble-exporter .
}

package() {
  cd mumble_exporter-${pkgver} 
  install -Dm0755 prometheus-mumble-exporter "$pkgdir/usr/bin/prometheus-mumble-exporter"

  install -Dm0644 "$srcdir/prometheus-mumble-exporter.service" \
    "$pkgdir/usr/lib/systemd/system/prometheus-mumble-exporter.service"
  install -Dm0644 "$srcdir/mumble_exporter-${pkgver}/LICENSE" \
    "$pkgdir/usr/share/licenses/prometheus-mumble-exporter/LICENSE"
  install -Dm0644 "$srcdir/prometheus-mumble-exporter" \
    "$pkgdir/etc/conf.d/prometheus-mumble-exporter"
}

# vim: ts=2 sw=2 et:

