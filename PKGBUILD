# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Jonathan la Cour <jon@lacour.me>
# Contributor: Pieter Kokx <pieter@kokx.nl>

pkgname=armory-goatpig-git
pkgver=v0.94.1.r1.g6fc4fe9
pkgrel=1
pkgdesc="Armory Bitcoin wallet, built from new, official github repo w/auto selection of current python2 version"
arch=('i686' 'x86_64')
url="https://github.com/goatpig/BitcoinArmory"
license=('AGPL3')
depends=('crypto++' 'swig' 'python2' 'twisted' 'qt4' 'python2-pyqt4' 'python2-bsddb' 'python2-psutil')
makedepends=('git' 'gcc' 'make')
optdepends=('bitcoin-daemon: Communicate with the Bitcoin network')
install="${pkgname}.install"
provides=('armory')
conflicts=('armory' 'armory-git')
source=("$pkgname"::'git+https://github.com/goatpig/BitcoinArmory.git'
        'run-armory.sh')
sha256sums=('SKIP'
            '4c4304986bfddc98c7bc8337857b078723e77413d4e1dd6c981e10573603ad77')
sha512sums=('SKIP'
            'b22c72524fdd5eac01949927abcbcf6c648e79d2f8caba51ae09d7678556f5d0ec3b0a63b9e9d44eba0a135398442fdeb28166a51e0773b02248f9a20b71d26c')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    ## Get Python2 Version
    _py2ver=$(pacman -Qi python2 | grep "Version" | sed 's/^Version\s*:\s//')
    cd "$srcdir/$pkgname"
    ## Build using current python2 version
    make -j$(nproc) PYVER=python${_py2ver%.*}
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
