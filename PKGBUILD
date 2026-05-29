# Maintainer: Aster O'Connor <archlinux dot anatomist477 at passmail dot net>
pkgname=libaero-qt-git
pkgver=r30.03bf5ee
pkgrel=1
pkgdesc="A library of reusable Aero-style widget components (QtWidgets and QML)"
arch=('x86_64')
url="https://gitgud.io/atmk/libaero-qt"
license=('unknown') # will update this if/when the author puts a license file in their repo
depends=(
    'qt6-base'
    'kwidgetsaddons'
    'kwindowsystem'
    'kcoreaddons'
    'kcompletion'
    'kio'
    'kconfig'
)
makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
)
options=('strip' '!debug')
provides=("libaero-qt")
conflicts=("libaero-qt")
source=(
    "${pkgname}::git+https://gitgud.io/atmk/libaero-qt.git"
    "slidingstackedwidget::git+https://github.com/Qt-Widgets/SlidingStackedWidget-1.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/libaero-qt-git"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    
    git submodule init deps/slidingstackedwidget
    git config submodule.deps/slidingstackedwidget.url "$srcdir/slidingstackedwidget"
    git -c protocol.file.allow=always submodule update deps/slidingstackedwidget
}

build() {
    cmake -B build -G Ninja -S "$pkgname" \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
