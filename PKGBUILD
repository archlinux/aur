# Maintainer: Kaiyasi <zengcode0315@gmail.com>
pkgname=fcitx5-ari-ime
pkgver=2.0.2
pkgrel=1
pkgdesc="Ari IME: Fcitx5 mixed Bopomofo/English input without mode switching"
arch=('x86_64')
url="https://github.com/kaiyasi/Ari-IME"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'hicolor-icon-theme' 'libchewing')
makedepends=('cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('baccbed480dbd2dc1714312a7de932471935e0f1c2cbfbd98e00ea03960a0110')

_srcdir="Ari-IME-$pkgver"

build() {
    local cmake_args=()
    if [[ -n "${CMAKE_CXX_COMPILER_LAUNCHER:-}" ]]; then
        cmake_args+=("-DCMAKE_CXX_COMPILER_LAUNCHER=$CMAKE_CXX_COMPILER_LAUNCHER")
    fi

    cmake -B "$srcdir/build" -S "$srcdir/$_srcdir" \
        "${cmake_args[@]}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=ON
    cmake --build "$srcdir/build"
}

check() {
    ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
