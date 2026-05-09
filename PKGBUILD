# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=phoenix-x-server-git
pkgver=r311.c8dd856
pkgrel=1
_zigver=0.15.2
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
    'git')
provides=('phoenix-x-server')
conflicts=('phoenix-x-server')
source=('phoenix-x-server'::'git+https://repo.dec05eba.com/phoenix'
        "https://ziglang.org/download/${_zigver}/zig-${CARCH}-linux-${_zigver}.tar.xz"
        '010-phoenix-add-pie.patch')
sha256sums=('SKIP'
            '02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239'
            '860e482dfb485bcbd753d8d8715c980069176e16ccf22045eb7a29aeab6f8e08')

prepare() {
    patch -d phoenix-x-server -Np1 -i "${srcdir}/010-phoenix-add-pie.patch"
    
    local _zig_upstream_ver
    _zig_upstream_ver="$(grep -oE '[Zz]ig[[:space:]][0-9]+\.[0-9]+(|\.[[0-9]+)' phoenix-x-server/README.md | head -n1 | awk '{ print $2 }')"
    
    if [ "$_zigver" != "$_zig_upstream_ver" ]
    then
        printf '%s\n' "error: zig version in PKGBUILD must match the expected upstream version (${_zig_upstream_ver})"
        exit 1
    fi
}

pkgver() {
    ( set -o pipefail
        git -C phoenix-x-server describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.%s' "$(git -C phoenix-x-server rev-list --count HEAD)" "$(git -C phoenix-x-server rev-parse --short='7' HEAD)"
    )
}

build() {
    cd phoenix-x-server
    export PATH="${srcdir}/zig-${CARCH}-linux-${_zigver}${PATH:+":${PATH}"}"
    zig build -Doptimize='ReleaseSafe' --verbose
}

package() {
    cd phoenix-x-server
    export PATH="${srcdir}/zig-${CARCH}-linux-${_zigver}${PATH:+":${PATH}"}"
    zig build install -p "${pkgdir}/usr" -Doptimize='ReleaseSafe'
}
