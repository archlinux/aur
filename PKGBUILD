# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=autolock-git
_pkgname=autolock
pkgver=0.3.r2.g68f70aa
pkgrel=1
pkgdesc='A minimal X11 idle-watcher'
url='https://codeberg.org/ayari/autolock'
arch=(
    'x86_64'
    'aarch64'
)
license=('CC0-1.0')
depends=(
    'libx11'
    'libxss'
    'systemd-libs'
)
makedepends=(
    'gcc'
    'make'
    'patch'
    'git'
)
options=(!debug)
provides=('autolock')
conflicts=('autolock')
source=(
    "$_pkgname-main::git+$url.git"
    'systemd-libs.patch'
)
sha256sums=(
    'SKIP'
    '66ae860a0f428979a551b3a95026e53897ee5ec68ab5e23ccdd86287e0883858'
)

pkgver() {
    cd "$_pkgname-main"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname-main"
    patch -p1 < ../systemd-libs.patch
}

build() {
    cd "$_pkgname-main"
    export CC="${CC:-gcc}"
    make
}

package() {
    cd "$_pkgname-main"
    install -Dm755 autolock "${pkgdir}/usr/bin/autolock"
    install -Dm644 autolock.1 "${pkgdir}/usr/share/man/man1/autolock.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/autolock.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
