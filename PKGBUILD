# Maintainer: Brody <archfan at brodix dot de>

pkgname=protoc-gen-validate
pkgver=1.2.1
pkgrel=2
pkgdesc='Protoc plugin to generate polyglot message validators'
arch=(x86_64)
url=https://github.com/bufbuild/${pkgname}
license=(Apache-2.0)
depends=(glibc)
makedepends=(
  git
  go
)
provides=(${pkgname}-go)
options=(!debug)
source=(${pkgname}::git+${url}.git#tag=v${pkgver})
sha256sums=('968c62bd5446832b6f9b5fe640ceeb37f317729eda6e1d62dfbd832e4f679f60')

prepare() {
  cd ${pkgname}

  export GOFLAGS='-mod=readonly'

  rm -rf out

  go clean \
    -modcache
  go mod tidy -v
  go mod vendor -v
  go mod verify
}

build() {
  cd ${pkgname}

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
  cd ${pkgname}

  go test ./...
}

package() {
  cd ${pkgname}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/${pkgname}
  ln -sr "${pkgdir}"/usr/bin/${pkgname} \
    "${pkgdir}"/usr/bin/${pkgname}-go \

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.md

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
