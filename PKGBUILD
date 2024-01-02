# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=newrelic-cli
pkgver=0.78.1
pkgrel=1
pkgdesc="The New Relic Command Line Interface"
arch=(x86_64)
url=https://github.com/newrelic/newrelic-cli
license=(Apache)
depends=(glibc)
makedepends=(go)
source=(${url}/archive/v${pkgver}/$pkgname-$pkgver.tar.gz)
sha256sums=('a879ed8d3a078395d298e5e26a1ebb053258929724b0c27b36b4fb955ab2af78')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="${srcdir}/gopath"
  go mod download
}

build() {
  cd $pkgname-$pkgver

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
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
      -X main.appName=newrelic-cli \
      -X github.com/newrelic/newrelic-vli/internal/cli.version=${pkgver}" \
    cmd/newrelic/*
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 bin/newrelic "$pkgdir/usr/bin/newrelic"

  "${pkgdir}/usr/bin/newrelic" completion --shell bash | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/newrelic"
  "${pkgdir}/usr/bin/newrelic" completion --shell zsh | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_newrelic"
  "${pkgdir}/usr/bin/newrelic" completion --shell fish | install -Dm0644 \
    /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/newrelic.fish"
}

# vim: set ts=2 sw=2 et:
