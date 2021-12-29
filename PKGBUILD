pkgname=svix-cli
pkgver=0.15.0
pkgrel=1
pkgdesc='The Svix CLI (webhooks as a service)'
arch=('x86_64')
url="https://www.svix.com"
license=('GPL')
makedepends=('go')
source=("https://github.com/svixhq/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d60f5caaf90c61d328cab00543860f5ce481a1e19a4f1c2b1974d2b701ba8722')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X github.com/svixhq/svix-cli/version.Version=v$pkgver" -o build ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/svix
  "$pkgdir"/usr/bin/svix completion bash > bash-svix
  install -D bash-svix "$pkgdir"/etc/bash_completion.d/svix
  "$pkgdir"/usr/bin/svix completion zsh > zsh-svix
  install -D zsh-svix "$pkgdir"/usr/share/zsh/site-functions/_svix
}
