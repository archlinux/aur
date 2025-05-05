# Maintainer: aquova <mail at aquova dot net>

pkgname=zelda64recomp-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Static recompilation of Majora's Mask for PC"
url='https://github.com/Mr-Wiseguy/Zelda64Recomp'
arch=("x86_64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
makedepends=(unzip)
source=(
    "${url}/releases/download/v${pkgver}/Zelda64Recompiled-v${pkgver}-Linux-X64.zip"
)
sha256sums=(
    '80111d3166c0fdbfaa6434f9dca71a407068f6d51788c618425ed8f641ae4f4f'
)

# Version 1.2.0 released as a .tar.gz inside of a .zip. This might not be needed for future releases
prepare() {
    cd $srcdir
    unzip "Zelda64Recompiled-v${pkgver}-Linux-X64.zip"
    tar xf Zelda64Recompiled.tar.gz
}

package() {
    mkdir -p $pkgdir/usr/bin

    install -Dm755 $srcdir/Zelda64Recompiled $pkgdir/opt/$pkgname/${pkgname%-bin}
    install -Dm644 ../zelda64recomp.desktop -t $pkgdir/usr/share/applications/
    cp -r --preserve=mode $srcdir/assets $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/assets/mm-clipped.svg $pkgdir/usr/share/pixmaps/${pkgname%-bin}.svg

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./${pkgname%-bin}" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/${pkgname%-bin}
}
