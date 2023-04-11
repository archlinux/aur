pkgname=gospt
pkgver=0.0.47
pkgrel=1
pkgdesc='Spotify TUI And CLI written in Go'
arch=('x86_64')
url="https://git.asdf.cafe/abs3nt/${pkgname}"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0be2e63b78c4fc8fe1e7024483250d7220864f2dcc10aa7958fdc7c4b17e6e30')

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
