# Maintainer: agony <27015 at riseup dot net>

pkgname=krakend
pkgver=3.0.3
pkgrel=1
pkgdesc='High-performance, stateless, declarative API gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/krakend/krakend-ce'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
backup=('etc/krakend/krakend.json')
install=krakend.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'krakend.sysusers')
sha256sums=('ee444b0267929e56d4aa561bd7a442c90427550438c4b348e43f94ad37ec01ff'
            '6710405313f2e37386f5299581058a0ba5e14bd800262a04759c0faa98e48c08')

prepare() {
  cd "krakend-ce-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "krakend-ce-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  local _lura='github.com/luraproject/lura/v3/core'
  go build -v -ldflags="-linkmode=external -X ${_lura}.KrakendVersion=${pkgver} -X ${_lura}.GlibcVersion=$(sh find_glibc.sh)" \
    -o krakend ./cmd/krakend-ce
}

check() {
  cd "krakend-ce-${pkgver}"
  # The integration tests bind ports 8080 and 8081 and fetch a feed from showrss.info
  ./krakend check -c krakend.json
}

package() {
  cd "krakend-ce-${pkgver}"
  install -Dm755 krakend -t "${pkgdir}/usr/bin"
  install -Dm644 krakend.json -t "${pkgdir}/etc/krakend"
  install -Dm644 builder/files/krakend.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/krakend.sysusers" "${pkgdir}/usr/lib/sysusers.d/krakend.conf"
}
