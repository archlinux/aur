# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=cloud-sql-proxy
pkgver=2.22.1
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache-2.0)
depends=(fuse3)
makedepends=(
  git
  go
)
if [[ ${_build_debug_enabled} == false ]]; then
  options+=(!debug)
fi
source=(${pkgname}::git+${url}.git#tag=v${pkgver})
b2sums=('ae39f46c5bf33cee35bb3ca07d36745b598409f0c64f534c41be11629d154e8a20515edfca1e35b4e223085edc1b9b5a032aa8cb91d89d7c2d699cec27ee8156')

prepare() {
  cd ${pkgname}

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
  cd ${pkgname}

  local -a _goflags
  _goflags=(
    -buildmode=pie
    -mod=vendor
    -modcacherw
  )

  local -a _ldflags
  _ldflags=(
    -X=main.versionString=v${pkgver}
    -linkmode=external
  )

  if [[ ${_build_debug_enabled} == false ]]; then
    _goflags+=(
      -trimpath
    )
    _ldflags+=(
      -s
      -w
    )
  else
    _ldflags+=(
      -compressdwarf=false
    )
  fi

  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="${_goflags[*]}"

  go build \
    -v \
    -ldflags "${_ldflags[*]}" \
    -o out/${pkgname} \
    .
}

package() {
  cd ${pkgname}

  install -Dm755 -t "${pkgdir}"/usr/bin \
    out/${pkgname}

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
