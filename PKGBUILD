# Maintainer: David Birks <david@tellus.space>

pkgname=docker-app
pkgver=0.8.0
pkgrel=1
epoch=1
pkgdesc='A utility to help make Compose files more reusable and sharable'
arch=(x86_64)
url='https://github.com/docker/app'
license=(Apache)
depends=('docker')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/app/archive/v$pkgver.tar.gz")
sha512sums=('e1dc60e1d98167531067ffc01472e646f2262c696535b9379d59ae9805840e739624b400ae2152dfce87dc994997d03e0f5be9745b385dd4e0e67a957e733788')

prepare() {
  mkdir -p gopath/src/github.com/docker
  ln -rTsf app-$pkgver gopath/src/github.com/docker/app
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
