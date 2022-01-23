# Maintainer: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.4.1
pkgrel=1
pkgdesc='Helm plugin that shows a diff explaining what a helm upgrade would change'
arch=('x86_64')
url='https://github.com/databus23/helm-diff'
license=('Apache')
install=helm-diff.install
depends=('helm')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a58f42a47410a53e8ab39558b0b00a6aeeef6dc44e3af2ecaa2dc9370f0a6f18')

prepare() {
  sed -i '/^hooks:$/Q' "$pkgname-$pkgver"/plugin.yaml
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o bin/diff -ldflags "-linkmode=external -X github.com/databus23/helm-diff/cmd.Version=$pkgver" main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test -ldflags "-linkmode=external" ./...
}

package() {
  cd "$pkgname-$pkgver"
  # /usr/lib/helm/plugins is my own choice and not a standard. feedback welcome
  install -Dm755 bin/diff -t "$pkgdir/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "$pkgdir/usr/lib/helm/plugins/${pkgname##helm-}"
}
