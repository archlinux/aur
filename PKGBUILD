# Maintainer: MrHaku81 <haku81.kk@gmail.com>
#
# Linux support is experimental upstream:
#   https://github.com/pollen-robotics/reachy-mini-desktop-app/issues/35
#
# Three.js sRGBEncoding fix (PR #256, pending merge):
#   https://github.com/pollen-robotics/reachy-mini-desktop-app/pull/256
#
# Build note: `yarn tauri build` is required (NOT `cargo build`).
# Plain cargo produces ~35 MB without the embedded Vite/React frontend;
# tauri build produces the correct ~43 MB binary.

pkgname=reachy-mini-desktop-app
pkgver=0.9.29
pkgrel=1
pkgdesc="Desktop control application for Reachy Mini robot (simulation and hardware control)"
arch=('x86_64')
url="https://github.com/pollen-robotics/reachy-mini-desktop-app"
license=('Apache-2.0')
depends=(
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'hicolor-icon-theme'
)
optdepends=(
    'bluez: Bluetooth/BLE robot discovery'
    'xdotool: UI automation support'
)
makedepends=(
    'rust'
    'nodejs'
    'yarn'
    'base-devel'
    'openssl'
    'file'
    'librsvg'
    'webkit2gtk-4.1'
)
provides=('reachy-mini-control')
conflicts=('reachy-mini-control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pollen-robotics/reachy-mini-desktop-app/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9b6e7e2b960f6cc0b36446bc6b6670d8d826d9c06a552f4bd014ccaaf446eae')

prepare() {
    cd "reachy-mini-desktop-app-$pkgver"

    # THREE.sRGBEncoding was removed in Three.js r152; project uses ^0.181.0.
    # Remove once PR #256 is merged upstream.
    sed -i \
        's/outputEncoding: THREE\.sRGBEncoding/outputColorSpace: THREE.SRGBColorSpace/' \
        src/components/viewer3d/Viewer3D.jsx

    yarn install --frozen-lockfile

    # Build uv-trampoline sidecar from source — not included in GitHub tarball
    bash scripts/build/build-sidecar-unix.sh

    # Disable AppImage/deb bundle creation — pacman handles packaging.
    # bundle.active=false still produces the binary in target/release/.
    python3 -c "
import json, pathlib
p = pathlib.Path('src-tauri/tauri.conf.json')
c = json.loads(p.read_text())
c['bundle']['active'] = False
p.write_text(json.dumps(c, indent=2))
"
}

build() {
    cd "reachy-mini-desktop-app-$pkgver"

    # CachyOS CFLAGS (-fno-plt, -march=native) break ring's C assembly compilation.
    # Cargo/cc picks these up via the environment; clear them for a safe build.
    unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS

    # tauri build with bundling disabled — compiles binary + embeds frontend
    yarn tauri:build
}

package() {
    cd "reachy-mini-desktop-app-$pkgver"

    install -Dm755 src-tauri/target/release/reachy-mini-control \
        "$pkgdir/usr/bin/reachy-mini-control"

    # Python sidecar — Tauri resolves it relative to current_exe().parent()
    install -Dm755 src-tauri/target/release/uv-trampoline \
        "$pkgdir/usr/bin/uv-trampoline"

    # SSL fix resource — path mirrors Tauri's resource_dir() on Linux:
    # {exe_parent}/../lib/{productName}/_up_/scripts/
    install -Dm644 scripts/avast_ssl_fix.py \
        "$pkgdir/usr/lib/Reachy Mini Control/_up_/scripts/avast_ssl_fix.py"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/reachy-mini-desktop-app.desktop" << 'EOF'
[Desktop Entry]
Name=Reachy Mini Control
Comment=Reachy Mini Control Application
Exec=reachy-mini-control
Icon=reachy-mini-control
Terminal=false
Type=Application
MimeType=x-scheme-handler/reachymini
StartupWMClass=reachy-mini-control
StartupNotify=true
EOF

    install -Dm644 src-tauri/icons/32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/reachy-mini-control.png"
    install -Dm644 src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/reachy-mini-control.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/reachy-mini-control.png"

    install -Dm644 LICENCE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
