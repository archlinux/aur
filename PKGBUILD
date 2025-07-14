# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=directpv
pkgdesc='CSI driver for Direct Attached Storage'
pkgver=4.1.5
pkgrel=2
arch=(x86_64)
url=https://min.io/docs/directpv/
_url=https://github.com/minio/directpv
license=(AGPL-3.0-only)
depends=(glibc)
makedepends=(go)
if [[ ${_build_debug_enabled} == false ]]; then
  options+=(!debug)
fi
source=(${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz)
sha256sums=('c839ad53f97beeb9d1d521c9d0252aadf35f6138c2650453989b6c34a6294fd9')

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
  local _ldflags _binary _tags
  _ldflags=(
    -X=main.version=v${pkgver}
    -linkmode=external
  )
  _tags=(
    osusergo
    netgo
  )

  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -mod=vendor -modcacherw'

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
      -v \
      -ldflags="${_ldflags[*]}" \
      -tags="${_tags[*]}" \
      -o out/${_binary} \
      ./cmd/${_binary}
  done
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/{,kubectl-}${pkgname}
}

# vim: ts=2 sw=2 et:
