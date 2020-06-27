# Maintainer: Luiz Ribeiro <luizribeiro@gmail.com>, Tom Wambold <tom5760@gmail.com>
pkgname=oauth2_proxy
pkgver=6.0.0
pkgrel=1
pkgdesc="A reverse proxy that provides authentication with Google, Github or other providers."
arch=('i686' 'x86_64')
url="https://github.com/oauth2-proxy/oauth2-proxy"
license=('MIT')
makedepends=(go go-gpm)
backup=('etc/oauth2_proxy.cfg')
install=oauth2_proxy.install
source=("https://github.com/oauth2-proxy/oauth2-proxy/archive/v$pkgver.tar.gz"
        'oauth2_proxy.service')
md5sums=('fe9b237bf06bde19375af80a5fd8c328'
         'd74991327448729ed64c1369724f7857')

build() {
  mkdir -p github.com/oauth2-proxy

  mv "oauth2-proxy-$pkgver" github.com/oauth2-proxy/oauth2-proxy

  mkdir -p deps
  mkdir -p dist

  export GOPATH="$(pwd)/deps:$(realpath $(pwd)/..)"

  cd github.com/oauth2-proxy/oauth2-proxy
  go-gpm install

  go build -o ../../../dist/oauth2-proxy -trimpath
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  install dist/oauth2-proxy "$pkgdir/usr/bin/oauth2-proxy"
  install github.com/oauth2-proxy/oauth2-proxy/contrib/oauth2-proxy.cfg.example "$pkgdir/etc/oauth2_proxy.cfg"
  install oauth2_proxy.service "$pkgdir/usr/lib/systemd/system/oauth2_proxy.service"
}
