# Maintainer: fuero <fuerob@gmail.com>
pkgname=ls-lint
# renovate: datasource=github-releases depName=loeffel-io/ls-lint
pkgver=2.3.1
pkgrel=2
pkgdesc='directory and filename linter'
arch=('x86_64')
url="https://github.com/loeffel-io/ls-lint"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea6b53fb2bf13055e1cd5eb4aeeddc883044e859a617adebd1802181cdb44b14')
license=('MIT')
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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
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
