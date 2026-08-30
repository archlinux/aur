# Maintainer: Scalpel <scalpelpoe at gmail dot com>
# Contributor: Kristofers Solo <dev at kristofers dot xyz>

pkgname=scalpel-poe
pkgver=1.0.4
pkgrel=1
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
conflicts=("scalpel-poe-bin" "scalpel-poe-git")
_upstream_version="${pkgver/_/-}"
source=(
    "$pkgname-$_upstream_version.tar.gz::$url/archive/refs/tags/v$_upstream_version.tar.gz"
    "scalpel-poe.sh"
    "scalpel-poe.desktop"
)
sha256sums=('f256dc3568de4765d518c0fc422d48baad5a8a24c075a0ef38bdf86f84490a52'
            'aec6807cc11a1f0f172577d5d24744d457c2d52fd51c4b92d1e6b8bfbb943b1f'
            'be4904493f9322e59649768c209eeeed71ebf8f4f92321614967f749807794dc')

_check_node_version() {
    local major
    major="$(node -p 'process.versions.node.split(".")[0]')"

    if [[ "$major" != "22" ]]; then
        echo "error: Node.js 22 is required, got $(node --version)" >&2
        exit 1
    fi
}

_enter_builddir() {
    cd "$srcdir/scalpel-$_upstream_version" || return 1
    _check_node_version || return 1

    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
}

prepare() {
    _enter_builddir

    npm ci --allow-git=root
}

build() {
    _enter_builddir

    npm run build
    npx electron-builder --linux AppImage --x64 --publish never
}

package() {
    cd "$srcdir/scalpel-$_upstream_version"

    install -Dm755 "dist/Scalpel.AppImage" "$pkgdir/opt/scalpel-poe/Scalpel.AppImage"

    install -Dm755 "$srcdir/scalpel-poe.sh" "$pkgdir/usr/bin/scalpel-poe"
    install -Dm644 "$srcdir/scalpel-poe.desktop" "$pkgdir/usr/share/applications/scalpel-poe.desktop"
    install -Dm644 resources/icon.png "$pkgdir/usr/share/pixmaps/scalpel-poe.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
