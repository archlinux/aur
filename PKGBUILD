# Made by: aquova <austinbricker at protonmail dot com>
# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>

pkgname=sm_rewrite-git
pkgver=r161.5237873
pkgrel=1
pkgdesc='A reverse engineered port of Super Metroid'
url='https://github.com/testyourmine/sm_rewrite'
arch=("x86_64")
license=("MIT")
depends=('sdl2')
makedepends=('clang' 'git' 'ninja')
install="$pkgname.install"
source=(
    "git+${url}.git"
    # Super Metroid ROM should be named 'sm.smc' and placed into the same directory as this file.
    "local://sm.smc"
    "sm_rewrite.desktop"
    "sm_rewrite.png"
)
sha256sums=(
    'SKIP'
    '12b77c4bc9c1832cee8881244659065ee1d84c70c3d29e6eaf92e6798cc2ca72'
    'c6069751fec7333639fa4bf3fc8c56e6d2972a3158141362193547f451944a78'
    '444cd46db3f1e7619e04370d3c8e6aea28512d292fff849ad370004ee1915903'
)

pkgver() {
    cd $srcdir/sm_rewrite
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cp sm.smc $srcdir/sm_rewrite
    cd $srcdir/sm_rewrite
    cmake -G Ninja -B build
    cmake --build build --parallel
}

package() {
    install -Dm644 $srcdir/sm_rewrite.desktop -t $pkgdir/usr/share/applications
    cd $srcdir/sm_rewrite
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 build/sm $pkgdir/opt/$pkgname
    install -Dm666 sm.ini $pkgdir/opt/$pkgname
    install -Dm644 sm.smc $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/sm_rewrite.png $pkgdir/opt/$pkgname

    # The game doesn't use the XDG spec, and will only save the game in the local directory
    # Thus, we need to make a world writable folder until the developer allows
    mkdir $pkgdir/opt/$pkgname/saves
    chmod a+w $pkgdir/opt/$pkgname/saves

    echo "#!/usr/bin/env bash
    cd /opt/sm_rewrite-git
    ./sm" > sm_rewrite.sh
    install -Dm755 sm_rewrite.sh $pkgdir/usr/bin/sm_rewrite
}
