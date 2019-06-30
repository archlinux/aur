# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=c-lightning-git
pkgver=r5960.fa1c8b36
pkgrel=1
pkgdesc='A Lightning Network implementation in C'
arch=('i686' 'x86_64')
url='https://github.com/ElementsProject/lightning'
license=('custom')
depends=('gmp' 'libsodium' 'sqlite')
makedepends=('clang' 'git' 'python-pytest')
source=('git+https://github.com/ElementsProject/lightning.git'
        'git+https://github.com/zserge/jsmn.git'
        'git+https://github.com/ianlancetaylor/libbacktrace.git'
        'git+https://github.com/jedisct1/libsodium.git'
        'git+https://github.com/ElementsProject/libwally-core.git'
        'macro-quotation.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '35e294ffdc49c02f8e9d79b7122dab4c4d4ebd8321c1b98ba518127bb6e0d423')

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

    git submodule init external/libsodium
    git config submodule.libsodium.url "${srcdir}/libsodium"

    git submodule init external/libwally-core
    git config submodule.external/libwally-core.url "${srcdir}/libwally-core"

    git submodule update

    patch -Np1 -i ../macro-quotation.patch
    sed -e 's/ -Werror//' -i configure
    sed -e '/include lightningd\/test\/Makefile/d' -i lightningd/Makefile
}

build() {
    cd lightning

    env CC=clang \
        COPTFLAGS="${CFLAGS}" \
        PYTEST=pytest ./configure --prefix=/usr
    make LDFLAGS="${LDFLAGS}" libexecdir=/usr/lib
}

package() {
    cd lightning

    make DESTDIR="${pkgdir}" libexecdir=/usr/lib install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
