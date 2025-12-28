# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=phoenix-x-server-git
pkgver=r158.002d614
pkgrel=1
pkgdesc='A new X server written from scratch designed to be a modern alternative to the Xorg server (git version)'
arch=('x86_64')
url='https://git.dec05eba.com/phoenix/'
license=('GPL-3.0-only')
depends=(
    'glibc'
    'libdrm'
    'libgl'
    'libxcb'
    'libxkbcommon')
makedepends=(
    'git'
    'zig0.14')
provides=('phoenix-x-server')
conflicts=('phoenix-x-server')
source=('phoenix-x-server'::'git+https://repo.dec05eba.com/phoenix'
        '010-phoenix-add-pie.patch')
sha256sums=('SKIP'
            '3cab832e60a4dc7674a6abbdc39e437ec248e460b06a01cc34427621b4e85aa3')

prepare() {
    patch -d phoenix-x-server -Np1 -i "${srcdir}/010-phoenix-add-pie.patch"
}

pkgver() {
    ( set -o pipefail
        git -C phoenix-x-server describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.%s' "$(git -C phoenix-x-server rev-list --count HEAD)" "$(git -C phoenix-x-server rev-parse --short='7' HEAD)"
    )
}

build() {
    cd phoenix-x-server
    zig build -Doptimize='ReleaseSafe' --verbose
}

package() {
    cd phoenix-x-server
    zig build install -p "${pkgdir}/usr" -Doptimize='ReleaseSafe'
}
