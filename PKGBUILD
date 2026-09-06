# Maintainer: Veitangie <emignatiev.work@gmail.com>

pkgname=sinq
_tag=v1.0.0-rc.31
pkgver=1.0.0_rc.31
pkgrel=1
pkgdesc='A concurrent HTTP functional and integration testing tool.'
arch=('x86_64' 'aarch64')
url="https://github.com/Veitangie/sinq"
license=('GPL3')
provides=('sinq')
conflicts=('sinq-bin' 'sinq-git')
options=('!debug')
depends=()
makedepends=('go' 'go-md2man')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Veitangie/sinq/archive/refs/tags/$_tag.tar.gz")
sha256sums=('c57578de51d30f0a17cea5822a3fa5850d1d75cdb6e9566546dc47acfeae187f')

build() {
  cd "$pkgname-${_tag#v}"
  
  export CGO_ENABLED=0
  
  go build -trimpath -ldflags="-s -w -X 'main.version=$_tag'" -o $pkgname ./cmd/$pkgname
  
  go-md2man -in docs/man.md -out sinq.1
}

package() {
  cd "$pkgname-${_tag#v}"
  
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  install -Dm644 sinq.1 "$pkgdir/usr/share/man/man1/sinq.1"

  install -Dm644 cmd/sinq/completions/sinq.bash "$pkgdir/usr/share/bash-completion/completions/sinq"
  install -Dm644 cmd/sinq/completions/_sinq "$pkgdir/usr/share/zsh/site-functions/_sinq"
  install -Dm644 cmd/sinq/completions/sinq.fish "$pkgdir/usr/share/fish/vendor_completions.d/sinq.fish"
}
