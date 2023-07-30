# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot net>

pkgname=temporal-cli
pkgver='0.10.4'
pkgrel=1
pkgdesc='CLI for running Temporal Server and interacting with various parts of Temporal'
arch=('x86_64')
url='https://github.com/temporalio/cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0ec4ebb2c0d15146b894f4732b0ddd8a759782ef36694dcfa6760505006a4070473c65a904ff72c06004646f3a1d0b68d4b5e9790d38e5fbf0644352f378d549')

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
