# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>
# Contributor: Haoyang Liu <tttturtleruss@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Torsten Wagner <tottiwagner@yahoo.de>

pkgname=openscad-qt6-git
_pkg="${pkgname%-qt6-git}"
pkgver=r11704.ee40fe5
pkgrel=1
pkgdesc="The programmers solid 3D CAD modeller, Qt6-enabled"
arch=('x86_64')
license=('GPL2')
url='https://github.com/openscad/openscad'
provides=("$_pkg")
conflicts=("$_pkg")
depends=(
    'boost-libs'
    'cgal'
    'libzip'
    'opencsg'
    'qscintilla-qt6'
    'qt6-5compat'
    'qt6-base'
    'qt6-svg'
    'qt6-multimedia'
    'double-conversion'
    'freetype2'
    'glib2'
    'harfbuzz'
    'fontconfig'
    'opencsg'
    'gmp'
    'mpfr'
    'tbb'
    'lib3mf'
)
makedepends=('git' 'boost' 'cmake' 'eigen' 'imagemagick' 'python')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
    # git -C "$_pkg" describe --long --tags | sed 's/^openscad-//;s/-/.r/;s/-/./'
    cd "$_pkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkg"
    sed -i 's/ping files.openscad.org/ping archlinux.org/' resources/CMakeLists.txt
    git submodule update --init --recursive
}

build() {
    cmake \
        -B build \
        -S "$_pkg" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DEXPERIMENTAL=ON \
        -DOFFLINE_DOCS=ON \
        -DUSE_QT6=ON \
        -Wno-dev
    cmake --build build
    cd "$_pkg/resources/icons/"
    convert openscad.png -resize 128x128\> openscad-128.png
}

check() {
    cd "$_pkg/scripts"
    echo $PWD
    ./check-dependencies.sh
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    cd "$_pkg"
    install -Dm644 "resources/icons/openscad.desktop" "$pkgdir/usr/share/applications/openscad.desktop"
    install -Dm644 "resources/icons/openscad-128.png" "$pkgdir/usr/share/pixmaps/openscad.png"
}
