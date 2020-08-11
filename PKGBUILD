pkgbase=watchdog-ddns
pkgname=("${pkgbase}-server" "${pkgbase}-client")
pkgver=1.1.0
pkgrel=1
pkgdesc='开箱即用的 Dynamic DNS 客户端，现已支持 DNSPod 阿里云 Cloudflare，支持网卡 IP'
arch=('any')
url="https://github.com/yzy613/${pkgname}"
license=('Apache')
makedepends=('go')
provides=("$pkgbase"-git "$pkgbase"-bin)
conflicts=("$pkgbase"-git "$pkgbase"-bin)
backup=('etc/watchdog-ddns/conf/client.json' 'etc/watchdog-ddns/conf/server.json')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/yzy613/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('786ea066e14f3a302eb794f11d3005cca2a5982879dd6e810c4e81fa8456caf6')

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
	./main-code/client/ddns-client.go

  go build \
  	-ldflags "-w -s" \
	-o  build  \
	./main-code/server/ddns-server.go
}

package_watchdog-ddns-server() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/ddns-server "$pkgdir"/usr/bin/ddns-server

  install -dm 755 ${pkgdir}/etc/${pkgbase}/conf
  touch ${pkgdir}/etc/${pkgbase}/conf/server.json
}
package_watchdog-ddns-client() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/ddns-client "$pkgdir"/usr/bin/ddns-client

  install -dm 755 ${pkgdir}/etc/${pkgbase}/conf
  touch ${pkgdir}/etc/${pkgbase}/conf/client.json
}
