# Maintainer: Martchus <martchus@gmx.net>
# decide whether to link against the deprecated Qt WebKit module (in qt5-webkit package ~40 MB) or
# the newer, chromium-based Qt WebEngine module (in qt5-webengine package ~100 MB)
_webviewprovider=qt5-webkit
_reponame=tageditor
pkgname=tageditor
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4 (iTunes), ID3, Vorbis and Matroska."
license=('GPL')
depends=('qt5-script' $_webviewprovider 'qtutilities' 'tagparser' 'desktop-file-utils' 'xdg-utils')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('d089b9e66616c39147b639639152c5848f59dafa2c0a9a77d0137fbed13a2af9')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    cfg=()
    if [[ _webviewprovider == qt5-webkit ]]; then
        cfg+=(forcewebkit)
    fi
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro" $(for val in "${cfg[@]}"; do echo -n "CONFIG+=$val "; done)
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
