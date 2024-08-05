# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=img2xterm-git
_pkgname=${pkgname%-git}
pkgver=1.0.r1.1
pkgrel=1
pkgdesc="Displays images on your 256-color terminal with Unicode block characters"
arch=(any)
url="https://github.com/denilsonsa/img2xterm"
license=('CC0')
makedepends=('help2man' 'git')
depends=('imagemagick' 'ncurses')
optdepends=('gimp: palette containing the upper 240 colours used in xterm')
options=(!emptydirs)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/denilsonsa/${_pkgname}#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  #git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    # build img2xterm
    cd "$srcdir/$_pkgname"
    make
    # build the GIMP palette
    cd "$srcdir/$_pkgname/extra"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr" install
    #install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 extra/xterm-256color.gpl "${pkgdir}/usr/share/${pkgname}/xterm-256color.gpl"
}

