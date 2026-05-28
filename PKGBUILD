# Maintainer: Aspen Schneider <rendezvous71 at outlook dot com>
pkgname=swingby
pkgver=0.7.0
pkgrel=1
pkgdesc="A small GUI library for Wayland client programming - rendered with Skia"
arch=('x86_64')
url=""
license=('MIT')
depends=()
makedepends=(
    cmake
    ninja
    wayland-protocols
)
source=(
    "git+https://github.com/aspschn/swingby.git#tag=v${pkgver}"
)
sha256sums=(
    'SKIP'
)

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive --depth 1
}

build() {
    cd "$pkgname"

    # Generate Wayland protocols.
    ./gen-protocols.sh

    # Build Skia.
    make build-skia

    # CMake.
    mkdir build
    cd build
    cmake -DSWINGBY_DEBUG=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..

    # Build.
    make -j`nproc`

    # Build demos.
    cd "$srcdir/$pkgname/demos/sbgears"
    make
}

# check() {
#     echo $PWD > PWD
# }

package() {
    mkdir -p "${pkgdir}/usr"

    # Install the library and headers.
    cd "$srcdir/$pkgname"/build
    make DESTDIR="$pkgdir/" install

    # Install demos.
    install -D -m 755 "$srcdir/$pkgname"/demos/sbgears/a.out "${pkgdir}"/usr/bin/sbgears

    # Copy license files.
    install -D -m 644 "$srcdir/$pkgname"/LICENSE "${pkgdir}"/usr/share/licenses/swingby/LICENSE
    install -D -m 644 "$srcdir/$pkgname"/docs/licenses/LICENSE.skia "${pkgdir}"/usr/share/licenses/swingby/LICENSE.skia
    install -D -m 644 "$srcdir/$pkgname"/docs/licenses/LICENSE.eglgears "${pkgdir}"/usr/share/licenses/swingby/LICENSE.eglgears
}
