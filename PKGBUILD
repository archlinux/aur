# Maintainer: David Birks <david@tellus.space>

pkgname=docker-app
pkgver=0.8.0_rc1
pkgrel=1
pkgdesc='A utility to help make Compose files more reusable and sharable'
arch=(x86_64)
url="https://github.com/docker/app"
license=(Apache)
depends=('docker')
makedepends=('go')
source=("https://github.com/docker/app/archive/v${pkgver//_/-}.tar.gz")
sha512sums=('9ba18f5fd9f5ae0c0a239dbf2179c1e0c7c9be97cb650d7c4e008bb7061fd38613790178a2c013f0299990144946c4895dc743258a10a280c83c6e937f4587b2')

prepare() {
  mkdir -p gopath/src/github.com/docker
  ln -rTsf app-${pkgver//_/-} gopath/src/github.com/docker/app
}

build() {
  # LDFLAGS into the GOFLAGS env variable.
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/docker/app
  make bin/docker-app-standalone
}

package() {
  install -Dm 755 "$srcdir/gopath/src/github.com/docker/app/bin/$pkgname-standalone" "$pkgdir/usr/bin/$pkgname"

  # Add command completion
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/docker-app" completion bash > "$pkgdir/usr/share/bash-completion/completions/docker-app"
  "$pkgdir/usr/bin/docker-app" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_docker-app"
}
