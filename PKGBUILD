# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.2.3
pkgrel=1
_modname=nginx-module-vts
pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=(x86_64)
depends=(glibc nginx-mainline)
makedepends=(nginx-mainline-src)
url='https://github.com/vozlt/nginx-module-vts'
license=(BSD-2-Clause)
source=("$_modname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('91d111faca84929ee3fa5ab6c6a11f2eede8ad8c8c9adcfb0d53e51a023fade1fc126ce2680bf8fb0461c20194d24f5ccbb27e376e392a9f2b769ba8d06c611e')

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
