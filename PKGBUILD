# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-upload-progress
pkgver=0.9.2
pkgrel=10
_dirname="nginx-upload-progress-module-$pkgver"
_nginxver=1.22.0

pkgdesc='NGINX module implementing an upload progress system, that monitors RFC1867 POST uploads'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
makedepends=("nginx-src")
url='https://github.com/masterzen/nginx-upload-progress-module'
license=('CUSTOM')

source=("$pkgname-$pkgver::https://github.com/masterzen/nginx-upload-progress-module/archive/v${pkgver}.tar.gz"
        '0001-Fix-ngx_module_type.patch::https://github.com/masterzen/nginx-upload-progress-module/commit/dd138546b16a01e9c09613d02211373baf1cac02.patch')
sha256sums=('b286689355442657650421d8e8398bd4abf9dbbaade65947bb0cb74a349cc497'
            '4fdf5269aadce50cc8ab6f2ffed19df40db681b25c6a37fa660686aa07ff3a27')

prepare() {
  cd "$srcdir/$_dirname"
  patch -p1 -i '../0001-Fix-ngx_module_type.patch'
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
