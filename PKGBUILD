# Maintainer: David Birks <david@birks.dev>

pkgname=docker-app
pkgver=0.9.1_beta3
pkgrel=1
epoch=1
pkgdesc='A utility to help make Compose files more reusable and sharable'
arch=(x86_64)
url='https://github.com/docker/app'
license=(Apache)
depends=('docker')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/app/archive/v${pkgver/_/-}.tar.gz")
sha512sums=('42216f1b585d8bc2caf9cfe3b644edbc3838f0c16daa00da0047115cd9b8fbd9a22155951a101f7f40a2335ddc651297a452dfbb94ba12be02e1fbaa75b559b1')

prepare() {
  mkdir -p gopath/src/github.com/docker
  ln -rTsf app-${pkgver/_/-} gopath/src/github.com/docker/app
}

build() {
  # LDFLAGS into the GOFLAGS env variable.
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/docker/app
  make bin/docker-app
}

package() {
  install -Dm 755 "$srcdir/gopath/src/github.com/docker/app/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Add command completion
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/docker-app" completion bash > "$pkgdir/usr/share/bash-completion/completions/docker-app"
  "$pkgdir/usr/bin/docker-app" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_docker-app"
}
