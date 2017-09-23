# Maintainer: Mark Weiman <mark.weiman@markzz.com>
# Contributor: hdhoang <arch@hdhoang.space>

pkgname=nginx-mod-fancyindex
pkgver=0.4.2
pkgrel=1

_modname="${pkgname#nginx-mod-}"
_nginxver=1.12.1

pkgdesc='Fancy indexes module for the Nginx web server'
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/aperezdc/ngx-fancyindex"
license=('BSD')

source=(https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
        https://github.com/aperezdc/ngx-$_modname/archive/v$pkgver.tar.gz
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('a307e74aca95403e5ee00f153807ce58'
         'SKIP'
         'fc2154f36eeabae4d4855cfcc25a060f')

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module=../ngx-$_modname-$pkgver
  make modules
}

package() {
  install -Dm644 "$srcdir/"ngx-$_modname-$pkgver/LICENSE \
                 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}

