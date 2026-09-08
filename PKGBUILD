# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app
pkgver=6.2.5
pkgrel=2
pkgdesc="Linux client for AniHot anime streaming app"
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')

depends=('glibc' 'gtk3' 'bash' 'sqlite' 'mpv')

install="${pkgname}.install"
options=('!debug')

source=(
    "anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip"
    "${pkgname}.install"
)

sha256sums=(
    '27287bd1ce55bf0707123f59567474d0c569ada68a2425ea0cd6cc9f90e8e41e'
    '0e036796aa22e8b8c0f11112c454651edea24ab5e4aedcb81536cbde1540c763'
)

package() {
    cd "$srcdir"

    # Do NOT install the built-in updater.
    # The updater may become out of sync with the AUR package version.

    # Application files
    install -d "$pkgdir/usr/lib/$pkgname"

    cp -r lib data "$pkgdir/usr/lib/$pkgname"

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
        "$srcdir/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png"

    # License, if present in the archive
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
