# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Jonathan la Cour <jon@lacour.me>
# Contributor: Pieter Kokx <pieter@kokx.nl>

pkgname=armory-goatpig-git
pkgver=v0.95.1.r2.gcc9eccf
pkgrel=1
pkgdesc="Armory Bitcoin wallet, built from new, official github repo w/auto selection of current python2 version"
arch=('i686' 'x86_64')
url="https://github.com/goatpig/BitcoinArmory"
license=('AGPL3')
depends=('crypto++' 'swig' 'python2' 'twisted' 'qt4' 'python2-pyqt4' 'python2-bsddb' 'python2-psutil')
makedepends=('git' 'gcc' 'make')
optdepends=('bitcoin-daemon: Communicate with the Bitcoin network')
install="${pkgname%-*-*}.install"
provides=('armory')
conflicts=('armory' 'armory-git')
source=("${pkgname%-*-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-*-*}"
    git describe --tags --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    ## Get Python2 Version
    _py2ver=$(pacman -Qi python2 | grep "Version" | sed 's/^Version\s*:\s//')
    cd "$srcdir/${pkgname%-*-*}"
    ## Build using current python2 version
    make -j"${nproc}" PYVER="python${_py2ver%.*}"
}

package() {
  cd "$srcdir/${pkgname%-*-*}"
  make install DESTDIR="$pkgdir"
}
