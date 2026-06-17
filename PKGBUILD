# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=autolock-git
_pkgname=autolock
pkgver=0.1.r0.g0a24d70
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
    'a9ff995a37a5c84df46025df3ae96d2ab8b19b96968c8f1170ac7d7201210693'
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
