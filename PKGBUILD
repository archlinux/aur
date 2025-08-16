# Maintainer: Brody <archfan at brodix dot de>

pkgname=protoc-gen-connect-go
_pkgname=connect-go
pkgver=1.18.1
pkgrel=1
pkgdesc='Protoc plugin to generate Go code'
arch=(x86_64)
url=https://connectrpc.com/
_ghurl=https://github.com/connectrpc/${_pkgname}
license=(Apache-2.0)
depends=(glibc)
makedepends=(
  git
  go
)
options=(!debug)
source=(${_pkgname}::git+${_ghurl}.git#tag=v${pkgver})
sha256sums=('71ace32118a07e53ae5609c6095d4ce052dd2bf77237f46625585644abf0dfa7')

prepare() {
  cd ${_pkgname}

  export GOFLAGS='-mod=readonly'

  rm -rf out

  go clean \
    -modcache
  go mod tidy -v
  go mod vendor -v
  go mod verify
}

build() {
  cd ${_pkgname}

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
    ./cmd/${pkgname}
}

package() {
  cd ${_pkgname}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/${pkgname}

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.md

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
