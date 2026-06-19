# Made by: aquova <austinbricker at protonmail dot com>
# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>

pkgname=zelda3reborn-beta-git
pkgver=r19.eb9600c
pkgrel=4
pkgdesc='A reverse engineered port of Zelda 3 - A Link to the Past with modern enhancements'
url='https://github.com/xander-haj/Z3R-Beta'
arch=("x86_64")
license=("MIT")
depends=('python' 'python-pillow' 'python-yaml' 'sdl2')
makedepends=('clang' 'git')
install="$pkgname.install"
source=(
    "git+${url}.git"
    # Zelda ROM should be named 'zelda3.sfc' and placed into the same directory as this file.
    "local://zelda3.sfc"
    "zelda3reborn-beta.desktop"
    "zelda3reborn-beta.png"
)
sha256sums=(
    'SKIP'
    '66871d66be19ad2c34c927d6b14cd8eb6fc3181965b6e517cb361f7316009cfb'
    '8cc1f455ee31659d458f4162e3a3c1f84b61f0c61eb95896b44449661cf6bf84'
    'bbc396aaee7cb9e4bc508863679929638b42cf0a1b1edb0bacb5c64224ddf148'
)

pkgver() {
    cd $srcdir/Z3R-Beta
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cp zelda3.sfc $srcdir/Z3R-Beta
    cd $srcdir/Z3R-Beta
    export CC='clang'
    make -j$(nproc)
}

package() {
    install -Dm644 $srcdir/zelda3reborn-beta.desktop -t $pkgdir/usr/share/applications
    cd $srcdir/Z3R-Beta
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm755 zelda3 $pkgdir/opt/$pkgname
    install -Dm644 zelda3_assets.dat $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/zelda3reborn-beta.png $pkgdir/opt/$pkgname

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./zelda3" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/zelda3
}
