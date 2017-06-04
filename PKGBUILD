# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=c-lightning-git
pkgver=r1631.f1f9af4
pkgrel=1
pkgdesc='A Lightning Network implementation in C'
arch=('i686' 'x86_64')
url='https://github.com/ElementsProject/lightning'
license=('custom')
depends=('protobuf-c' 'sh' 'sqlite')
makedepends=('git')
source=('git+https://github.com/ElementsProject/lightning.git'
        'git+https://github.com/zserge/jsmn.git'
        'git+https://github.com/bitcoin/libbase58.git'
        'git+https://github.com/jedisct1/libsodium.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd lightning

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd lightning

    git submodule init daemon/jsmn
    git config submodule.daemon/jsmn.url "${srcdir}/jsmn"

    git submodule init bitcoin/libbase58
    git config submodule.bitcoin/libbase58.url "${srcdir}/libbase58"

    git submodule init libsodium
    git config submodule.libsodium.url "${srcdir}/libsodium"
    
    sed -e 's/ -Werror//' -i Makefile
}

build() {
    cd lightning

    make
}

package() {
    cd lightning

    install -Dm755 -t "${pkgdir}/usr/bin" daemon/lightning{-cli,d} \
        contrib/lightning-{open-channel,pay}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" doc/*.1
    install -Dm644 -t "${pkgdir}/usr/share/man/man7" doc/*.7
}
