# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=sm-git
pkgver=r94.578f90b
pkgrel=1
pkgdesc='A reverse engineered implementation of Super Metroid'
url='https://github.com/snesrev/sm'
arch=("any")
license=("MIT")
depends=('sdl2')
source=(
    "git+${url}.git"
    "local://sm.smc"
)
sha1sums=(
    'SKIP'
    'da957f0d63d14cb441d215462904c4fa8519c613'
)

pkgver() {
    cd $srcdir/sm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/sm
    make -j$(nproc)
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm644 sm.smc $pkgdir/opt/$pkgname
    cd $srcdir/sm
    install -Dm755 sm $pkgdir/opt/$pkgname
    install -Dm644 sm.ini $pkgdir/opt/$pkgname

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./sm" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/sm
}
