# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgbase=ddns-watchdog
pkgname=("${pkgbase}-server" "${pkgbase}-client")
pkgver=1.3.3
pkgrel=1
pkgdesc='开箱即用的可常驻 Dynamic DNS 客户端，现已支持 DNSPod 阿里云 Cloudflare，支持网卡 IP'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/yzy613/${pkgbase}"
license=('Apache')
makedepends=('go')
provides=('watchdog-ddns' "${pkgname}-git")
conflicts=('watchdog-ddns' "${pkgname}-git")
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/yzy613/${pkgbase}/archive/v${pkgver}.tar.gz"
        "${pkgname[0]}.service"
        "${pkgname[1]}.service")
sha256sums=('5f19bf90143d060cc65fe82fd86c5f0721401d83abdc8f3123e479eff670d0df'
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
    ./main-code/client/${pkgname[1]}.go

  go build \
    -ldflags "-w -s" \
    -o  build  \
    ./main-code/server/${pkgname[0]}.go
}

packaging() {
  # binary
  install -Dm755 build/${1} ${pkgdir}/usr/bin/${1}

  # config 
  install -dm 755 ${pkgdir}/etc/${pkgbase}
  ${pkgdir}/usr/bin/${pkgname} -init ${2} -conf_path ${pkgdir}/etc/${pkgbase}/
  
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
