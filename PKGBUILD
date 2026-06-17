# Maintainer: Scalpel <scalpelpoe at gmail dot com>
# Contributor: Kristofers Solo <dev at kristofers dot xyz>

pkgname=scalpel-poe-git
pkgver=0.9.14.rc2.2.gd276a86
pkgrel=2
pkgdesc="Path of Exile's First Fourth-Party Tool"
arch=("x86_64")
url="https://github.com/scalpelpoe/scalpel"
license=("AGPL-3.0-only")
options=(!strip)
depends=(
    "fuse2"
)
makedepends=(
    "git"
    "nodejs-lts-jod"
    "npm"
    "python"
    "python-setuptools"
)
provides=("scalpel-poe")
conflicts=("scalpel-poe" "scalpel-poe-bin")
source=(
    "git+$url.git"
    "scalpel-poe.sh"
    "scalpel-poe.desktop"
)
sha256sums=("SKIP"
    "SKIP"
    "SKIP")

_check_node_version() {
    local major
    major="$(node -p 'process.versions.node.split(".")[0]')"

    if [[ "$major" != "22" ]]; then
        echo "error: Node.js 22 is required, got $(node --version)" >&2
        exit 1
    fi
}

_enter_builddir() {
    cd "$srcdir/scalpel" || return 1
    _check_node_version || return 1

    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
}

pkgver() {
    _enter_builddir

    git describe --tags --long | sed "s/^v//;s/-/./g"
}

prepare() {
    _enter_builddir

    npm ci
}

build() {
    _enter_builddir

    npm run build
    npx electron-builder --linux AppImage --x64 --publish never
}

package() {
    cd "$srcdir/scalpel"

    install -Dm755 "dist/Scalpel.AppImage" "$pkgdir/opt/scalpel-poe/Scalpel.AppImage"

    install -Dm755 "$srcdir/scalpel-poe.sh" "$pkgdir/usr/bin/scalpel-poe"
    install -Dm644 "$srcdir/scalpel-poe.desktop" "$pkgdir/usr/share/applications/scalpel-poe.desktop"
    install -Dm644 resources/icon.png "$pkgdir/usr/share/pixmaps/scalpel-poe.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
