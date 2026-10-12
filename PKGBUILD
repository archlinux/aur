# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: fuxter <fuxterz@gmail.com>
_name=linapple
pkgname=$_name-git
pkgver=2026.10.10.g86bee1c2
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
source=(
    $_name::git+https://github.com/linappleii/linapple.git
    fix-cmake-etc.patch::https://patch-diff.githubusercontent.com/raw/linappleii/linapple/pull/364.patch
)
sha256sums=('SKIP'
            '2cad7ae52bbd536bb96750a6ed6b24d226aadb873da995cba7c23e7f4ff0f11f')

pkgver() {
    cd $_name
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

prepare() {
    # https://github.com/linappleii/linapple/issues/363
    patch -Np1 -d $_name < fix-cmake-etc.patch
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
