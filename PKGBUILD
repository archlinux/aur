# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-accesskey
pkgver=2.0.5
pkgrel=3
_dirname="nginx-accesskey-$pkgver"
_nginxver=1.14.2

pkgdesc='Accesskey module for NGINX'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
url='https://github.com/Martchus/nginx-accesskey'
license=('unknown')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver::https://github.com/Martchus/nginx-accesskey/archive/v${pkgver}.tar.gz"
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'
            'SKIP'
            'f7cb363fb527dfda202009942ed3b1bb98e5ef9723893aa0beba22adf9b1a246')

prepare() {
  cd "$srcdir/$_dirname"
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
