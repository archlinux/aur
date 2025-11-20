# Maintainer: Lewis Wynne <lew@ily.rs>

pkgname=pda-git
_pkgname=pda
pkgver=r50.g25b4363
pkgrel=1
pkgdesc="pda! your template-friendly key/value store for code snippets"
arch=('x86_64')
url="https://github.com/llywelwyn/$_pkgname"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//' | sed 's/-/./g'
  else
    local count commit
    count=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short HEAD)
    printf 'r%s.g%s' "$count" "$commit"
  fi
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath"
  ldflags="-s -w -X 'main.version=$pkgver'"
  go build -o $_pkgname -ldflags="$ldflags" .
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
