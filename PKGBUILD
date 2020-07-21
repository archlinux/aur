# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=phpspy
pkgver=$(wget -o /dev/null https://github.com/adsr/phpspy/releases -O - \
    | grep -o -P 'adsr/phpspy/archive/v[0-9]+\.[0-9]+\.[0-9]+' \
    | head -n1 \
    | grep -o -P '[0-9]+\.[0-9]+\.[0-9]+'
)
pkgrel=1
pkgdesc="Low-overhead sampling profiler for PHP 7"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/adsr/phpspy"
makedepends=('git')
license=('MIT')
source=("https://github.com/adsr/phpspy/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "s|\$(or \$(has_pthread), \$(error Need libpthread))| |g" Makefile
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    rm -rf vendor/termbox/
    git clone https://github.com/nsf/termbox.git vendor/termbox
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -m 755 -D phpspy "${pkgdir}/usr/bin/phpspy"
}
