# Maintainer: aquova <mail at aquova dot net>

pkgname=zelda64recomp-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Static recompilation of Majora's Mask for PC"
url='https://github.com/Mr-Wiseguy/Zelda64Recomp'
arch=("x86_64" "aarch64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
makedepends=(unzip)
source=("zelda64recomp.desktop")
source_x86_64=("Zelda64Recompiled-v${pkgver}.zip::${url}/releases/download/v${pkgver}/Zelda64Recompiled-v${pkgver}-Linux-X64.zip")
source_aarch64=("Zelda64Recompiled-v${pkgver}.zip::${url}/releases/download/v${pkgver}/Zelda64Recompiled-v${pkgver}-Linux-ARM64.zip")

sha256sums=('78e993db9ddfca475599da78ccbef6140de6267de0f1da8917507e7cab3d872e')
sha256sums_x86_64=('de8b19cdb4e3ad0c10fd6d8127f7a6cc2a9eba106d89c753439178b718887c42')
sha256sums_aarch64=('2e49b96aced578363065e1764ca96eaa5590cb6f7e80efd10e8ce1a08462b933')

# Version 1.2.0 released as a .tar.gz inside of a .zip. This might not be needed for future releases
prepare() {
    cd $srcdir
    unzip "Zelda64Recompiled-v${pkgver}.zip"
    tar xf Zelda64Recompiled.tar.gz
}

package() {
    mkdir -p $pkgdir/usr/bin

    install -Dm755 $srcdir/Zelda64Recompiled $pkgdir/opt/$pkgname/${pkgname%-bin}
    install -Dm644 $srcdir/zelda64recomp.desktop -t $pkgdir/usr/share/applications/
    cp -r --preserve=mode $srcdir/assets $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/assets/mm-clipped.svg $pkgdir/usr/share/pixmaps/${pkgname%-bin}.svg

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./${pkgname%-bin}" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/${pkgname%-bin}
}
