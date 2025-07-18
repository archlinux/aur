# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=zelda3-git
pkgver=r314.fbbb3f9
pkgrel=1
pkgdesc='A reverse engineered implementation of Zelda 3 - A Link to the Past'
url='https://github.com/snesrev/zelda3'
arch=("x86_64")
license=("MIT")
depends=('python' 'python-pillow' 'python-yaml' 'sdl2')
makedepends=('clang')
source=(
    "git+${url}.git"
    # Zelda ROM should be named 'zelda3.sfc' and placed into the same directory as this file.
    "local://zelda3.sfc"
    "zelda3.desktop"
)
sha256sums=(
    'SKIP'
    '66871d66be19ad2c34c927d6b14cd8eb6fc3181965b6e517cb361f7316009cfb'
    '5843a2a5ef5049bf0bec8b3e49e36eb5a5aad3c12c609799c03f9f08ac1dbcf1'
)

pkgver() {
    cd $srcdir/zelda3
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cp zelda3.sfc $srcdir/zelda3
    cd $srcdir/zelda3
    export CC='clang'
    make -j$(nproc)
}

package() {
    install -Dm644 $srcdir/zelda3.desktop -t $pkgdir/usr/share/applications
    cd $srcdir/zelda3
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 zelda3 $pkgdir/opt/$pkgname
    install -Dm644 zelda3.ini $pkgdir/opt/$pkgname
    install -Dm644 zelda3_assets.dat $pkgdir/opt/$pkgname

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./zelda3" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/zelda3
}
