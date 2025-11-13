# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=temporal-cli
pkgver='1.5.1'
pkgrel=1
pkgdesc='CLI for running Temporal Server and interacting with various parts of Temporal'
arch=('x86_64')
url='https://github.com/temporalio/cli'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!debug')
source=("${pkgname}-${pkgver}::git+https://github.com/temporalio/cli.git#tag=v${pkgver}")
b2sums=('d5b00df9253323738d14e67d2009f2d28944abaf170692e78a763881511c19cee214869b25fb975eff620bfe50b06dc97aea3cd86df1f92be1f6f2b6eceae3a6')

build() {
  cd "${pkgname}-${pkgver}"

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
  cd "${pkgname}-${pkgver}"

  install -Dm755 ./dist/temporal -t "${pkgdir}/usr/bin"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 temporal.bash "${pkgdir}/usr/share/bash-completion/completions/temporal"
  install -Dm644 temporal.zsh "${pkgdir}/usr/share/zsh/site-functions/_temporal"
}
