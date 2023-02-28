pkgname=gospt
pkgver=0.0.36
pkgrel=1
pkgdesc='Spotify TUI And CLI written in Go'
arch=('x86_64')
url="https://gitea.asdf.cafe/abs3nt/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('972f3e91b9da114daea31026c908c154c066870c4c9123cf7d343b15a7fd8709')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
  ./build/$pkgname completion zsh > build/gospt_zsh
  ./build/$pkgname completion bash > build/gospt_bash
  ./build/$pkgname completion fish > build/gospt_fish
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 build/gospt_zsh "$pkgdir"/usr/share/zsh/site-functions/_gospt
  install -Dm644 build/gospt_bash "$pkgdir"/usr/share/bash-completion/completions/gospt
  install -Dm644 build/gospt_fish "$pkgdir"/usr/share/fish/vendor_completions.d/gospt.fish
}
