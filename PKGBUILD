# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_pkgname=btdex
pkgname=btdex-git
pkgver=v0.1.21.r101.g1ef37cd
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
source=(git+https://github.com/btdex/btdex.git)
sha256sums=('SKIP')

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
    install -Dm644 ${_pkgname}/build/libs/btdex-all.jar $pkgdir/opt/${_pkgname}/btdex-all.jar
    install -Dm755 ${_pkgname}/dist/btdex.sh $pkgdir/opt/${_pkgname}/btdex.sh
    install -d $pkgdir/usr/bin
    ln -sf /opt/${_pkgname}/btdex.sh $pkgdir/usr/bin/btdex

    # Menu entry
    install -Dm644 ${_pkgname}/dist/btdex.desktop -t $pkgdir/usr/share/applications
    install -Dm644 ${_pkgname}/dist/btdex.ico $pkgdir/usr/share/pixmaps/${_pkgname}.ico
}
