# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=cloud-sql-proxy
pkgver=2.18.1
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
b2sums=('6f47243754ce13655722a7f44b9b7cab958f9857e4dd8cc904ea2c5cc36cd4b314bfee6484a70157f9c63be81d83d63d4c184ebaf88c6a10234747e362f00ede')

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
