# Maintainer: fuero <fuerob@gmail.com>
pkgname=gonzo
# renovate: datasource=github-releases depName=control-theory/gonzo
pkgver=0.3.1
pkgrel=2
pkgdesc='TUI log analysis tool'
arch=('x86_64' 'aarch64')
url=https://github.com/control-theory/gonzo
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1d00faee039d632e0fbe264550ade3e829c66a2be589ec4f098fb2577d22e6bf5aaa258de3ffb96b080bfdbf6d102316878230ddd21cc895d0257e3767ca75df')
b2sums=('fabf02d1230eeee0347dffa958f7801d166507d0ce434e3891285f6a9fb6ad99c322ffc64aa56663131360c4e2739e10003dc73b1e409a2ccefc7b434ab7f83f')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    buildTime="$(date -u +%Y%m%d.%H%M%S)"
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
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
