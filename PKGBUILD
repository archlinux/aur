# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=temporal-cli
pkgver='1.8.2'
pkgrel=1
pkgdesc='CLI for running Temporal Server and interacting with various parts of Temporal'
arch=('x86_64')
url='https://github.com/temporalio/cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/temporalio/cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('dfe9054694cdd1c7f477d7e41748605a23f1b4291a7d866fedb981700cb1a2889316ac3b880fe4c2d2f8cabc7e24a34306c0665f3f8c28d5a938e8c64d140e9c')

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
