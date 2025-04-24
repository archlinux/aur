# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-upload-progress
pkgver=0.9.4
pkgrel=1
_dirname="nginx-upload-progress-module-$pkgver"
_nginxver=1.28.0

pkgdesc='NGINX module implementing an upload progress system, that monitors RFC1867 POST uploads'
arch=('x86_64')
depends=("nginx=$_nginxver")
makedepends=("nginx-src")
url='https://github.com/masterzen/nginx-upload-progress-module'
license=('CUSTOM')

source=("$pkgname-$pkgver::https://github.com/masterzen/nginx-upload-progress-module/archive/v${pkgver}.tar.gz")
sha256sums=('6793c006bf57b06155eb50f35356d30a357c4b1727435c3578f08a820a7d13f7')

prepare() {
  cd "$srcdir/$_dirname"
}

build() {
  cp -r /usr/src/nginx .
  cd "$srcdir"/nginx
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
