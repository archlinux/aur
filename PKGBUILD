# Maintainer: Veitangie <emignatiev.work@gmail.com>

pkgname=sinq
_tag=v1.0.0-rc.26
pkgver=1.0.0_rc.26
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
sha256sums=('5c36b51bbf1f7a99ff39925304e2e27c9331438a3dda7a898107fc8bfd8402da')

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
