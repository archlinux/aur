pkgbase=watchdog-ddns
pkgname=("${pkgbase}-server" "${pkgbase}-client")
pkgver=1.3.1
pkgrel=1
pkgdesc='开箱即用的可常驻 Dynamic DNS 客户端，现已支持 DNSPod 阿里云 Cloudflare，支持网卡 IP'
arch=('any')
url="https://github.com/yzy613/${pkgbase}"
license=('Apache')
makedepends=('go')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/yzy613/${pkgbase}/archive/v${pkgver}.tar.gz"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service")
sha256sums=('19cc69ae3c27a7862d2eafa92e95c0bb6c9171a4e9ef76580f38dea289c088ab'
            'e5d1cd8822d45ed8586ca23f8f893fda6636171c9109341e05816355089237bc'
            '245e4aa6bb204ca0cecef5d3e22643935d187dca068bb23562f604f3277ae5ed')

prepare(){
  cd "$pkgbase-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgbase-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-w -s" \
    -o build  \
    ./main-code/client/watchdog-ddns-client.go

  go build \
    -ldflags "-w -s" \
    -o  build  \
    ./main-code/server/watchdog-ddns-server.go
}

packaging() {
  # binary
  install -Dm755 build/${1} ${pkgdir}/usr/bin/${1}

  # conf
  install -dm 755 ${pkgdir}/etc/${pkgbase}
  ${pkgdir}/usr/bin/${1} -init 0123 -conf_path ${pkgdir}/etc/${pkgbase}/

  # systemd service
  install -Dm644 ${srcdir}/${1}.service ${pkgdir}/usr/lib/systemd/system/${1}.service
}

package_watchdog-ddns-server() {
  cd "$pkgbase-$pkgver"
  
  backup=('etc/watchdog-ddns/server.json')
  
  packaging $pkgname
}
package_watchdog-ddns-client() {
  cd "$pkgbase-$pkgver"

  backup=('etc/watchdog-ddns/client.json'
          'etc/watchdog-ddns/alidns.json'
          'etc/watchdog-ddns/cloudflare.json'
          'etc/watchdog-ddns/dnspod.json')

  packaging $pkgname
}

# vim: set sw=2 ts=2 et:
