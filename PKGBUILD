# Maintainer: Petr Mrázek <peterix@gmail.com>

pkgname=ur44-control-git
_pkgname=ur44-control
pkgver=0.1.0.r0.gd165e45
pkgrel=1
pkgdesc="Configure the DSP mixer and effects of the Steinberg UR44 audio interface (latest commit)"
arch=('x86_64' 'aarch64')
url="https://github.com/Dethware/UR-44"
license=('MS-PL')
depends=('qt6-base' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Dethware/UR-44.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # v0.1.0-3-gabc1234 -> 0.1.0.r3.gabc1234; before the first tag, r<commits>.<hash>
    ( set -o pipefail
      git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" )
}

build() {
    cmake -B build -S "$_pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

check() {
    QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # MS-PL isn't one of Arch's common licenses, so the package carries it (and the presets' notice)
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_pkgname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
