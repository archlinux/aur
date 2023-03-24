# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=zelda3-git
pkgver=r312.a23632a
pkgrel=1
pkgdesc='A reverse engineered implementation of Zelda 3 - A Link to the Past'
url='https://github.com/snesrev/zelda3'
arch=("x86_64")
license=("MIT")
depends=('python' 'python-pillow' 'python-yaml' 'sdl2')
source=(
    "git+${url}.git"
    "local://zelda3.sfc"
)
sha256sums=(
    'SKIP'
    '66871d66be19ad2c34c927d6b14cd8eb6fc3181965b6e517cb361f7316009cfb'
)

pkgver() {
    cd $srcdir/zelda3
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/zelda3
    cp ../zelda3.sfc tables || \
    printf "\n\nNo ROM found! Copy your Zelda ROM to '$(realpath ..)' and rename it to 'zelda3.sfc'.\n"
}

build() {
    cd $srcdir/zelda3
    make -j$(nproc)
}

package() {
    cd $srcdir/zelda3
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 zelda3 $pkgdir/opt/$pkgname
    install -Dm644 zelda3.ini $pkgdir/opt/$pkgname
    install -Dm644 tables/zelda3_assets.dat $pkgdir/opt/$pkgname

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./zelda3" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/zelda3
}
