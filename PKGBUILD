# Maintainer: nachtjasmin <nachtjasmin at posteo dot de>
pkgname=kluctl
pkgdesc='The missing glue to put together large Kubernetes deployments.'
pkgver=2.22.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/kluctl/kluctl/'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')

source=("https://github.com/kluctl/kluctl/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6fed4634a22c5d92da49a518696c9792fadd7e3d63bbb2f0354dddc9d3b95c58')

build() {
  local _commit _flags
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version="$pkgver"
    -X=main.commit="${_commit::7}"
    -X=main.date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')"
    -linkmode=external
  )
  export CGO_ENABLED=0
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  cd "$pkgname-$pkgver"
  
  go build -o "$pkgname" -ldflags="${_flags[*]}" ./cmd/main.go
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
