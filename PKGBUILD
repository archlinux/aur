# Maintainer: Rodney Osodo <socials@rodneyosodo.com>

# CI updates pkgver and the checksums when upstream releases (see .github/workflows/release-packages.yml).

pkgname=clacks
pkgver=0.2.1
pkgrel=1
pkgdesc='Encrypted, self-hosted sync for AI coding sessions'
arch=(x86_64 aarch64)
url='https://github.com/rodneyosodo/clacks'
license=(MIT)
makedepends=(go)
optdepends=('opencode: the sessions clacks syncs')
conflicts=(clacks-bin)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  clacks.service
)
sha256sums=('e94c1393804208ebab0d0dfddce8621576d58bd6437e74b102a5c924fac10bad'
            'f40acb644896600724a249e5d6b261ff38bcd3adffd70cc9034961f17681999f')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-X main.version=v$pkgver" -o build/clacks ./cmd/clacks

  for shell in bash zsh fish; do
    ./build/clacks completion "$shell" >"build/clacks.$shell"
  done
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  CGO_ENABLED=0 go test -short ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/clacks -t "$pkgdir/usr/bin/"
  install -Dm644 build/clacks.bash "$pkgdir/usr/share/bash-completion/completions/clacks"
  install -Dm644 build/clacks.zsh "$pkgdir/usr/share/zsh/site-functions/_clacks"
  install -Dm644 build/clacks.fish "$pkgdir/usr/share/fish/vendor_completions.d/clacks.fish"
  install -Dm644 "$srcdir/clacks.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
