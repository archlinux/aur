# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation-openmw
_pkgname=recastnavigation
_pkgver=1.6.0
pkgver=1.6.0.r832.c393777d
pkgrel=2
epoch=1
pkgdesc="Navigation-mesh Toolset for openmw"
url="https://github.com/recastnavigation/recastnavigation"
arch=('x86_64' 'aarch64')
license=('Zlib')
makedepends=(git cmake sdl2 glut)
# use https://github.com/recastnavigation/recastnavigation/commit/c393777d26d2ff6519ac23612abf8af42678c9dd
# https://gitlab.com/OpenMW/openmw/-/issues/7457 for more info
source=("git+https://github.com/recastnavigation/recastnavigation.git#commit=c393777d26d2ff6519ac23612abf8af42678c9dd")
sha256sums=("SKIP")
conflicts=('recastnavigation')
options=(debug strip)

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    # an adjustment of the example in wiki usable when upstream doesn't use tags (or neglects to maintain them)
}

build() {
    cmake \
        -B _build \
        -S "$srcdir/$_pkgname"  \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D BUILD_SHARED_LIBS=ON \
        -D RECASTNAVIGATION_DEMO=OFF \
        -D RECASTNAVIGATION_TESTS=OFF \
        -D RECASTNAVIGATION_EXAMPLES=OFF \
        -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    VERBOSE=1 make -C _build
}

package() {
depends=(gcc-libs glibc sdl2 glut)
    make DESTDIR="$pkgdir" -C _build install
    install -Dm644 "$srcdir"/$_pkgname/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
