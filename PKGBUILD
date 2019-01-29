# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-dav-ext
pkgver=0.1.0
pkgrel=3
_dirname="nginx-dav-ext-module-$pkgver"
_nginxver=1.14.2

pkgdesc='NGINX WebDAV missing commands support'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
url='http://nginx-rtmp.blogspot.de'
license=('BSD')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver::https://github.com/arut/nginx-dav-ext-module/archive/v${pkgver}.tar.gz"
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'
            'SKIP'
            '6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a')

prepare() {
  cd "$srcdir/$_dirname"
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
