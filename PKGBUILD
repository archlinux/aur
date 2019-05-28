# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-accesskey
pkgver=2.0.5
pkgrel=4
_dirname="nginx-accesskey-$pkgver"
_nginxver=1.16.0

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
sha256sums=('4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345'
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
