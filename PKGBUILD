# Maintainer: Roman Voropaev <voropaev.roma@gmail.com>
# Maintainer: Julian Brost <julian@0x4a42.net>

pkgbase='nginx-unit'
pkgname=('nginx-unitd'
         'nginx-unit-python'
         'nginx-unit-python2'
         'nginx-unit-php'
         'nginx-unit-go')
_shortname='unit'
pkgver=1.4
pkgrel=1
pkgdesc="Dynamic web application server, designed to run applications in multiple languages."
arch=('i686' 'x86_64')
url="https://unit.nginx.org/"
license=('Apache')
source=("https://unit.nginx.org/download/unit-$pkgver.tar.gz"
        'unit.service')
sha256sums=('86313596e758a33b2afe118458b6c307b8ff7732a3a32fbd04c9050631ba6f3f'
            '8c9b2f732d6e50aa747aa7703303e5fff69f5abc6f5fc1741b774b422e029606')
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
