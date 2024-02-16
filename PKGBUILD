# Maintainer: William Varmus <0@var.vg>
pkgname=nginx-mainline-mod-zstd-git
pkgver=r27.6be764e
pkgrel=1
pkgdesc="Zstandard compression module for mainline nginx"
arch=('x86_64')
url="https://github.com/tokers/zstd-nginx-module"
license=('BSD-2-Clause')
depends=('zstd>=1.4.0' 'glibc')
makedepends=('git' 'nginx-mainline-src')
provides=('nginx-mainline-mod-zstd')
conflicts=('nginx-mainline-mod-zstd')
source=("$pkgname::git+https://github.com/tokers/zstd-nginx-module.git")
b2sums=('SKIP')

prepare() {
  cp -r /usr/src/nginx .
  cd "$srcdir"/$pkgname
  git submodule update --init
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/nginx
  ./configure --with-compat --add-dynamic-module=../$pkgname
  make modules
}

package() {
  install -Dm644 "$srcdir"/$pkgname/LICENSE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  cd "$srcdir"/nginx/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
