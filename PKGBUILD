pkgname=spencers-macro-git
pkgver=3.2.1.r270.g1c2e3c0
pkgrel=1
pkgdesc="Spencer Macro Utilities (git version)"
arch=('x86_64')
url="https://github.com/Spencer0187/Spencer-Macro-Utilities"
license=('GPL3')
provides=('spencers-macro')
conflicts=('spencer-macro')
depends=(
    'alsa-lib'
    'libpulse'
    'jack2'
    'sndio'
    'libx11'
    'libxext'
    'libxrandr'
    'libxcursor'
    'libxfixes'
    'libxi'
    'libxss'
    'libxtst'
    'libxkbcommon'
    'libdrm'
    'libxcb'
    'mesa'
    'dbus'
    'ibus'
    'systemd-libs'
    'libthai'
    'fribidi'
    'libglvnd'
)
makedepends=(
    'base-devel'
    'git'
    'cmake'
    'pkg-config'
    'go'
)
source=(
    "$pkgname::git+https://github.com/Spencer0187/Spencer-Macro-Utilities.git"
    "spencers-macro.desktop"
    "spencers-macro.png"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/$pkgname"
    local ver
    if ver=$(git describe --tags --long 2>/dev/null); then
        printf '%s' "$ver" | sed -E 's/^[vV]//; s/-([0-9]+)-g/.r\1.g/'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    export HOME="$srcdir/.gohome"
    export GOCACHE="$srcdir/.gocache"
    mkdir -p "$HOME" "$GOCACHE"

    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DSMU_BUNDLE_SDL3=ON \
        -DSMU_LINK_SDL3_STATIC=OFF
    cmake --build . --target package-linux-dir --parallel "$(nproc)"
}

package() {
    local pkgDir="$srcdir/$pkgname/build/SpencerMacroUtilities"
    local instDir="$pkgdir/usr/lib/spencers-macro"

    install -d "$instDir"
    cp -r "$pkgDir"/. "$instDir/"
    chmod 755 "$instDir/suspend" "$instDir/nethelper" 2>/dev/null || true

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/spencers-macro" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

NETHELPER_TMP="/tmp/nethelper-$(id -u)"

if ! pgrep -f "$NETHELPER_TMP" >/dev/null 2>&1; then
    rm -f "$NETHELPER_TMP"
    cp /usr/lib/spencers-macro/nethelper "$NETHELPER_TMP"
    chmod +x "$NETHELPER_TMP"
    pkexec "$NETHELPER_TMP" &
fi

cd /usr/lib/spencers-macro
exec /usr/lib/spencers-macro/suspend "$@"
EOF

    install -Dm644 "$srcdir/spencers-macro.desktop" "$pkgdir/usr/share/applications/spencers-macro.desktop"
    install -Dm644 "$srcdir/spencers-macro.png" "$pkgdir/usr/share/pixmaps/spencers-macro.png"
}
