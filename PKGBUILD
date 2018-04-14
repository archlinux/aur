# Maintainer: Roman Voropaev <voropaev.roma@gmail.com>
# Contributor: Julian Brost <julian@0x4a42.net>

pkgbase='nginx-unit'
pkgname=('nginx-unitd'
         'nginx-unit-python'
         'nginx-unit-python2'
         'nginx-unit-php'
         'nginx-unit-go')
_shortname='unit'
pkgver=1.0
pkgrel=1
pkgdesc="Dynamic web application server, designed to run applications in multiple languages."
arch=('i686' 'x86_64')
url="http://unit.nginx.org/"
license=('Apache')
source=("https://unit.nginx.org/download/unit-$pkgver.tar.gz"
        'unit.service')
sha256sums=('13b250032d3aeef554f5e7f67b26dc2c01b9e51f5f392cbeca44db65488ca6f1'
            'SKIP')
makedepends=('php-embed' 'python' 'python2' 'go')

build() {
  cd "$srcdir"/$_shortname-$pkgver
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --modules="/usr/lib/$pkgbase" \
              --state="/var/lib/$pkgbase" \
              --pid="/run/$pkgbase.pid" \
              --log="/var/log/$pkgbase.log" \
              --control="/run/$pkgbase.control.sock"
  ./configure python --config=python3-config
  ./configure python --config=python2-config
  ./configure php
  ./configure go --go-path=/usr/lib/go
  make all
}

package_nginx-unitd() {
  depends=('glibc')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" unitd-install
  install -m 644 -D "$srcdir"/unit.service "$pkgdir"/usr/lib/systemd/system/unit.service
}

package_nginx-unit-python() {
  depends=('nginx-unitd' 'python')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" python3-install
}

package_nginx-unit-python2() {
  depends=('nginx-unitd' 'python2')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" python2-install
}

package_nginx-unit-php() {
  depends=('nginx-unitd' 'php-embed')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" php-install
}

package_nginx-unit-go() {
  arch=('any')
  depends=('nginx-unitd' 'go')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" go-install
}
