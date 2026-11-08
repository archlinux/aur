# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=satur8
pkgver=0.3.3
pkgrel=3
pkgdesc="Per-game digital vibrance for Linux: compositor/scanout saturation boost, never injected into the game"
arch=('x86_64')
url="https://github.com/NtrpyDev/satur8"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
# The KWin effect plugin is built against the local KWin/Qt ABI at build time.
# kwin>=6.8.0 is required for the OffscreenEffect::drawWindow signature patched
# in prepare() below.
makedepends=('rust' 'cmake' 'kwin>=6.8.0' 'qt6-base' 'qt6-declarative' 'kcoreaddons' 'kconfig')
optdepends=('kwin: KDE Plasma Wayland backend (saturation effect)'
            'gnome-shell: GNOME Wayland backend (Shell extension)'
            'gamescope: universal fallback backend for niche compositors'
            'nvidia-settings: NVIDIA X11 Digital Vibrance backend')
source=("$pkgname-v$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz"
        "0001-gui-proton-running-apps.patch"
        "0002-kwin-identity-black-screen.patch")
sha256sums=('9edc70b28e6a02e8c46790a56068745e10b624752ea818003f8a91f5c206f797'
            '0be723ef0f7ecab27448733b060d895cc2692d4f3ee9f987db7b7a43b8927ad5'
            'e13c7c75b091496e0ed99b494a239b0630f84f3bc80b96ba05ec81dff0ed31fa')

prepare() {
    cd "$pkgname-$pkgver"

    # Upstream v0.3.3 fixes that are still pending upstream releases:
    # the Wine-aware GUI picker (#14) and the KWin identity black screen (#15).
    patch -Np1 -i "$srcdir/0001-gui-proton-running-apps.patch"
    patch -Np1 -i "$srcdir/0002-kwin-identity-black-screen.patch"

    # KWin 6.8 changed OffscreenEffect::drawWindow to return bool. Apply the
    # compatibility change only while upstream still declares the old signature,
    # so a future upstream fix is not patched twice.
    if grep -q '^void Satur8Effect::drawWindow(' assets/kwin-effect/satur8_effect.cpp; then
        sed -i 's/^    void drawWindow(/    bool drawWindow(/' assets/kwin-effect/satur8_effect.h
        sed -i 's/^void Satur8Effect::drawWindow(/bool Satur8Effect::drawWindow(/' assets/kwin-effect/satur8_effect.cpp
        sed -i 's/^    KWin::OffscreenEffect::drawWindow(\(.*\));$/    return KWin::OffscreenEffect::drawWindow(\1);/' \
            assets/kwin-effect/satur8_effect.cpp
    fi

    # KWin 6.8 headers include <qqmlregistration.h>; add Qt6 Qml's include path.
    if ! grep -q 'COMPONENTS Core Gui DBus Qml' assets/kwin-effect/CMakeLists.txt; then
        sed -i 's/find_package(Qt6 REQUIRED COMPONENTS Core Gui DBus)/find_package(Qt6 REQUIRED COMPONENTS Core Gui DBus Qml)/' \
            assets/kwin-effect/CMakeLists.txt
        sed -i 's/^    Qt6::DBus$/    Qt6::DBus\n    Qt6::Qml/' assets/kwin-effect/CMakeLists.txt
    fi

    # KWin 6.x refuses to load a script package whose metadata.json lacks
    # KPackageStructure, logging "does not match requested format KWin/Script".
    # Without the focus forwarder, per-game profiles never follow focus.
    if ! grep -q '"KPackageStructure"' assets/kwin-script/metadata.json; then
        sed -i 's/^    "X-Plasma-API": "javascript",$/    "KPackageStructure": "KWin\/Script",\n    "X-Plasma-API": "javascript",/' \
            assets/kwin-script/metadata.json
    fi
}


build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
    cmake -S assets/kwin-effect -B build-kwin -DCMAKE_BUILD_TYPE=Release \
        -DVIBRANCE_PLUGIN_INSTALL_DIR="/usr/lib/qt6/plugins/kwin/effects/plugins"
    cmake --build build-kwin
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/satur8 "$pkgdir/usr/bin/satur8"
    install -Dm755 target/release/satur8-daemon "$pkgdir/usr/bin/satur8-daemon"
    install -Dm755 target/release/satur8-tray "$pkgdir/usr/bin/satur8-tray"
    install -Dm755 target/release/satur8-gui "$pkgdir/usr/bin/satur8-gui"

    # KWin effect (system Qt plugin path, where KWin scans).
    install -Dm755 build-kwin/satur8.so \
        "$pkgdir/usr/lib/qt6/plugins/kwin/effects/plugins/satur8.so"

    # KWin focus-forwarder script.
    install -d "$pkgdir/usr/share/kwin/scripts/satur8-focus"
    cp -r assets/kwin-script/. "$pkgdir/usr/share/kwin/scripts/satur8-focus/"

    # GNOME Shell extension.
    install -d "$pkgdir/usr/share/gnome-shell/extensions/satur8@satur8.github.io"
    cp -r assets/gnome-extension/satur8@satur8.github.io/. \
        "$pkgdir/usr/share/gnome-shell/extensions/satur8@satur8.github.io/"

    # gamescope fallback shader.
    install -Dm644 assets/gamescope/Satur8.fx \
        "$pkgdir/usr/share/gamescope/reshade/Shaders/Satur8.fx"

    # The shipped unit targets the per-user tarball install (~/.local/bin); for
    # the packaged install the daemon binary is in /usr/bin, so rewrite ExecStart.
    install -d "$pkgdir/usr/lib/systemd/user"
    sed 's|%h/.local/bin/satur8-daemon|/usr/bin/satur8-daemon|' \
        packaging/satur8-daemon.service \
        > "$pkgdir/usr/lib/systemd/user/satur8-daemon.service"
    install -Dm644 packaging/satur8.desktop "$pkgdir/usr/share/applications/satur8.desktop"
    install -Dm644 crates/satur8-gui/ui/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/satur8.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
