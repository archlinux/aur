# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=temporal-cli
pkgver='0.11.0'
pkgrel=1
pkgdesc='CLI for running Temporal Server and interacting with various parts of Temporal'
arch=('x86_64')
url='https://github.com/temporalio/cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8a6fdb05523d224d383d56f950a789de3632d48421fea4cb80125afaddd59aba327d026105370ac457d3e136a08e596c9ee683dde35f0d4c4f01c3e77dc51098')

build() {
  cd "cli-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-linkmode=external -X github.com/temporalio/cli/headers.Version=${pkgver}" \
    -o dist/ \
    ./cmd/...

  ./dist/temporal completion bash > temporal.bash
  ./dist/temporal completion zsh > temporal.zsh

  ./dist/docgen
}

package() {
  cd "cli-$pkgver"

  install -Dm755 ./dist/temporal -t "${pkgdir}/usr/bin"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r ./docs/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 temporal.bash "${pkgdir}/usr/share/bash-completion/completions/temporal"
  install -Dm644 temporal.zsh "${pkgdir}/usr/share/zsh/site-functions/_temporal"
}
