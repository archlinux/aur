# Maintainer: VCalV

pkgname=nginx-mainline-mod-cgi
_upstream=nginx-cgi
pkgver=0.13
pkgrel=1
pkgdesc='Nginx CGI support module'
arch=('x86_64')
url="https://github.com/pjincz/$_upstream"
license=('BSD-2-Clause')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
backup=('etc/nginx/modules.d/20-cgi.conf')
conflicts=('nginx-mod-cgi')

source=(https://github.com/pjincz/$_upstream/archive/v$pkgver/$_upstream-$pkgver.tar.gz)
sha512sums=('8efdb948d1eecb070bf66befd8f4f038407ee1d97061e1e1a4f677f4b9a405255974856894e49d14b9b644c752b133851a4204944a32819a6e014c5589ff0864')

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
