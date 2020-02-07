# Maintainer: Mariusz Chilmon <vmario1986 plus aur at gmail dot com>

pkgname=nginx-upload-module
pkgver=2.3.0
pkgrel=1
pkgdesc="Module for nginx web server for handling file uploads using multipart/form-data encoding (RFC 1867)"
arch=('x86_64')

_dirname="nginx-upload-module-$pkgver"
_nginxver=1.16.1

url='https://github.com/vkholodkov/nginx-upload-module'
license=('BSD')
depends=("nginx=$_nginxver")

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver.tar.gz::https://github.com/vkholodkov/nginx-upload-module/archive/${pkgver}.tar.gz"
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b'
            'SKIP'
            'c86e318addb9c88d70fdbd58ff1f6ef6f404a93070f6db8017a1f880c97946c4')

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENCE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
