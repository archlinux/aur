# Maintainer: Brody <archfan at brodix dot de>

pkgname=protoc-gen-validate
pkgver=1.2.1
pkgrel=1
pkgdesc='Protoc plugin to generate polyglot message validators'
arch=(x86_64)
url=https://github.com/bufbuild/protoc-gen-validate
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
options=(!debug)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('e4718352754df1393b8792b631338aa8562f390e8160783e365454bc11d96328')

prepare() {
  cd ${pkgname}-${pkgver}

  export GOFLAGS='-mod=readonly'

  rm -rf out

  go clean \
    -modcache
  go mod tidy -v
  go mod vendor -v
  go mod verify
}

build() {
  cd ${pkgname}-${pkgver}

  local _ldflags
  _ldflags=(
    -s
    -w
    -linkmode=external
  )

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -modcacherw'

  go build \
    -v \
    -ldflags "${_ldfags[*]}" \
    -o out/${pkgname} \
    .
}

check() {
  cd ${pkgname}-${pkgver}

  go test ./...
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/${pkgname}

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.md

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
