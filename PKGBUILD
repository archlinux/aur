# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=c-lightning-git
pkgver=r2936.b3534462
pkgrel=1
pkgdesc='A Lightning Network implementation in C'
arch=('i686' 'x86_64')
url='https://github.com/ElementsProject/lightning'
license=('custom')
depends=('sqlite')
makedepends=('git')
source=('git+https://github.com/ElementsProject/lightning.git'
        'git+https://github.com/zserge/jsmn.git'
        'git+https://github.com/ianlancetaylor/libbacktrace.git'
        'git+https://github.com/bitcoin/libbase58.git'
        'git+https://github.com/jedisct1/libsodium.git'
        'libbacktrace-no-multilib.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5f843b31b1be859994413a826d8814c6d3ea29d99d8ea59d2372d8a1f3ba036f')

pkgver() {
    cd lightning

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd lightning

    git submodule init external/jsmn
    git config submodule.daemon/jsmn.url "${srcdir}/jsmn"

    git submodule init external/libbacktrace
    git config submodule.external/libbacktrace.url "${srcdir}/libbacktrace"

    git submodule init external/libbase58
    git config submodule.bitcoin/libbase58.url "${srcdir}/libbase58"

    git submodule init external/libsodium
    git config submodule.libsodium.url "${srcdir}/libsodium"

    git submodule update
    sed -e 's/ -Werror//' -i Makefile
    cd external/libbacktrace
    patch -p1 -i "${srcdir}/libbacktrace-no-multilib.patch"
}

build() {
    cd lightning

    cd external/libbacktrace
    #rm aclocal.m4 *.in configure ltmain.sh
    #aclocal && libtoolize --force && autoreconf
    autoreconf --force --install
    #libtoolize --force
    cd ../..

    make
}

package() {
    cd lightning

    install -Dm755 -t "${pkgdir}/usr/bin" \
        cli/lightning-cli \
        lightningd/lightningd
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" doc/*.1
    install -Dm644 -t "${pkgdir}/usr/share/man/man7" doc/*.7
}
