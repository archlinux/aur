# Maintainer: quonaro <quonaro@gmail.com>
pkgname=lota
pkgver=1.16.14
pkgrel=1
pkgdesc="A configurable task runner for rapid development"
arch=('x86_64' 'aarch64')
url="https://github.com/quonaro/lota"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/quonaro/lota.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (git describe --tags --abbrev=0 2>/dev/null || echo "v0.1.0") | sed 's/^v//'
}

build() {
  cd "$pkgname"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  local _pkgver=$((git describe --tags --abbrev=0 2>/dev/null || echo "vdev") | sed 's/^v//')
  local _commit=$(git rev-parse --short HEAD)
  local _date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  
  go build -ldflags "
    -X github.com/quonaro/lota/shared.Version=${_pkgver}
    -X github.com/quonaro/lota/shared.Commit=${_commit}
    -X github.com/quonaro/lota/shared.BuildTime=${_date}
    -extldflags '${LDFLAGS}'" \
    -o "$pkgname" .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Bash completion
  ./$pkgname --completion-script bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  # Zsh completion
  ./$pkgname --completion-script zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # Fish completion
  ./$pkgname --completion-script fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
