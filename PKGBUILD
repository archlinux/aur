# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: fuxter <fuxterz@gmail.com>
_name=linapple
pkgname=$_name-git
pkgver=2026.10.26.g7f4b6089
pkgrel=1
pkgdesc="Apple 2e emulator"
arch=(x86_64)
url="https://github.com/linappleii/linapple"
license=(GPL-2.0-only)
depends=(
    curl
    imagemagick
    libcurl-gnutls
    libzip
    nodejs
    sdl3
    sdl3_image
    zlib
    z3
)

makedepends=(
    cmake
    git
    ninja
)
provides=($_name)
conflicts=($_name)
source=($_name::git+https://github.com/linappleii/linapple.git)
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S $_name
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D FRONTEND=sdl3
        -D ENABLE_NATIVE=OFF
        -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    local excluded_tests=""
    local ctest_flags=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
    )
    ctest "${ctest_flags[@]}"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
