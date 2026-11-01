# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="nginx-mainline-mod-coraza"
_name="coraza-nginx"
pkgver=0.23.0
pkgrel=1
pkgdesc="Coraza Nginx Connector (module for mainline nginx)"
arch=("x86_64" "aarch64")
url="https://github.com/corazawaf/coraza-nginx"
license=("Apache-2.0")
depends=("glibc" "libcoraza" "nginx-mainline")
makedepends=("nginx-mainline-src")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('441179127a8d8b106f591a8f310569802889b4b3e591f789bbe2ff135fd609b7')

prepare(){
 # nginx modules are built from a copy of the nginx sources
 cp -r /usr/src/nginx .
}

build(){
 cd "nginx"
 ./configure --with-compat --add-dynamic-module="../$_name-$pkgver"
 make modules
}

package(){
 cd "nginx/objs"
 for mod in *.so; do
  install -D -m 755 "$mod" -t "$pkgdir/usr/lib/nginx/modules"
 done
 install -D -m 644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
