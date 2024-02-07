# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
pkgname=golangci-lint
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.56.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')

source=("https://github.com/golangci/golangci-lint/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('34c4a7ecc73ee94e181c89f6f7ff9470669b5ba80effbb4889e5bd8931a5ab80')

build() {
  local _commit _flags
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version="$pkgver"
    -X=main.commit="${_commit::7}"
    -X=main.date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')"
    -linkmode=external
  )
  export CGO_ENABLED=1
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  
  cd "$pkgname-$pkgver"
  
  go build -o "$pkgname" -ldflags="${_flags[*]}" ./cmd/"$pkgname"
  ./"$pkgname" completion bash > completion.bash
  ./"$pkgname" completion zsh > completion.zsh
  ./"$pkgname" completion fish > completion.fish
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
  install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
  install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
}
