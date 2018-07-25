# Maintainer: Naoya Inada <naoina@kuune.org>
pkgname=qtbrynhildr
pkgver=2.0.20
pkgrel=1
pkgdesc="Qt client for Brynhildr"
arch=('x86_64')
url="https://github.com/funfun-dc5/qtbrynhildr"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'libpulse' 'libvpx' 'celt')
makedepends=('git' 'python-sphinx')
source=(
    "${pkgname}-${pkgver}::git+https://github.com/funfun-dc5/qtbrynhildr.git#tag=v${pkgver//./}"
    "fix_paths.patch"
)
sha512sums=('SKIP'
            '9fd95f11e6574011c3e6fe7e0e1154c9156f48859c1747f0de94a732828f3f329a4b04140b25a758acb3c81f869e002e6203e206ac9ed892131840ab164b1148')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i ${srcdir}/fix_paths.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    qmake qtbrynhildr.pro
    make

    cd "$srcdir/$pkgname-$pkgver/src/keylayout"
    make

    cd "$srcdir/$pkgname-$pkgver/doc/manual"
    make
    make install
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p ${pkgdir}/opt/${pkgname}/bin
    install -D src/{QtBrynhildr,keylayout/klfc} "${pkgdir}/opt/${pkgname}/bin/"
    cp -r src/translations "${pkgdir}/opt/${pkgname}/bin/"

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/bin/QtBrynhildr ${pkgdir}/usr/bin/${pkgname}
    ln -s /opt/${pkgname}/bin/klfc ${pkgdir}/usr/bin/klfc

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm 644 dist/doc/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
    cp -r dist/doc/manual/{doctrees,html} ${pkgdir}/usr/share/doc/${pkgname}/
}
