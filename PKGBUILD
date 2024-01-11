# Maintainer: Can Altıparmak (c6parmak) <can6parmak <AT> gmail <DOT> com>

pkgname=tmxparser-git
pkgver=189.d314b31
pkgrel=1
pkgdesc="Library for parsing TMX files (Tiled Maps) using TinyXML's DOM interface."
url='https://github.com/sainteos/tmxparser'
license=('BSD')
depends=('tinyxml2' 'zlib')
makedepends=('git' 'cmake')
conflicts=('tmx-parser-svn')
arch=('i686' 'x86_64')
source=("$pkgname"::'git+https://github.com/sainteos/tmxparser.git' 'https://patch-diff.githubusercontent.com/raw/sainteos/tmxparser/pull/84.patch' 'https://patch-diff.githubusercontent.com/raw/sainteos/tmxparser/pull/85.patch')
md5sums=('SKIP'
         '89dd8b3999ac12c1542a8f80e9854e84'
         '88f0a4f39930afa553f3d0e4596d7ee9')
options=('staticlibs')


prepare() {
    cd $pkgname
    git apply ../84.patch
    git apply ../85.patch
}

pkgver() {
    cd "$pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib'
    make
}

package() {
    cd $pkgname/build
    make DESTDIR="$pkgdir/" install
    cd ..
    install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

