# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-accesskey
pkgver=2.0.5
pkgrel=5
_dirname="nginx-accesskey-$pkgver"
_nginxver=1.16.1

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
sha256sums=('f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b'
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
