# Maintainer: Luiz Ribeiro <luizribeiro@gmail.com>, Tom Wambold <tom5760@gmail.com>
pkgname=oauth2_proxy
pkgver=5.0.0
pkgrel=1
pkgdesc="A reverse proxy that provides authentication with Google, Github or other providers."
arch=('i686' 'x86_64')
url="https://github.com/pusher/oauth2_proxy"
license=('MIT')
makedepends=(go go-gpm)
backup=('etc/oauth2_proxy.cfg')
install=oauth2_proxy.install
source=("https://github.com/pusher/$pkgname/archive/v$pkgver.tar.gz"
        'oauth2_proxy.service')
md5sums=('fa40cf81a96a6e112450a8d74581db68'
         '810f64058c2af8fe2f81614f09dbe3c6')

build() {
  mkdir -p github.com/pusher

  mv "$pkgname-$pkgver" github.com/pusher/oauth2_proxy

  mkdir -p deps
  mkdir -p dist

  export GOPATH="$(pwd)/deps:$(realpath $(pwd)/..)"

  cd github.com/pusher/oauth2_proxy
  go-gpm install

  go build -o ../../../dist/oauth2_proxy -trimpath
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  install dist/oauth2_proxy "$pkgdir/usr/bin/oauth2_proxy"
  install github.com/pusher/oauth2_proxy/contrib/oauth2_proxy.cfg.example "$pkgdir/etc/oauth2_proxy.cfg"
  install oauth2_proxy.service "$pkgdir/usr/lib/systemd/system/oauth2_proxy.service"
}
