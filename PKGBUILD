# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=oauth2_proxy
pkgver=2.2
pkgrel=2
pkgdesc="A reverse proxy that provides authentication with Google, Github or other providers."
arch=('i686' 'x86_64')
url="https://github.com/bitly/oauth2_proxy"
license=('MIT')
makedepends=(go go-gpm)
backup=('etc/oath2_proxy.cfg')
install=oauth2_proxy.install
source=("https://github.com/bitly/$pkgname/archive/v$pkgver.tar.gz"
        'oauth2_proxy.service')
md5sums=('90e746e2931bedb3208f48b82081719d'
         '810f64058c2af8fe2f81614f09dbe3c6')

build() {
  mkdir -p github.com/bitly

  mv "$pkgname-$pkgver" github.com/bitly/oauth2_proxy

  mkdir -p deps
  mkdir -p dist

  export GOPATH="$(pwd)/deps:$(realpath $(pwd)/..)"

  cd github.com/bitly/oauth2_proxy
  go-gpm install

  go build -o ../../../dist/oauth2_proxy
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc"

  install dist/oauth2_proxy "$pkgdir/usr/bin/oauth2_proxy"
  install github.com/bitly/oauth2_proxy/contrib/oauth2_proxy.cfg.example "$pkgdir/etc/oauth2_proxy.cfg"
}
