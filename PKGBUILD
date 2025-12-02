# Maintainer: fuero <fuerob@gmail.com>
pkgname=gonzo
# renovate: datasource=github-releases depName=control-theory/gonzo
pkgver=0.3.0
pkgrel=2
pkgdesc='TUI log analysis tool'
arch=('x86_64' 'aarch64')
url=https://github.com/control-theory/gonzo
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3babbc1492639a24e8fc5fe7df120a24d25c1605ee891c0f79ed1ef1f9a6bc1e098f95141357fb999849c292acdd40de8a93e66dd8fbb829585164d77c77677b')
b2sums=('13e7721ce008ffd29a32e20e09348305a242be0d4879941780efd9b910d3763bf979ddd8596c1c74995cde5ea0bf8a9e4668526105f7768cef18c24570ceaca0')

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
