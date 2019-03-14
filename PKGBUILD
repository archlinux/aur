# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-upload-progress
pkgver=0.9.2
pkgrel=3
_dirname="nginx-upload-progress-module-$pkgver"
_nginxver=1.14.2

pkgdesc='NGINX module implementing an upload progress system, that monitors RFC1867 POST uploads'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
url='https://github.com/masterzen/nginx-upload-progress-module'
license=('CUSTOM')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver::https://github.com/masterzen/nginx-upload-progress-module/archive/v${pkgver}.tar.gz"
  '0001-Fix-ngx_module_type.patch::https://github.com/masterzen/nginx-upload-progress-module/commit/dd138546b16a01e9c09613d02211373baf1cac02.patch'
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797'
            'SKIP'
            'b286689355442657650421d8e8398bd4abf9dbbaade65947bb0cb74a349cc497'
            '4fdf5269aadce50cc8ab6f2ffed19df40db681b25c6a37fa660686aa07ff3a27')

prepare() {
  cd "$srcdir/$_dirname"
  patch -p1 -i '../0001-Fix-ngx_module_type.patch'
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
