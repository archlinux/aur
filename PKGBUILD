# Maintainer: NBonaparte <NBonaparte@protonmail.com>

_pkgparent=plasma-workspace
_pkgname=xembed-sni-proxy
pkgname=$_pkgname-git
pkgver=v5.19.90.r124.g85bfb4fbf
pkgrel=1
pkgdesc="Convert XEmbed system tray icons to SNI icons"
arch=('i686' 'x86_64')
url="https://github.com/KDE/plasma-workspace"
license=('GPL')
depends=('kwindowsystem' 'libxtst')
makedepends=('extra-cmake-modules' 'git')
conflicts=($_pkgparent)
source=("git+${url}.git" "cmake.patch")
sha256sums=('SKIP'
            'b34212df6abe797161ea483c51e7dcd63d9ccd95a9dcd486649be5dbdb345ad9')

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
