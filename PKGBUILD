# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38
pkgver=1.37.0
pkgrel=1
pkgdesc='An in-memory geolocation data store, spatial index, and realtime geofencing server'
arch=(x86_64 armv7h aarch64)
url='https://tile38.com'
license=('MIT')
depends=(ca-certificates)
makedepends=(git go)
source=("git+https://github.com/tidwall/tile38#tag=${pkgver}")
sha256sums=('42bdc4c7d39c692e64355c4b33e911209289f57c3b6d8c8c34678959926f8cdb')

prepare() {
  cd "${pkgname}"

  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${pkgname}"

  export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
  export _LDFLAGS="${_LDFLAGS} -bindnow"
  export _LDFLAGS="${_LDFLAGS} -X github.com/tidwall/tile38/core.Version=${pkgver}"
  export _LDFLAGS="${_LDFLAGS} -X github.com/tidwall/tile38/core.GitSHA=${sha256sums[0]:0:7}"
  export _LDFLAGS="${_LDFLAGS} -X github.com/tidwall/tile38/core.BuildTime=$(date -u +'%Y-%m-%dT%H:%M:%SZ' --date=@${SOURCE_DATE_EPOCH})"
  export GOPATH="${srcdir}"

  core/gen.sh
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "${_LDFLAGS}" \
    -o build \
    ./...
}

check() {
  cd "${pkgname}"
  go test ./...
}

package() {
  cd "${pkgname}"

  install -Dm755 build/tile38-cli "${pkgdir}/usr/bin/tile38-cli"
  install -Dm755 build/tile38-server "${pkgdir}/usr/bin/tile38-server"
  install -Dm755 build/tile38-benchmark "${pkgdir}/usr/bin/tile38-benchmark"
  install -Dm755 build/tile38-luamemtest "${pkgdir}/usr/bin/tile38-luamemtest"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
