# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-dav-ext
pkgver=3.0.0
pkgrel=1
_dirname="nginx-dav-ext-module-$pkgver"
_nginxver=1.14.2

pkgdesc='NGINX WebDAV missing commands support'
arch=('x86_64')
depends=("nginx=$_nginxver" 'libutil-linux' 'libxslt')
url='http://nginx-rtmp.blogspot.de'
license=('BSD')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver::https://github.com/arut/nginx-dav-ext-module/archive/v${pkgver}.tar.gz"
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797'
            'SKIP'
            'd2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859')

prepare() {
  cd "$srcdir/$_dirname"
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --with-http_dav_module --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
