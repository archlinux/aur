# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_pkgname=btdex
pkgname=btdex-git
pkgver=v0.1.12.r25.g2f8d1e7
pkgrel=1
pkgdesc='Decentralized exchange system running on the Burst blockchain'
arch=(x86_64)
url='https://github.com/btdex/btdex'
license=(GPL3)
options=(!strip)
depends=(java-environment xdg-utils)
makedepends=(git java-environment)
conflicts=(btdex)
provides=(btdex)
install=btdex.install
source=(git+https://github.com/btdex/btdex.git
        btdex.sh
        btdex.desktop)
sha256sums=('SKIP'
            '162e5c9fad5d5a5e5a59192a64ce6d1a5bf189465eeae4130332b3838f4d9c11'
            'e388aac88eabf3fc35262672a4934a3c67761f54a9b0c49a73e3bb5ccde47419')


pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}
    ./gradlew shadowJar
}

package() {
    cd $srcdir

    install -d $pkgdir/opt/${_pkgname}
    install -Dm644 ${_pkgname}/build/libs/btdex-all.jar $pkgdir/opt/${_pkgname}/btdex.jar
    install -Dm755 btdex.sh $pkgdir/opt/${_pkgname}/btdex.sh
    install -d $pkgdir/usr/bin
    ln -sf $pkgdir/opt/${_pkgname}/btdex.sh $pkgdir/usr/bin/btdex

    # Menu entry
    install -Dm644 ${_pkgname}.desktop -t $pkgdir/usr/share/applications
    install -Dm644 ${_pkgname}/build/resources/main/icon.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
}
