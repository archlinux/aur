# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=phoenix-x-server-git
pkgver=r152.ced5dac
pkgrel=1
pkgdesc='A new X server written from scratch designed to be a modern alternative to the Xorg server (git version)'
arch=('x86_64')
url='https://git.dec05eba.com/phoenix/'
license=('GPL-3.0-only')
depends=(
    'glibc'
    'libdrm'
    'libgl'
    'libxcb')
makedepends=(
    'git'
    'zig-bin0.14')
provides=('phoenix-x-server')
conflicts=('phoenix-x-server')
source=('phoenix-x-server'::'git+https://repo.dec05eba.com/phoenix'
        '010-phoenix-add-pie.patch')
sha256sums=('SKIP'
            '6d73db9a2c35354f2984e0643f2e98ef938305978a7ced3b5da2559f379d32d0')

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
    zig-0.14 build -Doptimize='ReleaseSafe' --verbose
}

package() {
    cd phoenix-x-server
    zig-0.14 build install -p "${pkgdir}/usr" -Doptimize='ReleaseSafe'
}
