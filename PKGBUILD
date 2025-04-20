# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.2.4
pkgrel=1
_modname=nginx-module-vts
pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=(x86_64)
depends=(glibc nginx-mainline)
makedepends=(nginx-mainline-src)
url='https://github.com/vozlt/nginx-module-vts'
license=(BSD-2-Clause)
source=("$_modname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9b25beb42837b6a2cfb95259462dcac39c1d9199960f61a3f470855e672f1ebf8be3daad23af3fc633301f76022e1703c4eacd102fd4a49deeeb77b8ad30adbf')

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
