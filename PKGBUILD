# Contributor: rich_o <rich_o@lavabit.com>
# Maintainer: rich_o <rich_o@lavabit.com>

_pkgname="ncmpcpp"
pkgname="${_pkgname}-vim-git"
pkgver=1919.c8ee598
pkgrel=1
epoch=1
pkgdesc="An almost exact clone of ncmpc with some new features. Patched for vim-like keybindings."
arch=('i686' 'x86_64')
url="http://unkart.ovh.org/ncmpcpp/"
license=('GPL2')
depends=('ncurses' 'libmpdclient>=2.8' 'boost-libs')
makedepends=('git' 'boost' 'pkg-config')
optdepends=('curl: fetch lyrics'
    'taglib: tag editor'
    'fftw: frequency spectrum mode visualization'
    )
conflicts=('ncmpcpp' 'ncmpcpp-git' 'ncmpcpp-xdg-config' 'ncmpcpp-xdg-config-git' 'ncmpcpp-color')
install=${pkgname}.install
source=("git+git://repo.or.cz/${_pkgname}.git"
    '0001-vim-keybinds.patch')
sha256sums=('SKIP'
    '30883b028a54bd27b6a847e6da4bf0ac9ca242db2023fe85176228ab2c0a5ee6')

prepare() {
    cd "${_pkgname}"
    git apply "${srcdir}/0001-vim-keybinds.patch"
}

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${_pkgname}"
    ./autogen.sh BOOST_LIB_SUFFIX='' \
    --prefix=/usr \
    --enable-clock \
    --enable-outputs \
    --enable-visualizer
    make
} 

package() {
    cd "${_pkgname}"
    # make PREFIX=/usr DESTDIR="${pkgdir}" install
    make DESTDIR="$pkgdir/" install
    # find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
