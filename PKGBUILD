# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=cloud-sql-proxy
pkgver=2.18.0
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache-2.0)
depends=(fuse3)
makedepends=(go)
if [[ ${_build_debug_enabled} == false ]]; then
  options+=(!debug)
fi
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('87aa41f0e15144f2b32e84f8172cd8fda7221c812c75800d33db44c2390eb76c2b2c477bb85b1e59f1a03b1f02ce422d7165b8531f39f2dca1b5a5132face9af')

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
    -X=main.versionString=v${pkgver}
    -linkmode=external
  )
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
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

  go build \
    -v \
    -ldflags "${_ldflags[*]}" \
    -o out/${pkgname} \
    .
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/${pkgname}

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
