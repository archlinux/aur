# Contributor: Roman Voropaev <voropaev.roma@gmail.com>

pkgbase='nginx-unit'
pkgname=('nginx-unitd' 'nginx-unit-python' 'nginx-unit-php' 'nginx-unit-go')
_shortname='unit'
pkgver=1.0
pkgrel=0
pkgdesc="Dynamic web application server, designed to run applications in multiple languages."
arch=('i686' 'x86_64')
url="http://unit.nginx.org/"
license=('Apache-2.0')
source=("https://unit.nginx.org/download/unit-$pkgver.tar.gz"
        'unit.service')
sha256sums=('13b250032d3aeef554f5e7f67b26dc2c01b9e51f5f392cbeca44db65488ca6f1'
            'SKIP')
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
  install -m 644 -D "$srcdir"/unit.service "$pkgdir"/usr/lib/systemd/system/unit.service
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
