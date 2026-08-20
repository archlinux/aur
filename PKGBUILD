# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation-openmw
_pkgname=recastnavigation
_pkgver=1.6.0
pkgver=1.6.0.r876.03259f3
pkgrel=1
epoch=1
pkgdesc="Navigation-mesh Toolset forked for openmw"
url="https://github.com/OpenMW/recastnavigation"
arch=('x86_64' 'aarch64')
license=('Zlib')
makedepends=(git cmake sdl2-compat glu)
source=("git+https://github.com/OpenMW/recastnavigation.git#commit=03259f3287ff8330f0d66fcd98d022edddffaa97")
sha256sums=("SKIP")
conflicts=('recastnavigation')
options=(debug strip)

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    # an adjustment of the example in wiki usable when upstream doesn't use tags (or neglects to maintain them)
}

build() {
    local cmake_options=(
        -B _build
        -S "$srcdir/$_pkgname"
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
        -D RECASTNAVIGATION_DEMO=OFF
        -D RECASTNAVIGATION_TESTS=OFF
        -D RECASTNAVIGATION_EXAMPLES=OFF
)
    cmake "${cmake_options[@]}"
    cmake --build _build
}

package() {
depends=(libgcc libstdc++ glibc sdl2-compat glu)
    DESTDIR="$pkgdir" cmake --install _build
    install -Dm644 "$srcdir"/$_pkgname/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
