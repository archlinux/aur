# Maintainer: VCalV
pkgname=prometheus-postfix-exporter-hsn723
pkgver=0.16.1
pkgrel=1
pkgdesc='Prometheus Postfix exporter (Hsn723 fork)'
arch=('x86_64')
url="https://github.com/Hsn723/postfix_exporter"
license=('Apache-2.0')
makedepends=('go' 'systemd')
backup=('etc/conf.d/prometheus-postfix-exporter')
provides=('prometheus-postfix-exporter')
conflicts=('prometheus-postfix-exporter')
depends=('glibc')
source=(
    "${pkgname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/postfix_exporter-$pkgver.tar.gz"
    "prometheus-postfix-exporter.service" 
    "prometheus-postfix-exporter.conf"
)
sha512sums=('449aec25d8353d9d05e3351be5446342cb04a2fe6eb59f00814e7032f3331c48ae9a01103b1a046faaaf9e4e21b792d45c67be86ed13153c19840e22198af622'
            'b6e8c9b7d322609309f3251c5f1d18daabc9c7c5f89a744c091a87d210b73968ae025d38d5a0aeede8241a408188ffca09fb99aaf01ba9e43906a5bea7043f01'
            '5e530fb2f8a0a83c6b5c51e226427de307719465566da6eb7622118e559909579e1940b6f12cb83ef21d8bc415a90894e808fdac8d1dd10f031b37f5c02661c7')
options=('strip')

prepare(){
  mkdir -p build/
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  #cd "postfix_exporter-$pkgver"
  go test ./...
}

package() {
  install -Dm755 build/postfix_exporter "$pkgdir"/usr/bin/'prometheus-postfix-exporter'
  install -Dm644 prometheus-postfix-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-postfix-exporter.service
  install -Dm644 prometheus-postfix-exporter.conf "$pkgdir"/etc/conf.d/prometheus-postfix-exporter
}

