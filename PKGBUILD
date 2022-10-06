# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=mosdns
pkgver=4.4.2
pkgrel=1
pkgdesc="A DNS forwarder"
arch=('x86_64')
url="https://github.com/IrineSistiana/mosdns"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat')
backup=('etc/mosdns/config.yaml')
_tag=98670dd6457f81f76ef6cf1458e1e278e9e06daa # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}"
        "mosdns.service")
sha512sums=('SKIP'
            'c4defddfc87754b8dd105df080374ec32785c435b5a60fa60608e5e0b57eddd4aa6c5581daceba6dff6d84b8e0f4914db0ea09f0150aecee17e216379f7fcb62')

prepare() {
  mkdir -p "${pkgname}/build"
}

build() {
  cd "${pkgname}/build"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go run ../ config gen config.yaml
  go build -buildmode=pie -trimpath -ldflags="-linkmode external -s -w -X main.version=$(git describe --tags --long --always)" -mod=readonly -modcacherw -o mosdns ../
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "build/mosdns" "${pkgdir}/usr/bin/mosdns"
  install -Dm644 "build/config.yaml" "${pkgdir}/etc/mosdns/config.yaml"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/mosdns/LICENSE"
  install -Dm644 "${srcdir}/mosdns.service" "${pkgdir}/usr/lib/systemd/system/mosdns.service"
}
