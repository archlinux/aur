# Contributor: Roman Voropaev <voropaev.roma@gmail.com>

pkgbase='nginx-unit'
pkgname=('nginx-unitd' 'nginx-unit-python' 'nginx-unit-php' 'nginx-unit-go')
_shortname='unit'
pkgver=0.7
pkgrel=2
pkgdesc="Dynamic web application server, designed to run applications in multiple languages."
arch=('i686' 'x86_64')
url="http://unit.nginx.org/"
license=('Apache-2.0')
source=($pkgbase-$pkgver.tar.gz::"https://hg.nginx.org/$_shortname/archive/$pkgver.tar.gz")
md5sums=("52ab9f68bb2c4bccc393e2365d02c630")
makedepends=('php-embed' 'python' 'go')

build() {
  cd "$srcdir"/$_shortname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  ./configure python
  ./configure php
  ./configure go
  make all
}

package_nginx-unitd() {
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" unitd-install
  install -m 644 -D "$startdir"/unit.service "$pkgdir"/usr/lib/systemd/system/unit.service
}

package_nginx-unit-python() {
  depends=('nginx-unitd' 'python')
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" python-install
}

package_nginx-unit-php() {
  depends=('nginx-unitd' 'php')
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" php-install
}

package_nginx-unit-go() {
  depends=('nginx-unitd' 'go')
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" go-install
}
