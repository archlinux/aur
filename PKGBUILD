# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin-miner-git
pkgver=r211.8a2c2d7
pkgrel=1
pkgdesc='Standalone miner for grin'
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-miner'
license=('Apache')
depends=('openssl')
makedepends=('cmake' 'git' 'rust')
source=('git+https://github.com/mimblewimble/grin-miner.git'
        'git+https://github.com/tromp/cuckoo.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd grin-miner

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd grin-miner

    cuckoo='cuckoo-miner/src/cuckoo_sys/plugins/cuckoo'
    git submodule init "${cuckoo}"
    git config "submodule.${cuckoo}.url" "${srcdir}/cuckoo"
    git submodule update
}

build() {
    cd grin-miner

    cargo build --release
}

package() {
    cd grin-miner

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin-miner
    install -Dm755 -t "${pkgdir}/usr/lib/grin-miner" target/release/plugins/*
}
