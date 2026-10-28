
# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app
pkgver=7.0.0
pkgrel=1
pkgdesc="Linux client for AniHot anime streaming app"
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')

depends=(
    'glibc'
    'gtk3'
    'bash'
    'sqlite'
    'mpv'
    'desktop-file-utils'
)

install="${pkgname}.install"
options=('!debug')

source=(
    "anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip"
)

sha256sums=(
    '2b4057ad9d56d9a52ec27884b1d16530c9d65389efc17b179c207accdf52ba3d'
)

package() {
    cd "$srcdir"

    # Application files
    install -d "$pkgdir/usr/lib/$pkgname"

    # Copy application data
    cp -a data "$pkgdir/usr/lib/$pkgname/"

    # Copy top-level application libraries only.
    # Exclude bundled mpv and its dependencies from lib/mpv/.
    install -d "$pkgdir/usr/lib/$pkgname/lib"
    cp -a lib/*.so "$pkgdir/usr/lib/$pkgname/lib/"

    # Main application binary
    install -Dm755 "AniHot App" \
        "$pkgdir/usr/lib/$pkgname/anihot-app"

    # CLI client
    install -Dm755 "ahcli" \
        "$pkgdir/usr/lib/$pkgname/ahcli"

    # GUI launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/anihot" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
export LD_LIBRARY_PATH="/usr/lib/anihot-app/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec ./anihot-app "$@"
EOF

    # CLI launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/ahcli" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
export LD_LIBRARY_PATH="/usr/lib/anihot-app/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec ./ahcli "$@"
EOF

    # Desktop entry
    install -Dm644 \
        "$srcdir/share/applications/com.anihot.anihot.desktop" \
        "$pkgdir/usr/share/applications/com.anihot.anihot.desktop"

    # Application icon
    install -Dm644 \
        "$srcdir/share/icons/hicolor/1024x1024/apps/com.anihot.anihot.png" \
        "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/com.anihot.anihot.png"

    # Preserve licenses for the multimedia libraries,
    # even though the bundled mpv libraries are not installed.
    if [[ -d "$srcdir/share/licenses/libmpv" ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname/libmpv"
        cp -a "$srcdir/share/licenses/libmpv/." \
            "$pkgdir/usr/share/licenses/$pkgname/libmpv/"
    fi

    # Root license, if present
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
