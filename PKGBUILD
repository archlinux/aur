# Maintainer: Leonard Koenig <leonard.r.koenig@gmail.com>
_pkgname=beamercolortheme-owl
pkgname=${_pkgname}-git
pkgver=v0.1.1.r2.g189e749
pkgrel=1
pkgdesc="Theme that maximizes visibility in dark and unfavourable conditions"
url="https://github.com/rchurchley/${_pkgname}"
arch=("any")
license=("custom: none")
depends=("texlive-core")
source=("git+https://github.com/rchurchley/${_pkgname}.git"
	"0001-Makefile-fix-order-of-execution.patch")
install=${_pkgname}.install
sha512sums=('SKIP'
            'ff6a81df0035d76abcab1849a1625799fb716edd0d8802ea7f44e4a1a1a0bf3a68950c95d9fc42bc39b59052ac1b0c7201e9a22360f6436b3203baeef2ea4b47')

pkgver() {
    # Identify latest version.
    cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Fix Makefile dependencies / rule order of execution
    cd "$srcdir/${_pkgname}"
    git apply $srcdir/0001-Makefile-fix-order-of-execution.patch
}

build() {
    # Generate the style files.
    cd $srcdir/${_pkgname}
    make sty
}

package() {
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
    cd $srcdir/${_pkgname}
    make DESTDIR=$pkgdir/$TEXMFDIST install
}
