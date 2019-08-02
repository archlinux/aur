# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: Erdbeerkaese <erdbeerkaese@gmx.net>
# Contributor: Michael Pfeuti

pkgname=texworks
pkgver=0.6.3
pkgrel=3
pkgdesc='A TeX IDE inspired by TeXShop.'
arch=('i686' 'x86_64')
url='https://www.tug.org/texworks/'
license=('GPL2')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'hunspell' 'poppler-qt5' 'qt5-script')
optdepends=('texlive-core: Support for typesetting'
            'lua: Support for Lua scripting/plugins'
            'python: Support for Python scripting/plugins')
makedepends=('cmake' 'lua' 'python' 'qt5-tools')
provides=('texworks')
conflicts=('texworks-svn')
source=("https://github.com/TeXworks/${pkgname}/archive/release-${pkgver}.tar.gz")
sha256sums=('b4695539b9666935d2c467cc618c7d79c174e2ec728e31f72df8534862a5c290')

prepare() {
    cd "$pkgname-release-$pkgver"
    sed -i 's/synctex_next_result/synctex_scanner_next_result/g' src/*.*
}

build() {
    cd "$pkgname-release-$pkgver"
    cmake \
        -DTW_BUILD_ID='AUR' \
        -DWITH_LUA='ON' \
        -DWITH_PYTHON='ON' \
        -DDESIRED_QT_VERSION:STRING=5 \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" .
    make
}

package() {
    cd "$pkgname-release-$pkgver"
    make DESTDIR="$pkgdir/" install

    for size in 48 128; do
      install -Dm644 res/images/TeXworks-doc-${size}.png \
              "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/mimetypes/text-x-tex.png
    done

    install -Dm644 res/images/TeXworks-128.png \
            "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/texworks.png
}
