# Maintainer: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.8.0
pkgrel=1
pkgdesc='Helm plugin that shows a diff explaining what a helm upgrade would change'
arch=('x86_64')
url='https://github.com/databus23/helm-diff'
license=('Apache')
install=helm-diff.install
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5ab834d50244beaedefb8073bdff4f01b2f485728726b8b95f5f17f03e8b5aa6')

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
