# Maintainer: fuero <fuerob@gmail.com>
pkgname=netpol-analyzer
# renovate: datasource=github-releases depName=np-guard/netpol-analyzer
pkgver=1.4.4
pkgrel=2
pkgdesc='CLI for analyzing k8s connectivity-configuration resources'
arch=('x86_64')
url="https://github.com/np-guard/netpol-analyzer"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d7bd27a145d2875bc2b219dc88e139bfca2e00354ec7bd918573dc50f1bcba2')
license=('Apache-2.0')
depends=('glibc')
makedepends=('go-pie' 'git')

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
    "./cmd/netpolicy"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./... || true
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 bin/netpolicy "${pkgdir}/usr/bin/${pkgname}"
  bin/netpolicy completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  bin/netpolicy completion zsh \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  bin/netpolicy completion fish \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
