# Maintainer: ml <ml@visu.li>
pkgname=krew
pkgver=0.3.4
pkgrel=3
pkgdesc='Plugin manager for kubectl command-line tool'
arch=('x86_64' 'aarch64' 'arm' 'arm6h' 'arm7h')
url='https://krew.sigs.k8s.io/'
license=('Apache')
depends=('kubectl')
makedepends=('git' 'go' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/krew/archive/v${pkgver}.tar.gz")
sha256sums=('dc96db650fb7f973a6a3fcf6ce35bb6ba1218bca9c3858459d5cacc2c321113c')
# see build(), check()
_commit=

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  local -a x=(
    sigs.k8s.io/krew/internal/version.gitCommit="${_commit:?}"
    sigs.k8s.io/krew/internal/version.gitTag="v${pkgver}"
  )

  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o . -ldflags "${x[*]/#/-X=}" ./cmd/{krew,validate-krew-manifest}
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 krew validate-krew-manifest -t "${pkgdir}/usr/bin"
}
