# Maintainer: trap000d <trap000d at gmail dot com>

pkgname=scratchjr-desktop-git
pkgver=r67.919482d
pkgrel=1
pkgdesc="Open source community port of ScratchJr for Desktop"
_srcname="ScratchJr-Desktop"
arch=('x86_64')
url="https://jfo8000.github.io/ScratchJr-Desktop/"
license=('BSD3')
depends=('electron' 'nodejs')
makedepends=('git' 'npm' 'electron')
source=("git+https://github.com/jfo8000/ScratchJr-Desktop.git"
        "https://github.com/jfo8000/ScratchJr-Desktop/commit/36cfeccb57bab10745038ce46148dea82d1561e8.patch"
        "ScratchJr.png"
        "ScratchJr.desktop")
sha256sums=("SKIP"
            "254e2623e880b95b02b00dc9a56fb499860732d9f1e52d2d11212b8670ff8e5e"
            "9f6e9d0f39ef3f78a5e72aae8c6ebf7c5e39b078398e4c1b154e80c492330981"
            "1c65aef078f056807550df9c8016512e26ae3902eccd8a905c55cc597443554c"
)

pkgver() {
    cd ${srcdir}/${_srcname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_srcname}
    # https://github.com/jfo8000/ScratchJr-Desktop/issues/39
    patch -p1 < "../36cfeccb57bab10745038ce46148dea82d1561e8.patch"
}
build() {
    cd ${srcdir}/${_srcname}
    npm install
    npm run package
}

package() {
    cd ${srcdir}/${_srcname}
    install -m755 -d $pkgdir/usr/{bin,share/{applications,pixmaps,ScratchJr}}
    install -D -m644 $srcdir/ScratchJr.desktop $pkgdir/usr/share/applications/scratchjr.desktop
    install -D -m644 $srcdir/ScratchJr.png $pkgdir/usr/share/pixmaps/ScratchJr.png
    cd "${srcdir}/${_srcname}/out/ScratchJr-linux-x64"
    cp -R "." "${pkgdir}/usr/share/ScratchJr"
    ln -sf /usr/share/ScratchJr/ScratchJr $pkgdir/usr/bin/ScratchJr
}
