# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
pkgname=lyn-git
pkgver=1.4.1.r14.gc1fc103
pkgrel=1
pkgdesc="Weather forecasting CLI powered by the Norwegian Meteorological Institute"
arch=('x86_64' 'aarch64')
url="https://sr.ht/~timharek/lyn/"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.sr.ht/~timharek/lyn")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.Version=$(git describe --tags)" -o lyn ./cmd/lyn

  ./lyn completion bash > lyn.bash
  ./lyn completion zsh > lyn.zsh
  ./lyn completion fish > lyn.fish
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 lyn "$pkgdir/usr/bin/lyn"
  install -Dm644 lyn.bash "$pkgdir/usr/share/bash-completion/completions/lyn"
  install -Dm644 lyn.zsh "$pkgdir/usr/share/zsh/site-functions/_lyn"
  install -Dm644 lyn.fish "$pkgdir/usr/share/fish/vendor_completions.d/lyn.fish"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
