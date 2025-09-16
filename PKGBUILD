# Maintainer: VCalV

pkgname=nginx-mod-cgi
_upstream=nginx-cgi
pkgver=0.14.1
pkgrel=1
pkgdesc='Nginx CGI support module'
arch=('x86_64')
url="https://github.com/pjincz/$_upstream"
license=('BSD-2-Clause')
depends=('nginx')
makedepends=('nginx-src')
backup=('etc/nginx/modules.d/20-cgi.conf')
conflicts=('nginx-mainline-mod-cgi')

source=(https://github.com/pjincz/$_upstream/archive/v$pkgver/$_upstream-$pkgver.tar.gz)
sha512sums=('b250dd3e26b54017807f70ddace6bb98fd05ec3590a30a2d1a8fd9fb4daf6f9a0f2b9b1143d38362331aa3e608a2c42ab90b9d49e27b10591b080581b70b2407')

prepare() {
  mkdir -p build
  cd build
  ln -sf /usr/src/nginx/auto
  ln -sf /usr/src/nginx/src
}

build() {
  cd build
  auto/configure \
    --with-ld-opt="$LDFLAGS" \
    --with-compat \
    --add-dynamic-module=../$_upstream-$pkgver
  make modules
}

package() {
  install -Dm644 "$srcdir"/$_upstream-$pkgver/LICENSE \
                 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$srcdir"/$_upstream-$pkgver/README.md \
                 "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -dm0755 "$pkgdir"/etc/nginx/modules.d

  cd build/objs
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    echo "load_module \"/usr/lib/nginx/modules/$mod\";" >> "$pkgdir/etc/nginx/modules.d/20-cgi.conf"
  done
}
