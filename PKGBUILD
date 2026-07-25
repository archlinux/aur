# Maintainer: Kaiyasi <zengcode0315@gmail.com>
pkgname=fcitx5-ari-ime
pkgver=2.0.1
pkgrel=1
pkgdesc="Ari IME: Fcitx5 mixed Bopomofo/English input without mode switching"
arch=('x86_64')
url="https://github.com/kaiyasi/Ari-IME"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'hicolor-icon-theme' 'libchewing')
makedepends=('cmake' 'extra-cmake-modules' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf023ace04508b15b6ada99adb70e7290dd9547f7e5949ea95f62e67701aab18')

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
