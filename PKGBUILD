# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgbase=ddns-watchdog
pkgname=("${pkgbase}-server" "${pkgbase}-client")
pkgver=1.5.3
pkgrel=1
pkgdesc='简单快速的可常驻的 Dynamic DNS 客户端，自动更新域名解析记录值'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/yzy613/ddns-watchdog"
license=('Apache')
makedepends=('go')
replaces=('watchdog-ddns')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service")
sha256sums=('ce50e52aadea3e6faf1967dcac8eeea42450e525d486b5bcc7edd0294d791099'
            '61a4ffbfa76731c06b4c1744f3b5eb00f39009af0913f135670e1f7cc05aa9fe'
            '2ba36324b6b433d0256e097f990386d43b638358835d7cbbcca5e00cb890b1dc')

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

  # server
  go build \
    -ldflags "-w -s" \
    -o build/${pkgname[1]}  \
    ./cmd/${pkgname[1]}/main.go

  # client
  go build \
    -ldflags "-w -s" \
    -o  build/${pkgname[0]}  \
    ./cmd/${pkgname[0]}/main.go
}

packaging() {
  # binary
  install -Dm755 build/${1} ${pkgdir}/usr/bin/${1}

  # config 
  install -dm 755 ${pkgdir}/etc/${pkgbase}
  ${pkgdir}/usr/bin/${pkgname} -i ${2} -c ${pkgdir}/etc/${pkgbase}/
  
  # systemd service
  install -Dm644 ${srcdir}/${1}.service ${pkgdir}/usr/lib/systemd/system/${1}.service
}

package_ddns-watchdog-server() {
  cd "$pkgbase-$pkgver"
  
  backup=("etc/${pkgbase}/server.json")
  
  packaging $pkgname
}

package_ddns-watchdog-client() {
  cd "$pkgbase-$pkgver"

  backup=("etc/${pkgbase}/client.json"
          "etc/${pkgbase}/alidns.json"
          "etc/${pkgbase}/cloudflare.json"
          "etc/${pkgbase}/dnspod.json")

  packaging $pkgname 0123
}

# vim: set sw=2 ts=2 et:
