# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=smw
pkgver=0.1
pkgrel=1
pkgdesc='A reverse engineered implementation of Super Mario World'
url='https://github.com/snesrev/smw'
arch=("x86_64")
license=("MIT")
depends=('python' 'sdl2')
source=(
    "${url}/archive/refs/tags/v${pkgver}.zip"
    "local://smw.sfc"
)
sha1sums=(
    'ffb75a8cd022a63a03d237190668ed487ac6e76d'
    '6b47bb75d16514b6a476aa0c73a683a2a4c18765'
)

build() {
    cp $srcdir/smw.sfc $srcdir/smw-${pkgver}
    cd $srcdir/smw-${pkgver}
    make -j$(nproc)
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cd $srcdir/smw-${pkgver}
    install -Dm755 smw $pkgdir/opt/$pkgname
    install -Dm644 smw.ini $pkgdir/opt/$pkgname
    install -Dm644 smw_assets.dat $pkgdir/opt/$pkgname

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./smw" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/smw
}
