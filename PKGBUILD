#!/bin/bash
# Maintainer: Nico Suarez <nicodoggie@gmail.com>
_pkgname=uprofiler
pkgname=php-${_pkgname}-git
pkgver=r117.483c1e5
pkgrel=1
pkgdesc="A passive hierarchichal profiler for PHP."
arch=('i686' 'x86_64')
url="https://github.com/FriendsOfPHP/uprofiler"
license=('APACHE')
provides=('php-uprofiler')
makedepends=('make' 'git')
depends=('php')

source=("uprofiler::git://github.com/FriendsOfPHP/uprofiler.git" "uprofiler.ini")
sha256sums=('SKIP'
            '1a4ae4076cef64dd8412831fc5674831c26e8e6db6aec7a7244fde96a1d63fce')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}/extension"	phpize
	phpize
	./configure --with-php-config=/usr/bin/php-config --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname}/extension"
	make INSTALL_ROOT="$pkgdir/" install
	install -Dm644 "$srcdir/uprofiler.ini" "$pkgdir/etc/php/conf.d/uprofiler.ini"
}
