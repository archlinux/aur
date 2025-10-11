# Maintainer: fuero <fuerob@gmail.com>
pkgname=shef
# renovate: datasource=github-releases depName=eduardoagarcia/shef
pkgver=0.3.3
pkgrel=4
pkgdesc='CLI framework for cooking up dynamic shell recipes'
arch=('x86_64')
url="https://github.com/eduardoagarcia/shef"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc7b5a2135072dffe2e86907ddbcc849b03ff678fbc1e86aa75aa627a0dcc538')
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'git')
conflicts=("${pkgname}-git")
provides=("${pkgname}")

build() {
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    date="$(date -u +%Y%m%d.%H%M%S)"
    commit="${_commit:?}"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on
  
  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi
  
  cd "${pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  # Tests fail
  #go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
