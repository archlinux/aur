# Maintainer: Jonathan la Cour <jon@lacour.me>
# Contributor: Pieter Kokx <pieter@kokx.nl>
pkgname=armory-git
pkgver=v0.93.3.r8.g1c71901
pkgrel=1
pkgdesc="Full-featured Bitcoin wallet management application"
arch=('i686' 'x86_64')
url="https://github.com/goatpig/BitcoinArmory"
license=('AGPL3')
depends=('crypto++' 'swig' 'python2' 'twisted' 'qt4' 'python2-pyqt4' 'python2-bsddb' 'python2-psutil')
makedepends=('git' 'gcc' 'make')
optdepends=('bitcoin-daemon: Communicate with the Bitcoin network')
install="${pkgname}.install"
provides=('armory')
conflicts=('armory')
source=("$pkgname"::'git+https://github.com/goatpig/BitcoinArmory.git'
        'run-armory.sh'
        'makefile-01.patch')
noextract=()
sha256sums=('SKIP'
            '4b8ab285588ec07601fb4d9580b84e11a513635a102d92ee7c283261d0b6c0dc'
            '5091c0e66bba8bb2daff320224dc3643279d2d5e014ac52a880b7e20ee67dd91')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    patch -p0 -i $srcdir/makefile-01.patch
    make
}

package() {
    install -Dm644 "$srcdir/$pkgname/dpkgfiles/armory.desktop" "$pkgdir/usr/share/applications/armory.desktop"
    install -Dm644 "$srcdir/$pkgname/dpkgfiles/armoryoffline.desktop" "$pkgdir/usr/share/applications/armoryoffline.desktop"
    install -Dm644 "$srcdir/$pkgname/dpkgfiles/armorytestnet.desktop" "$pkgdir/usr/share/applications/armorytestnet.desktop"
    install -Dm644 "$srcdir/$pkgname/img/armory_icon_64x64.png" "$pkgdir/usr/share/armory/img/armory_icon_64x64.png"
    install -Dm644 "$srcdir/$pkgname/img/armory_icon_green_64x64.png" "$pkgdir/usr/share/armory/img/armory_icon_green_64x64.png"

    install -Dm 755 "$srcdir/run-armory.sh" "$pkgdir/usr/bin/armory"

    mkdir -p "$pkgdir/opt"
    cp -R "$srcdir/$pkgname/" "$pkgdir/opt/"

    rm -rf "$pkgdir/opt/$pkgname/cppForSwig/"
    rm -rf "$pkgdir/opt/$pkgname/.git/"
    rm -rf "$pkgdir/opt/$pkgname/.gitignore"
}
