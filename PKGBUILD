# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=cloud-sql-proxy
pkgver=2.25.3
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
b2sums=('fc5a6e11f792cc5585e604b5f4e26515624e1f092c32a0defaa4a278b29735f43a5197e86afcd7fb489c8467f83f389c1b260c5445bc44d7c6ce300cd9770b33')

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
