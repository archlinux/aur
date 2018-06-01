# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script-git
_pkgname=saw-script

pkgver=c3211c47
pkgver() {
    cd "$_pkgname"
    git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('ncurses' 'z3')
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
    git submodule update --init
    cabal new-build
}

package() {
    mkdir -p $pkgdir/usr/share/licenses/$_pkgname
    mkdir -p $pkgdir/usr/bin
    cd $srcdir/$_pkgname
    cp LICENSE $pkgdir/usr/share/licenses/$_pkgname
    find dist-newstyle -name "saw" -type f -exec ls -c {} + | head -n1 | xargs -I{} cp {} $pkgdir/usr/bin
}
