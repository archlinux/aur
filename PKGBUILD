# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation-openmw
_pkgname=recastnavigation
# since recastnavigation hasn't had an official release in a long time
# but is now in debian repos maintained by an openmw dev
# https://packages.debian.org/source/sid/recastnavigation
_pkgver=1.5.1
pkgver=1.5.1.r754.e75adf8
pkgrel=1
pkgdesc="Navigation-mesh Toolset for openmw"
url="https://github.com/recastnavigation/recastnavigation"
arch=(x86_64)
license=('Zlib')
makedepends=(git cmake sdl2 glut)
source=("git+https://github.com/recastnavigation/recastnavigation.git#commit=e75adf86f91eb3082220085e42dda62679f9a3ea")
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
		-D RECASTNAVIGATION_EXAMPLES=OFF
    VERBOSE=1 make -C _build
}

package() {
depends=(sdl2 glut)
    make DESTDIR="$pkgdir" -C _build install
    install -Dm644 "$srcdir"/$_pkgname/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
