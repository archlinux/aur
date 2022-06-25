# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=mold-git
pkgver=v1.3.0_14_gd9a28221
pkgrel=1
pkgdesc="A Modern Linker"
arch=(x86_64)
url="https://github.com/rui314/mold"
license=("AGPL3")
# xxhash is bundled
depends=('gcc-libs' 'mimalloc' 'openssl' 'zlib' 'tbb')
makedepends=('git' 'python' 'clang')
source=("mold::git+https://github.com/rui314/mold")
sha256sums=('SKIP')
provides=("mold=$pkgver")
conflicts=("mold")
options=('debug')
reponame="mold"

pkgver() {
    cd "$reponame"
    git describe --long --tags | sed "s/-/_/g"
}

prepare() {

    cd "$reponame"

    # use /usr/lib instead of /usr/libexec
    sed -i "s/libexec/lib/" Makefile
}

build() {

    make \
        -C "$reponame" \
        CXX=clang++ \
        PREFIX=/usr \
        LTO=1 \
        SYSTEM_MIMALLOC=1 \
        SYSTEM_TBB=1
}

check() {

    cd "$reponame"

    make \
        CXX=clang++ \
        PREFIX=/usr \
        LTO=1 \
        SYSTEM_MIMALLOC=1 \
        SYSTEM_TBB=1 \
        check
}

package() {
    make \
        -C "$reponame" \
        CXX=clang++ \
        PREFIX=/usr \
        LTO=1 \
        SYSTEM_MIMALLOC=1 \
        SYSTEM_TBB=1 \
        DESTDIR="$pkgdir" \
        install
}
