# Maintainer: KokaKiwi <kokakiwi+arch@kokakiwi.net>

pkgname=ayojs-git
pkgver=8.4.0
pkgrel=1
pkgdesc="It's pronounced like \"IO\""
arch=('i686' 'x86_64')
url='https://github.com/ayojs/ayo'
license=('MIT')
depends=('openssl-1.0' 'zlib' 'icu' 'libuv' 'http-parser' 'c-ares')
replaces=('nodejs')
makedepends=('python2' 'procps-ng')
source=("ayo::git://github.com/ayojs/ayo")
sha512sums=('SKIP')

prepare() {
    cd ayo

    msg 'Fixing for python2 name'
    find -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;
    find test/ -type f -exec sed 's_python _python2 _' -i {} \;

    export PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig"
    export PYTHON="python2"

    ./configure \
        --prefix=/usr \
        --with-intl=system-icu \
        --without-npm \
        --shared-openssl \
        --shared-zlib \
        --shared-libuv \
        --shared-http-parser \
        --shared-cares
}

build() {
    cd ayo

    make
}

check() {
    cd ayo

    make test || warning "Tests failed"
}

package() {
    cd ayo

    make install DESTDIR="$pkgdir"

    install -D -m644 LICENSE \
        "$pkgdir"/usr/share/licenses/ayojs/LICENSE
}

# vim: set ts=4 sw=4 et:
