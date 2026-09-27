# Maintainer: snowseven <snowseven at tuta dot io>
pkgname=jellyrpc
pkgver=0.3.0
pkgrel=1
pkgdesc="simple jellyfin discord rpc daemon"
arch=('x86_64')
url="https://github.com/snowmoe/jellyrpc"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c20a4240e30eb5c5698f8e950a062813ced66c73f28e704cb5c4e7e3c60fc6b9')

prepare() {
  cd "${pkgname}-${pkgver}"

  # upstream service points at the `make install` location
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/jellyrpc|' jellyrpc.service
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags="-linkmode=external -X main.gitVersion=v${pkgver}" -o jellyrpc .
}

check() {
  cd "${pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 jellyrpc "${pkgdir}/usr/bin/jellyrpc"
  install -Dm644 jellyrpc.service "${pkgdir}/usr/lib/systemd/user/jellyrpc.service"
  install -Dm644 config.example "${pkgdir}/usr/share/doc/jellyrpc/config.example"
  install -Dm644 readme.md "${pkgdir}/usr/share/doc/jellyrpc/readme.md"
}
