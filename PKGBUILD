pkgbase=watchdog-ddns
pkgname=("${pkgbase}-server" "${pkgbase}-client")
pkgver=1.2.0
pkgrel=1
pkgdesc='开箱即用的可常驻 Dynamic DNS 客户端，现已支持 DNSPod 阿里云 Cloudflare，支持网卡 IP'
arch=('any')
url="https://github.com/yzy613/${pkgbase}"
license=('Apache')
makedepends=('go')
provides=("$pkgbase"-git "$pkgbase"-bin)
conflicts=("$pkgbase"-git "$pkgbase"-bin)
backup=('etc/watchdog-ddns/conf/client.json' 'etc/watchdog-ddns/conf/server.json')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/yzy613/${pkgbase}/archive/v${pkgver}.tar.gz"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service")
sha256sums=('ab15035d8189c89afb89af65c649db71e4972498244d2704f49ca5fa7219bb22'
            '716b1ef0bb2ec291b2abebf0b638c92b5c4155de1254740176ce24c8c3d2ac77'
            '1450f602fae151903290374b717ecc08d34da0df17f0ad161f902d736b91da33')

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

package_watchdog-ddns-server() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/${pkgname} "$pkgdir"/usr/bin/${pkgname}

  install -dm 755 ${pkgdir}/etc/${pkgbase}/conf
  touch ${pkgdir}/etc/${pkgbase}/conf/server.json

  install -dm 755 ${pkgdir}/usr/lib/systemd/system
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
package_watchdog-ddns-client() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/${pkgname} "$pkgdir"/usr/bin/${pkgname}

  install -dm 755 ${pkgdir}/etc/${pkgbase}/conf
  touch ${pkgdir}/etc/${pkgbase}/conf/client.json


  install -dm 755 ${pkgdir}/usr/lib/systemd/system
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

# vim: set sw=2 ts=2 et:
