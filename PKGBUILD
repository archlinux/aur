# Maintainer: Frank Mertens <frank at cyblogic dot de>

pkgbase=owlux
pkgname=(
    'owlux'
    'owlux_tools'
)
pkgver=1.0.0
pkgrel=4
pkgdesc="Yeelight smart LED control app"
url="https://github.com/frankencode/Owlux"
arch=('x86_64')
license=('GPL3')
source=(
    "$pkgbase-$pkgver.zip::https://github.com/frankencode/Owlux/archive/refs/tags/v${pkgver}.zip"
)
md5sums=(
    '846cff8a970df3a68c0d7e877cb51aa0'
)
sha1sums=(
    'c4da17f01aa5dde62bce2d6cb54abaeec75a6b55'
)

makedepends=(
    'corecomponents_tools'
    'corecomponents_core'
    'corecomponents_crypto'
    'corecomponents_glob'
    'corecomponents_meta'
    'corecomponents_network'
    'corecomponents_ux'
)

build() {
    ln -sf Owlux-$pkgver Owlux
    mkdir -p Owlux-$pkgver-build
    cd Owlux-$pkgver-build
    ccbuild -prefix=/usr -release ../Owlux
}

check() {
    cd Owlux-$pkgver-build
    ccbuild -prefix=/usr -release -test-run ../Owlux
}

package_owlux() {
    pkgdesc="$pkgdesc: protocol library"
    depends=(
        'corecomponents_core'
        'corecomponents_crypto'
        'corecomponents_glob'
        'corecomponents_meta'
        'corecomponents_network'
    )
    cd Owlux-$pkgver-build
    ccbuild -prefix=/usr -root="$pkgdir" -install -release ../Owlux/src
}

package_owlux_tools() {
    pkgdesc="$pkgdesc: gui app and tools"
    depends=('owlux' 'corecomponents_ux')
    install -Dm644 Owlux/tools/owlux/owlux.desktop -t "$pkgdir/usr/share/applications"
    cd Owlux-$pkgver-build
    ccbuild -prefix=/usr -root="$pkgdir" -install -release ../Owlux/tools
}
