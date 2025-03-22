# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
_pkgver=3.8.0
pkgver=${_pkgver}+2ccddd6
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator>=16.0.0' 'qtcreator<17.0.0'
    'hunspell' # Don't know why upstream binary does not link to hunspell but this does.
)
makedepends=(
    'cmake'
    'qtcreator-devel>=16.0.0' 'qtcreator-devel<17.0.0'
)
source=("$pkgname-${_pkgver}.tar.gzr::${url}/archive/v${_pkgver}.tar.gz"
        "qtcreator16.patch::https://github.com/CJCombrink/SpellChecker-Plugin/commit/2ccddd6.patch")
sha256sums=('9654af0e48ab39f34930669ce913a330f054eb2edf895a5bd63ff0f156edc823'
            '4cc6aa7964a6ba4720548273ca5d4138fa495f3534c61b416bc19ae4a16d0704')

prepare() {
    patch -d SpellChecker-Plugin-${_pkgver} -Np1 -i ../qtcreator16.patch
}

build() {
    cmake \
        -S SpellChecker-Plugin-${_pkgver} -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
