# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=directpv
pkgdesc='MinIO DirectPV'
pkgver=4.1.4
pkgrel=2
arch=(x86_64)
url=https://min.io/docs/directpv/
license=(AGPL-3.0-only)
depends=(glibc)
makedepends=(go)
if [[ ${_build_debug_enabled} == false ]]; then
  options+=(!debug)
fi
source=(${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/minio/directpv/tar.gz/refs/tags/v${pkgver})
sha256sums=('1285f3766857bd170426f73e63aa76641630580108c52e3391f29f609815bdde')

prepare() {
  export GOPATH="${srcdir}"

  cd ${pkgname}-${pkgver}

  rm -rf out
  go clean -modcache
  go mod tidy
}


build() {
  local _flags _binary
  _flags=(
    -X=main.version=v${pkgver}
    -linkmode=external
  )

  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'

  if [[ ${_build_debug_enabled} == false ]]; then
    _ldflags+=(
      -s
      -w
    )
    export GOFLAGS+=' -trimpath'
  else
    _ldflags+=(
      -compressdwarf=false
    )
  fi

  cd ${pkgname}-${pkgver}

  for _binary in {,kubectl-}${pkgname}; do
    go build \
      -o out/${_binary} \
      -ldflags="${_flags[*]}" \
      ./cmd/${_binary}
  done
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/{,kubectl-}${pkgname}
}

# vim: ts=2 sw=2 et:
