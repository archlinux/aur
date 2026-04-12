# Maintainer: mrksn <17046820+mrksn@users.noreply.github.com>
pkgname=streamdockd-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="StreamDock daemon — USB HID driver + web control UI for StreamDock macro pads"
arch=('x86_64')
url="https://github.com/mrksn/streamdockd"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pillow'
    'python-pyudev'
    'gcc-libs'       # libstdc++.so.6
    'systemd-libs'   # libudev.so.1
)
optdepends=(
    'librsvg: SVG icon support via rsvg-convert (recommended)'
    'imagemagick: alternative SVG icon support'
    'inkscape: alternative SVG icon support'
)
options=(!strip)  # bundled .so is precompiled — don't let makepkg strip it

# ── Sources ──────────────────────────────────────────────────────────────────
# libtransport.so is a precompiled closed-source binary from MiraboxSpace.
_sdk_commit=bc08f2cffceb03b01adda185d056c8e8c824a480

source=(
    "streamdockd-${pkgver}.tar.gz::https://github.com/mrksn/streamdockd/archive/refs/tags/v${pkgver}.tar.gz"
    "sdk-${_sdk_commit}.tar.gz::https://github.com/MiraboxSpace/StreamDock-Device-SDK/archive/${_sdk_commit}.tar.gz"
)
sha256sums=(
    '2af1e9206b09b03034f5fa21d810eaf6e23bf556d6fdc635e71314c7102888b1'
    '4c9db9f155fbaa8747914c36e12cf90e485b05c5a57bdf173a79ee1746c66266'
)

# ── Build (nothing to compile) ───────────────────────────────────────────────
build() {
    :
}

# ── Package ──────────────────────────────────────────────────────────────────
package() {
    local pkg_src="$srcdir/streamdockd-${pkgver}"
    local sdk_src="$srcdir/StreamDock-Device-SDK-${_sdk_commit}/Python-SDK"
    local lib="$pkgdir/usr/lib/streamdockd"

    # 1. SDK library tree from upstream → /usr/lib/streamdockd/
    install -dm755 "$lib"

    # Python SDK package
    cp -r "$sdk_src/src/StreamDock" "$lib/StreamDock"

    # Remove non-Linux and non-x86_64 binaries
    rm -f "$lib/StreamDock/Transport/TransportDLL/"*.dll \
          "$lib/StreamDock/Transport/TransportDLL/"*.lib \
          "$lib/StreamDock/Transport/TransportDLL/"*arm64* \
          "$lib/StreamDock/Transport/TransportDLL/"*dylib*

    # Fix permissions on the precompiled .so
    chmod 755 "$lib/StreamDock/Transport/TransportDLL/"*.so

    # Default button images
    install -dm755 "$lib/img"
    cp "$sdk_src/img/"* "$lib/img/"

    # 2. Daemon modules → /usr/lib/streamdockd/
    for f in streamdockd.py config.py icon_manager.py widgets.py device.py server.py; do
        install -m644 "$pkg_src/$f" "$lib/$f"
    done

    # 3. Static web UI → /usr/lib/streamdockd/
    install -m644 "$pkg_src/ui.html" "$lib/ui.html"

    # 4. Launcher → /usr/bin/streamdockd
    install -Dm755 "$pkg_src/streamdockd" "$pkgdir/usr/bin/streamdockd"

    # 5. systemd user service → /usr/lib/systemd/user/
    install -Dm644 "$pkg_src/streamdockd.service" \
        "$pkgdir/usr/lib/systemd/user/streamdockd.service"

    # 6. udev rules → /usr/lib/udev/rules.d/
    install -Dm644 "$pkg_src/99-streamdock.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-streamdock.rules"

    # 7. License (upstream MIT)
    install -Dm644 "$sdk_src/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
