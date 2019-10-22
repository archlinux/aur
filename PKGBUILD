# Maintainer: KawaiDesu <zmey1992@ya.ru>
# Contributor: Roman Voropaev <voropaev.roma@gmail.com>
# Contributor:: Julian Brost <julian@0x4a42.net>

pkgbase='nginx-unit'
pkgname=('nginx-unitd'
         'nginx-unit-python'
         'nginx-unit-python2'
         'nginx-unit-php'
         'nginx-unit-perl'
         'nginx-unit-ruby'
#         'nginx-unit-nodejs'
         'nginx-unit-go')
_shortname='unit'
pkgver=1.12.0
pkgrel=1
pkgdesc="Lightweight, dynamic, open-source server for diverse web applications."
arch=('i686' 'x86_64')
url="https://unit.nginx.org/"
license=('Apache')
source=("https://unit.nginx.org/download/unit-$pkgver.tar.gz"
        'unit.service')
sha256sums=('03388fb39b2e589c85d4bccb6d5a0e99098d250f0ecb5be668b416cc478d17d1'
            '8c9b2f732d6e50aa747aa7703303e5fff69f5abc6f5fc1741b774b422e029606')
makedepends=('php-embed' 'python' 'python2' 'go' 'ruby' 'perl' 'npm')

build() {
  cd "$srcdir"/$_shortname-$pkgver
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --modules="/usr/lib/$pkgbase" \
              --state="/var/lib/$pkgbase" \
              --pid="/run/$pkgbase.pid" \
              --log="/var/log/$pkgbase.log" \
              --control="/run/$pkgbase.control.sock" \
              --openssl
  ./configure python --config=python3-config
  ./configure python --config=python2-config
  ./configure php
  ./configure perl
  ./configure ruby
#  ./configure nodejs
  ./configure go --go-path=/usr/lib/go
  make all
}

package_nginx-unitd() {
  depends=('glibc' 'openssl')

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

package_nginx-unit-perl() {
  arch=('any')
  depends=('nginx-unitd' 'perl')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" perl-install
}

package_nginx-unit-ruby() {
  arch=('any')
  depends=('nginx-unitd' 'ruby')

  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" ruby-install
}

# Temporary disabled due to build problems
#package_nginx-unit-nodejs() {
#  arch=('any')
#  depends=('nginx-unitd' 'nodejs')
#
#  cd "$srcdir"/$_shortname-$pkgver
#  make DESTDIR="$pkgdir" node-install
#}
