# Maintainer: sfs sfslinux@gmail.com

pkgname=photon-studio-bin
pkgver=0.1.20
pkgrel=2
pkgdesc="A desktop local-first image editor with layers and native PSD support (Extracted from Flatpak)"
arch=('x86_64')
url="https://tenzen.studio/photon/"
license=('LicenseRef-Photon-Studio')

makedepends=('flatpak')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'atk'
    'gdk-pixbuf2'
    'gtk3'
    'libcups'
    'libsecret'
    'libx11'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
)
options=('!strip')

source=(
  #В России качайте через браузер с ...
  #Альтернатива https://www.techspot.com/downloads/7907-photon-studio.html
  "Photon-Studio-${pkgver}-linux-x64.flatpak::https://tenzen.studio/api/v1/photon/download?platform=linux&arch=x64"
   "photon-studio.png::https://tenzen.studio/assets/brand/photon-logo.png"
   "update.sh"
)
sha256sums=('SKIP'
            'd49bb3c106257c1f75995fa793737113dc87418be5bec19388e6a523ffaafc18'
            'c1ef24a0003e94bdcd17176e2e689aac6d224c31656733b64db2512baefabb1a'
            )

prepare() {
    cd "$srcdir"

    mkdir -p "$srcdir/fake-flatpak-home"

    echo "==> Extracting Photon Studio Flatpak..."

    FLATPAK_USER_DIR="$srcdir/fake-flatpak-home" \
        flatpak install \
        --user \
        --bundle \
        --noninteractive \
        --assumeyes \
        --no-deps \
        "$srcdir/Photon-Studio-${pkgver}-linux-x64.flatpak"
}

package() {
    local app_dir

    install -dm755 "$pkgdir/opt/photon-studio"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"

    install -Dm644 \
        "$srcdir/photon-studio.png" \
        "$pkgdir/usr/share/pixmaps/photon-studio.png"

    echo "==> Locating extracted application..."

    app_dir="$(
        find "$srcdir/fake-flatpak-home" \
            -type d \
            -path '*/app/*/*/*/*' \
            -print -quit
    )"

    if [[ -z "$app_dir" ]]; then
        echo "ERROR: Photon Studio application directory not found"
        exit 1
    fi

    echo "==> Application directory: $app_dir"

    if [[ ! -d "$app_dir/files/lib/com.tenzen.photon" ]]; then
        echo "ERROR: Photon Studio files directory not found"
        exit 1
    fi

    cp -a  --no-preserve=links \
        "$app_dir/files/lib/com.tenzen.photon/." \
        "$pkgdir/opt/photon-studio/"
    #
    # Desktop file
    #
    local desktop_file

    desktop_file="$(
        find "$srcdir/fake-flatpak-home" \
            -type f \
            -name '*.desktop' \
            -path '*/export/share/applications/*' \
            -print -quit
    )"

    if [[ -n "$desktop_file" ]]; then
        install -Dm644 \
            "$desktop_file" \
            "$pkgdir/usr/share/applications/photon-studio.desktop"

        sed -i \
            's|^Exec=.*|Exec=photon-studio %U|' \
            "$pkgdir/usr/share/applications/photon-studio.desktop"

        sed -i \
            's|^Icon=.*|Icon=photon-studio|' \
            "$pkgdir/usr/share/applications/photon-studio.desktop"
    else
        cat > "$pkgdir/usr/share/applications/photon-studio.desktop" <<'EOF'
[Desktop Entry]
Name=Photon Studio
Comment=Desktop image editor with layers and native PSD support
Exec=photon-studio %U
Terminal=false
Type=Application
Icon=photon-studio
Categories=Graphics;Photography;
MimeType=image/jpeg;image/png;image/webp;image/tiff;image/vnd.adobe.photoshop;
StartupWMClass=Photon Studio
EOF
    fi

    #
    # Exported icons
    #
    local icon_dir="$srcdir/fake-flatpak-home"

    if find "$icon_dir" \
        -type d \
        -path '*/export/share/icons/*' \
        -print -quit | grep -q .; then

        install -dm755 "$pkgdir/usr/share/icons"

        find "$icon_dir" \
            -type d \
            -path '*/export/share/icons/*' \
            -exec cp -a {} "$pkgdir/usr/share/icons/" \;
    fi

    #
    # Launcher
    #
    cat > "$pkgdir/usr/bin/photon-studio" <<'EOF'
#!/bin/sh
exec /opt/photon-studio/photon-studio "$@"
EOF

    chmod 755 "$pkgdir/usr/bin/photon-studio"

install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Photon Studio is proprietary software.

The applicable license terms are provided by the copyright holder,
Tenzen Studio.

Upstream:
https://tenzen.studio/photon/
EOF
}
