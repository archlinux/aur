# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-dav-ext
pkgver=3.0.0
pkgrel=8
_dirname="nginx-dav-ext-module-$pkgver"
_nginxver=1.22.0

pkgdesc='NGINX WebDAV missing commands support'
arch=('x86_64')
depends=("nginx=$_nginxver" 'libutil-linux' 'libxslt')
makedepends=("nginx-src")
url='https://github.com/arut/nginx-dav-ext-module'
license=('BSD')

source=("$pkgname-$pkgver::https://github.com/arut/nginx-dav-ext-module/archive/v${pkgver}.tar.gz")
sha256sums=('d2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859')

prepare() {
  cd "$srcdir/$_dirname"
}

build() {
  cp -r /usr/src/nginx .
  cd "$srcdir"/nginx
  ./configure --with-compat --with-http_dav_module --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
