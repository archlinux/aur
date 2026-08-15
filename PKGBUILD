# Maintainer: Kaiyasi <zengcode0315@gmail.com>
pkgname=fcitx5-ari-ime
pkgver=2.2.3
pkgrel=1
pkgdesc="Ari IME: Fcitx5 mixed Bopomofo/English input without mode switching"
arch=('x86_64')
url="https://github.com/kaiyasi/Ari-IME"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'hicolor-icon-theme' 'libchewing')
makedepends=('cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d625653b2a20dc278dbde3ab0857c4a30ff7f47f0da48eb90b62b03fbeccc48')

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
