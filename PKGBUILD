# Maintainer: Brian Atkinson <brian@atkinson.mn>
# Prior Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.30.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/open-policy-agent/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/conftest/archive/v$pkgver.tar.gz")
sha512sums=('c54c19dc5fce4957090179abf382a50d6209de28720823ea120f1623553abd62c483f2fcbd6880e0f92bb81297e040d430f53a79f960940c80da745c27f953d4')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  go build \
  -ldflags "-X github.com/open-policy-agent/conftest/internal/commands.version=$pkgver" \
  -o conftest \
  .

  mkdir completion
  ./conftest completion bash > completion/conftest
  ./conftest completion zsh > completion/_conftest
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -vDm 644 "$srcdir/$pkgname-$pkgver/completion/conftest" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 "$srcdir/$pkgname-$pkgver/completion/_conftest" -t "$pkgdir/usr/share/zsh/site-functions/"
}
