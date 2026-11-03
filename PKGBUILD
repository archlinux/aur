# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app
pkgver=7.0.1
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
    'libsecret'
    'desktop-file-utils'
)

makedepends=('ffmpeg')

install="${pkgname}.install"
options=('!debug')

source=(
    "anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip"
)

# Replace with the actual SHA-256 of the 7.0.1 archive.
sha256sums=('f4796904321a588166174a83cf3dcb1db3817745d1c7502bfb9916f2137686a4')

package() {
    cd "$srcdir"

    # Application files
    install -dm755 "$pkgdir/usr/lib/$pkgname"

    # Flutter application data
    cp -a data "$pkgdir/usr/lib/$pkgname/"

    # Only top-level shared libraries.
    # Exclude bundled mpv libraries and dependencies.
    install -dm755 "$pkgdir/usr/lib/$pkgname/lib"
    cp -a lib/*.so "$pkgdir/usr/lib/$pkgname/lib/"

    # Application binaries
    install -Dm755 "AniHot App" \
        "$pkgdir/usr/lib/$pkgname/anihot-app"

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

    # Original 1024x1024 icon
    local icon_name="com.anihot.anihot.png"
    local icon_dir="$pkgdir/usr/share/icons/hicolor"

    install -Dm644 \
        "$srcdir/share/icons/hicolor/1024x1024/apps/$icon_name" \
        "$icon_dir/1024x1024/apps/$icon_name"

    # Generate additional icon sizes using FFmpeg
    local src_icon="$icon_dir/1024x1024/apps/$icon_name"
    local size target

    for size in 48 128 256 512; do
        target="$icon_dir/${size}x${size}/apps/$icon_name"

        install -dm755 "$(dirname "$target")"

        ffmpeg -hide_banner -loglevel error -y \
            -i "$src_icon" \
            -vf "scale=${size}:${size}:flags=lanczos" \
            -frames:v 1 "$target" || return 1

        chmod 644 "$target"
    done

    # Preserve upstream multimedia license notices
    if [[ -d "$srcdir/share/licenses/libmpv" ]]; then
        install -dm755 "$pkgdir/usr/share/licenses/$pkgname/libmpv"

        cp -a "$srcdir/share/licenses/libmpv/." \
            "$pkgdir/usr/share/licenses/$pkgname/libmpv/"
    fi

    # Root license, if present
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
