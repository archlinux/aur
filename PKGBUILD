# Maintainer: Ladniy <https://github.com/Ladniy>
pkgname=shakal-git
pkgver=0.1.0.r15.4d7773d
pkgrel=1
pkgdesc='Qt 6 front end for one deliberately aggressive ffmpeg degradation preset'
arch=('x86_64')
url='https://github.com/Ladniy/shakal'
license=('MIT')
depends=('qt6-base' 'ffmpeg' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=('git+https://github.com/Ladniy/shakal.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd shakal || exit 1
    local tag
    tag=$(git describe --tags --abbrev=0 2>/dev/null) || tag=v0.1.0
    printf '%s.r%s.%s' "${tag#v}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -S shakal -B build -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 shakal/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
