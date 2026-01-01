# Maintainer: Brycen Granville <brycengranville@outlook.com>
pkgbase=snapx
pkgname=(snapx snapx-ui)
pkgver=0.r4.0.makepkg.1.g5c6ddf7
pkgrel=1
pkgdesc="Screenshot tool that handles images, text, and video (fork of ShareX)"
arch=('x86_64' 'aarch64')
url="https://github.com/SnapXL/SnapX"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
    'dotnet-sdk>=10.0'
    'clang'
    'zlib'
)
source=("$pkgbase::git+https://github.com/SnapXL/SnapX.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgbase"
    ver=$(./build.sh --version | tail -n1)
    echo "$ver" | sed 's/-/./g; s/+/./g; s/\.\([0-9]\{1,\}\)\./.r\1./'
}


build() {
    cd "$pkgbase"
    export VERSION=$pkgver
    export PKGTYPE=ARCH
    git checkout -B develop
    ./build.sh --configuration Release
}

check() {
    cd "$pkgbase"
    Output/snapx/snapx --version
}

package_snapx() {
    depends=(
        'ffmpeg'
        'fontconfig'
        'freetype2'
        'openssl'
        'icu'
        'at'
        'sudo'
        'libxrandr'
        'libxcb'
        'dbus'
        'xdg-utils'
    )

    cd "$pkgbase"
    ./build.sh install --prefix /usr --dest-dir "${pkgdir}" --assembly snapx --skip compile
}

package_snapx-ui() {
    pkgdesc="Screenshot tool that handles images, text, and video (fork of ShareX). SnapX Avalonia-based UI (works best on X11)"
    depends=('snapx')

    cd "$pkgbase"
    ./build.sh install --prefix /usr --dest-dir "${pkgdir}" --assembly snapx-ui --skip compile
}
