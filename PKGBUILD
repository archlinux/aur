# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="nginx-mod-secure-token-git"
pkgver=r163.d3d8cea
pkgrel=1
pkgdesc="Generates CDN tokens, either as a cookie or as a query string parameter."
arch=("x86_64" "i686" "armv7h" "aarch64")
depends=("nginx")
makedepends=("git" "nginx-src")
provides=("nginx-mod-secure-token")
url="https://github.com/kaltura/nginx-secure-token-module"
license=("AGPL3")
source=("$pkgname::git+https://github.com/kaltura/nginx-secure-token-module.git")
validpgpkeys=("B0F4253373F8F6F510D42178520A9993A1C052F8") # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('SKIP')

pkgver() {
 cd "$pkgname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
 cd "$pkgname"
 cp -r "/usr/src/nginx" ..
 sed "s|/usr/local|/usr|" -i "config"
}

build(){
 cd "$srcdir"/nginx
 ./configure --with-compat \
             --with-file-aio \
             --with-threads \
             --with-cc-opt="-O3" \
             --add-dynamic-module="../$pkgname"
 make modules
}

package() {
 cd "$srcdir/nginx/objs"
 for mod in ngx_*.so; do
  install -D -m 755 "$mod" "$pkgdir/usr/lib/nginx/modules/$mod"
 done
}
