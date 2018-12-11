# Maintainer: Mark Weiman <mark.weiman@markzz.com>
# Contributor: hdhoang <arch@hdhoang.space>

pkgname=nginx-mod-fancyindex
pkgver=0.4.3
pkgrel=3

_modname="${pkgname#nginx-mod-}"
_nginxver=1.14.2

pkgdesc='Fancy indexes module for the Nginx web server'
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/aperezdc/ngx-fancyindex"
license=('BSD')

source=(https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
        https://github.com/aperezdc/ngx-$_modname/archive/v$pkgver.tar.gz
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('239b829a13cea1d244c1044e830bd9c2'
         'SKIP'
         'a0052f0377700b18dd53d96d29f47db8')

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

