# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=temporal-cli
pkgver='1.8.0'
pkgrel=1
pkgdesc='CLI for running Temporal Server and interacting with various parts of Temporal'
arch=('x86_64')
url='https://github.com/temporalio/cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/temporalio/cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7fd91ca0d9ea2b39aea5b289aa6717ea4f6ba8a9c0acd1e19fd722d58b3749a71a6e4c9bc973327e3baa66c5bbb9ca0a324eaf7706752a9b16ff9835d336d1b8')

build() {
  cd "cli-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X github.com/temporalio/cli/temporalcli.Version=${pkgver} -buildid=" \
    -o dist/ \
    ./cmd/...

  ./dist/temporal completion bash > temporal.bash
  ./dist/temporal completion zsh > temporal.zsh
}

package() {
  cd "cli-${pkgver}"

  install -Dm755 ./dist/temporal -t "${pkgdir}/usr/bin"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 temporal.bash "${pkgdir}/usr/share/bash-completion/completions/temporal"
  install -Dm644 temporal.zsh "${pkgdir}/usr/share/zsh/site-functions/_temporal"
}
