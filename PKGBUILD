# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.2.5
pkgrel=1
_modname=nginx-module-vts
pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=(x86_64)
depends=(glibc nginx-mainline)
makedepends=(nginx-mainline-src)
url='https://github.com/vozlt/nginx-module-vts'
license=(BSD-2-Clause)
source=("$_modname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4d887365d30c83832f5aaaea7220218d7ba36f58f98ad10ef5e0c40b9baf3e91c26d3ead05d92e38707b5d680ad65bf6aca54926fa3ce44b7dea511e26ad83d1')

build() {
  cp -r /usr/src/nginx .

  cd nginx
  ./configure --with-compat \
              --with-cc-opt="$CFLAGS $CPPFLAGS" \
              --with-ld-opt="$LDFLAGS" \
              --add-dynamic-module=../$_modname-$pkgver
  make modules
}

package() {
  install -Dm0644 $_modname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd nginx/objs
  for mod in *.so; do
      install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}

# vim:set ts=2 sw=2 et:
