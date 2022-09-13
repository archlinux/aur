# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=gepetto-viewer-corba
_pkgver=5.5.1
pkgname=${_pkgname}-git
pkgver=5.5.1.r648.a4cc0c8
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$_pkgname"
license=('BSD')
depends=('gepetto-viewer-git' 'python-omniorbpy')
makedepends=('cmake' 'boost' 'git')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git://github.com/gepetto/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --init
    mkdir build
}

build() {
    cd "$_pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

check() {
    cd "$_pkgname/build"
    make test
}

package() {
    cd "$_pkgname/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
