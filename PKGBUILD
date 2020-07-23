# Maintainer: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.1.2
pkgrel=1
pkgdesc='Helm plugin that shows a diff explaining what a helm upgrade would change'
arch=('x86_64')
url='https://github.com/databus23/helm-diff'
license=('Apache')
install=helm-diff.install
depends=('helm')
# `go mod init` wants git
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2cab1494bb9f19bc1efe2b0c0d774c424990b3b75626867ac92958232ea7013d')

prepare() {
  cd "${pkgname}-${pkgver}"
  # fails when go.mod present from previous run
  [[ ! -f go.mod ]] && go mod init github.com/databus23/helm-diff
  # go mod init didn't catch stretchr/testify
  go mod edit -require github.com/stretchr/testify@v1.5.1
  # `go mod download` fails to get all required modules and `go build -mod=readonly` fails
  go mod tidy
  sed -i '/^hooks:$/Q' plugin.yaml
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o bin/diff -ldflags "-X github.com/databus23/helm-diff/cmd.Version=${pkgver}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  # /usr/lib/helm/plugins is my own choice and not a standard. feedback welcome
  install -Dm755 bin/diff -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
