# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>

pkgname=kdevelop-clang-tidy-git
pkgver=r62.e36fbf4
pkgrel=1
pkgdesc="A plugin for KDevelop to support clang-tidy static analysis - Git build"
arch=('x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform-git' 'kdevelop-git' 'clang-tools-extra')
makedepends=('cmake' 'git')
source=(
    'git+git://anongit.kde.org/kdev-clang-tidy'
    'disable-tests.patch'
)
provides=('kdevelop-clang-tidy')
conflicts=('kdevelop-clang-tidy')
sha256sums=('SKIP' 'ad7fc6fd5348174ba6f144c01d786cb65de745614925a813948ef26d1fd4c58a')

pkgver() {
    cd "$srcdir/kdev-clang-tidy"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/kdev-clang-tidy"
    patch -i ../disable-tests.patch
}

build() {
    cd "$srcdir/kdev-clang-tidy"

    mkdir -p "$srcdir/build" && cd "$srcdir/build"

    cmake ../kdev-clang-tidy \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    make
}

package() {
    cd "$srcdir/build"

    make DESTDIR="$pkgdir/" install
}

