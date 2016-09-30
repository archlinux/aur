# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script-git
_pkgname=saw-script

pkgver=cbeb831
pkgver() {
    cd "$_pkgname"
    git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('cvc4' 'libtinfo' 'java-environment' 'ncurses' 'cryptol')
makedepends=('cabal-install')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('saw-script')
provides=('saw-script')
md5sums=('SKIP')

source=('git://github.com/GaloisInc/saw-script.git')

build() {
    cd $srcdir/${_pkgname}
    cabal update
    hash stack || cabal install stack
    ln -fs stack.ghc-8.0-unix.yaml stack.yaml
    ./build-sandbox.sh -p
}

package() {
    mkdir -p $pkgdir/usr/share/licenses/$_pkgname
    mkdir -p $pkgdir/usr/bin
    cd $srcdir/$_pkgname
    cp LICENSE $pkgdir/usr/share/licenses/$_pkgname
    cp $(stack path --local-install-root)/bin/saw $pkgdir/usr/bin
}
