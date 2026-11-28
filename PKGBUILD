# Maintainer: osch <oliver@luced.de>
pkgname=exiflite-git
pkgver=0.0.0.r2.ga412fa6
pkgrel=1
pkgdesc="Fast read-only C99 metadata reader that reports a small set of tags exactly as exiftool does"
arch=('x86_64' 'aarch64')
url="https://github.com/blitzview-org/exiflite"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('glibc')
makedepends=('git' 'cmake' 'ninja')
provides=('exiflite' 'libexiflite.so')
conflicts=('exiflite')
source=("$pkgname::git+https://github.com/blitzview-org/exiflite.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # the version in the header (ahead of the last tag once an incompatible
    # change is in), the commit count and hash: 0.1.0.r42.gc48b32e
    local v
    v=$(sed -n 's/^#define EXIFLITE_VERSION_\(MAJOR\|MINOR\|PATCH\) *\([0-9]*\)$/\2/p' src/exiflite.h | paste -sd.)
    printf '%s.r%s.g%s' "$v" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -S "$pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DEXIFLITE_BUILD_EXAMPLES=OFF
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
