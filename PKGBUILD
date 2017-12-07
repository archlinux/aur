# Maintainer: Haruue Icymoon <i@haruue.moe>

pkgname=nginx-mod-ct
pkgver=1.3.2
pkgrel=1

_nginxver=1.12.2

pkgdesc='Nginx module that provides Certificate Transparency supports'
arch=('x86_64')
depends=("nginx=$_nginxver")
url="https://github.com/grahamedgecombe/nginx-ct"
license=('ISC')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz
  "nginx-ct-$pkgver.tar.gz"::"https://github.com/grahamedgecombe/nginx-ct/archive/v$pkgver.tar.gz"
)
sha256sums=('SKIP'
'b4ceae549b9dbf84b2e511633982e4efeee0388e3b7a038a8bac555008a77b88')

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --with-http_ssl_module --add-dynamic-module=../nginx-ct-$pkgver
  make modules
}

package() {
  install -Dm644 "$srcdir/"nginx-ct-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}

# vim:set ts=8 sts=2 sw=2 et:
