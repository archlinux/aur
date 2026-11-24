# Maintainer: fuero <fuerob@gmail.com>
pkgname=wsmancer
# renovate: datasource=github-releases depName=sresarehumantoo/wsmancer
pkgver=0.2.1
pkgrel=1
pkgdesc='PSRP-native WinRM shell'
arch=('x86_64')
url='https://github.com/sresarehumantoo/wsmancer'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18cdc29d8047a516a6c366518fae9a33a553cdef418560894446e22f77bb6bf7')
license=('LGPL-3.0-only')
depends=('glibc')
makedepends=('go-pie' 'git')
conflicts=("${pkgname}-git")
provides=("${pkgname}")

build() {
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    Date="$(date -u +%Y%m%d.%H%M%S)"
    Commit="${_commit:?}"
    Version="v${pkgver}"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v -buildvcs=false"
  export GO111MODULE=on

  cd "${pkgname}-${pkgver}"
  go build \
    -ldflags="${_x[*]/#/-X=main.} -compressdwarf=false -linkmode external" \
    -o bin/ \
    "./cmd/${pkgname//-/_}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "bin/${pkgname//-/_}" "${pkgdir}/usr/bin/${pkgname}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
