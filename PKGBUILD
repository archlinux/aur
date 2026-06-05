# Maintainer: Brody <archfan at brodix dot de>

pkgname=protoc-gen-connect-go
_pkgname=connect-go
pkgver=1.20.0
pkgrel=1
pkgdesc='Protoc plugin to generate Go code'
arch=(x86_64)
url=https://connectrpc.com/
license=(Apache-2.0)
depends=(glibc)
makedepends=(
  git
  go
)
options=(!debug)
_ghurl=https://github.com/connectrpc/${_pkgname}
source=(${_pkgname}::git+${_ghurl}.git#tag=v${pkgver})
sha256sums=('86523e5f55e0935ff8ceba0eacb77ed282aff918fe5faa59d9c54fe32e38f4a7')

prepare() {
  cd ${_pkgname}

  local -a _goflags
  _goflags=(
    -mod=readonly
  )

  export GOFLAGS="${_goflags[*]}"

  rm -rf out

  go clean \
    -modcache
  go mod tidy -v
  go mod vendor -v
  go mod verify
}

build() {
  cd ${_pkgname}

  local -a _goflags
  _goflags=(
    -buildmode=pie
    -trimpath
    -mod=vendor
    -modcacherw
  )

  local -a _ldflags
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
  export GOFLAGS="${_goflags[*]}"

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
