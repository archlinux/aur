# Maintainer: Marek Samec
pkgname=qt-msg-reader-git
pkgver=1.0.0.r0.g0000000
pkgrel=1
pkgdesc="A Qt-based application for reading Microsoft Outlook MSG files (git HEAD)"
arch=('x86_64')
url="https://github.com/mareksamec/qt-msg-reader"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'git')
provides=('qt-msg-reader')
conflicts=('qt-msg-reader')
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    # git describe's own exit status has to be checked directly - piping it
    # into sed and testing the pipe's exit status instead always "succeeds"
    # (sed doesn't fail on empty input), silently yielding an empty pkgver
    # whenever there's no tag reachable from HEAD (e.g. a shallow clone).
    if desc=$(git describe --long --tags 2>/dev/null); then
        printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${pkgname%-git}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
