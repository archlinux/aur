# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=ccstatus
pkgver=0.3.1
pkgrel=1
pkgdesc="Customizable status line formatter for Claude Code CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/moond4rk/ccstatus"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
checkdepends=('git')
optdepends=('git: git branch, changes and worktree widgets')
conflicts=('ccstatus-bin')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moond4rk/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('482ece06c5416f5e1e757601e1cec3cb1687e9c930aa487701fc26940e502f13')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=$pkgver" -o "$pkgname" ./cmd/ccstatus
}

check() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOPATH="$srcdir/gopath"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
