# Maintainer: FelixWeb <felixweb@example.com>
# Binary package — no compilation required.
# Source package (builds from source): felixweb-ide

pkgname=felixweb-ide-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="FelixWeb IDE — desktop IDE for the FelixWeb language (prebuilt binary)"
arch=('x86_64')
url="https://github.com/benzenma123/felixweb-ide"
license=('MIT')
provides=('felixweb-ide')
conflicts=('felixweb-ide')
# Runtime libraries required by Electron
depends=(
    'nss'
    'libxtst'
    'gtk3'
    'libxss'
    'alsa-lib'
    'at-spi2-atk'
    'libdrm'
    'mesa'
    'xdg-utils'
    'xdg-user-dirs'
)

source_x86_64=(
    "$pkgname-$pkgver-x86_64.tar.gz::https://github.com/benzenma123/felixweb-ide/releases/download/v$pkgver/felixweb-ide-$pkgver.tar.gz"
)

sha256sums_x86_64=('754913949fd61042f4acd527dfffa8674062903d5510f3e1a9201841beb26f5d')

package() {
    local srcdir_app="$srcdir/felixweb-ide-$pkgver"

    # ── App files → /usr/lib/felixweb-ide-bin/ ───────────────────────────────
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -a "$srcdir_app/." "$pkgdir/usr/lib/$pkgname/"

    # Make Electron binary executable
    chmod 755 "$pkgdir/usr/lib/$pkgname/felixweb-ide"

    # Fix chrome-sandbox SUID bit (required by Electron)
    if [[ -f "$pkgdir/usr/lib/$pkgname/chrome-sandbox" ]]; then
        chmod 4755 "$pkgdir/usr/lib/$pkgname/chrome-sandbox"
    fi

    # ── Wrapper script → /usr/bin/felixweb-ide ───────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/felixweb-ide" << 'WRAPPER'
#!/bin/sh
# Wrapper for FelixWeb IDE (binary package)
# Pass --no-sandbox if running as root in a container
exec /usr/lib/felixweb-ide-bin/felixweb-ide "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/felixweb-ide"

    # ── Desktop entry ─────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/felixweb-ide.desktop" << 'DESKTOP'
[Desktop Entry]
Name=FelixWeb IDE
GenericName=Web IDE
Comment=IDE for the FelixWeb HTML-alternative language
Exec=felixweb-ide %U
Icon=felixweb-ide
Terminal=false
Type=Application
Categories=Development;IDE;TextEditor;WebDevelopment;
MimeType=text/x-felixweb;
Keywords=felixweb;ide;html;web;code;editor;
StartupWMClass=felixweb-ide
StartupNotify=true
DESKTOP

    # ── Icon ──────────────────────────────────────────────────────────────────
    for size in 16 32 48 64 128 256; do
        local icon_src="$srcdir_app/resources/icons/${size}x${size}.png"
        if [[ -f "$icon_src" ]]; then
            install -Dm644 "$icon_src" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/felixweb-ide.png"
        fi
    done
    # Fallback: single icon from resources/
    if [[ -f "$srcdir_app/resources/icon.png" ]]; then
        install -Dm644 "$srcdir_app/resources/icon.png" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/felixweb-ide.png"
    fi

    # ── MIME type (.felix files) ──────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/mime/packages"
    cat > "$pkgdir/usr/share/mime/packages/felixweb-ide.xml" << 'MIME'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="text/x-felixweb">
    <comment>FelixWeb Source File</comment>
    <comment xml:lang="en">FelixWeb Source File</comment>
    <glob pattern="*.felix"/>
    <magic priority="50">
      <match type="string" offset="0" value="page("/>
    </magic>
    <icon name="felixweb-ide"/>
  </mime-type>
</mime-info>
MIME

    # ── License ───────────────────────────────────────────────────────────────
    if [[ -f "$srcdir_app/LICENSE" ]]; then
        install -Dm644 "$srcdir_app/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
