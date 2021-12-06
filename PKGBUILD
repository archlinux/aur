# Maintainer: Clar Fon <clarfon@pm.me>
pkgname=nginx-mainline-mod-uaparser-git
pkgver=r1.f5a1e52
pkgrel=7
_modname="nginx-uaparser-module"
pkgdesc="User agent parser module for mainline nginx"
arch=('i686' 'x86_64')
makedepends=("nginx-mainline-src")
depends=('nginx-mainline' 'uap-cpp-git')
provides=('nginx-mainline-mod-uaparser' 'nginx-mod-uaparser')
url="https://github.com/clarfon/nginx-uaparser-module"
license=('CC0')
source=("git+https://github.com/clarfonthey/$_modname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_modname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  mkdir -p build
  cd build
  ln -sf /usr/src/nginx/auto
  ln -sf /usr/src/nginx/src

  cd "$srcdir/$_modname"
  sed 's@/usr/local@/usr@' -i config
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  /usr/src/nginx/configure --with-compat --add-dynamic-module="../$_modname"
  make modules
}

package() {
  cd "$srcdir/build/objs"
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
