# Maintainer: Qingxu <me@linioi.com>
pkgname=dreamcoder
pkgver=1.0.16
pkgrel=1
pkgdesc='AI-powered coding assistant with semantic code search'
url='https://www.dreamcoder.ai'
arch=('x86_64')
license=(
    'LicenseRef-proprietary'
)
depends=(
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libgomp'
    'libstdc++'
    'zlib'
)
options=(
    '!strip'
    '!debug'
)
source=(
    "$pkgname-$pkgver-amd64.deb::https://www.dreamcoder.ai/downloads/files/public/$pkgver/linux-deb/dreamcoder-dreamcoder_${pkgver}_amd64.deb"
)
noextract=(
    "$pkgname-$pkgver-amd64.deb"
)
sha256sums=('add81b22741b71f34426a7651c449fe460c9790ab45190e3372e190472dfbeae')

package() {
    local _deb="$srcdir/$pkgname-$pkgver-amd64.deb"

    ar p "$_deb" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

    # Remove Debian APT repository and signing key files
    rm -rf "$pkgdir/etc"

    # Remove non-standard hicolor icon sizes not listed in hicolor index.theme
    rm -rf \
        "$pkgdir/usr/share/icons/hicolor/44x44" \
        "$pkgdir/usr/share/icons/hicolor/150x150" \
        "$pkgdir/usr/share/icons/hicolor/1024x1024"

    # Fix desktop entry: point Exec to /usr/bin/dreamcoder and use a valid main category
    sed -i \
        -e 's|^Exec=.*|Exec=/usr/bin/dreamcoder|' \
        -e 's|^Categories=.*|Categories=Development;|' \
        "$pkgdir/usr/share/applications/ai.dreamcoder.dreamcoder.desktop"

    # Normalize permissions
    chmod -R u=rwX,go=rX "$pkgdir"

    # Install proprietary EULA pointer and bundled third-party MIT license
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
DreamCoder is proprietary software by Polyhedron Investment Limited.
End User Licence Agreement: https://www.dreamcoder.ai/eula/
Licence Schedule: https://www.dreamcoder.ai/licence-schedule/
EOF
    install -Dm644 \
        "$pkgdir/usr/lib/dreamcoder/dreamcoder/dreamcoder/model_registry/LICENSE.models-dev.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.models-dev.txt"
}
