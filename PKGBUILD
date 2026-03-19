# Maintainer: Brody <archfan at brodix dot de>

# build debugging stuff or not
: ${_build_debug_enabled:=false}

pkgname=cloud-sql-proxy
pkgver=2.21.2
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
b2sums=('1acd275d353c92f0c5ec1d4bb75de8a8ec4d0966c62192708ee622597f2928c6f9459bd31aeb5346c696d5033318cb15d1790585256dba706d4a04d5b0a3e650')

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

  local -a _ldflags
  _ldflags=(
    -X=main.versionString=v${pkgver}
    -linkmode=external
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
