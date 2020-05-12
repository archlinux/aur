# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Haruue Icymoon <i@haruue.moe>

pkgname=nginx-mod-ct
pkgver=1.3.2
pkgrel=1

_nginxver=1.18.0

pkgdesc='Nginx module that provides Certificate Transparency supports'
arch=('x86_64')
depends=("nginx=$_nginxver")
url="https://github.com/grahamedgecombe/nginx-ct"
license=('ISC')

source=(
  "https://nginx.org/download/nginx-$_nginxver.tar.gz"{,.asc}
  "nginx-ct-$pkgver.tar.gz"::"https://github.com/grahamedgecombe/nginx-ct/archive/v$pkgver.tar.gz"
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99'
            'SKIP'
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
