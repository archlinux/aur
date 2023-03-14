# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation-openmw
_pkgname=recastnavigation
# recastnavigation hasn't had an official release in a long time and openmw includes recast as external component
# foolowing them to determine which commit to use.
# for latest see https://gitlab.com/OpenMW/openmw/-/commit/35b2292e617bc1fbfe1e5f8351d77d3cd5906bdc
_pkgver=1.5.1
pkgver=1.5.1.r797.405cc09
pkgrel=1
pkgdesc="Navigation-mesh Toolset for openmw"
url="https://github.com/recastnavigation/recastnavigation"
arch=(x86_64)
license=('Zlib')
makedepends=(git cmake sdl2 glut)
source=("git+https://github.com/recastnavigation/recastnavigation.git#commit=405cc095ab3a2df976a298421974a2af83843baf")
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
