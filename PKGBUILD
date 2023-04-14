# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=newrelic-cli
pkgver=0.67.0
pkgrel=1
pkgdesc="The New Relic Command Line Interface"
arch=(x86_64)
url=https://github.com/newrelic/newrelic-cli
license=(Apache)
depends=(glibc)
makedepends=(go git)
source=(git+https://github.com/newrelic/${pkgname}.git#tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd newrelic-cli
  export GOPATH="${srcdir}/gopath"
  go mod vendor
}

build() {
  cd newrelic-cli

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"

  export GOPATH="${srcdir}/gopath"

  go build \
    -o bin/newrelic \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\" -X main.appName=newrelic-cli -X main.version=v${pkgver} -X github.com/newrelic/newrelic-cli/internal/client.version=v${pkgver}" \
    cmd/newrelic/*
}

package() {
  cd newrelic-cli
  install -Dm0755 bin/newrelic "$pkgdir/usr/bin/newrelic"

  "${pkgdir}/usr/bin/newrelic" completion --shell bash | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/newrelic"
  "${pkgdir}/usr/bin/newrelic" completion --shell zsh | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_newrelic"
}

# vim: set ts=2 sw=2 et:
