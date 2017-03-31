# Maintainer: NBonaparte <NBonaparte@protonmail.com>

_pkgparent=plasma-workspace
_pkgname=xembed-sni-proxy
pkgname=$_pkgname-git
pkgver=v5.9.4.r182.gbf19dbba
pkgrel=1
pkgdesc="Convert XEmbed system tray icons to SNI icons"
arch=('i686' 'x86_64')
url="https://github.com/KDE/plasma-workspace"
license=('GPL' 'LGPL')
depends=('kwindowsystem' 'libxtst')
makedepends=('extra-cmake-modules' 'git')
conflicts=($_pkgparent)
source=("git+${url}.git" "cmake.patch")
sha256sums=('SKIP'
            '215090152973a85e9757bbab3de05020a1f44b1032db1c816d4e381f4f9d1c73')

pkgver() {
    cd $_pkgparent
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    patch -p0 -i "$srcdir/cmake.patch"
}

build() {
    cd $srcdir/$_pkgparent/$_pkgname
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DKDE_INSTALL_LIBDIR=lib \
	-DKDE_INSTALL_LIBEXECDIR=lib \
	-DBUILD_TESTING=OFF
    make
}

package() {
    cd $srcdir/$_pkgparent/$_pkgname
    make DESTDIR=$pkgdir install
}
