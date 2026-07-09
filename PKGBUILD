# Maintainer: MiguVT <contacto@miguvt.com>

pkgname=marmalade-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="MediaPipe tracking bridge for Linux with CLI, GTK3 and GTK4 binaries"
arch=('x86_64')
url="https://github.com/RanAwaySuccessfully/marmalade"
license=('MIT')
options=('!strip')
depends=('glibc' 'gtk3' 'gtk4' 'libv4l' 'xdg-utils' 'pciutils')
optdepends=('cuda: For NVIDIA GPU acceleration (highly recommended for RTX cards)'
            'cudnn: Required for CUDA-based neural network acceleration')
provides=('marmalade')
conflicts=('marmalade')
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/RanAwaySuccessfully/marmalade/releases/download/v${pkgver}/marmalade.zip"
    "face_landmarker.task::https://storage.googleapis.com/mediapipe-models/face_landmarker/face_landmarker/float16/latest/face_landmarker.task"
    "marmalade_logo.svg::https://raw.githubusercontent.com/RanAwaySuccessfully/marmalade/refs/heads/main/internal/resources/icons/marmalade_logo.svg"
    "marmalade_logo.png::https://raw.githubusercontent.com/RanAwaySuccessfully/marmalade/refs/heads/main/internal/resources/icons/marmalade_logo.png"
    "marmalade_logo_256.png::https://raw.githubusercontent.com/RanAwaySuccessfully/marmalade/refs/heads/main/internal/resources/icons/marmalade_logo_256.png"
)
sha256sums=('bb0bee13eecb7c5cf8ec1d7b74f3e44611a8a20f903002c10ae535e520303b97'
            '64184e229b263107bc2b804c6625db1341ff2bb731874b0bcc2fe6544e0bc9ff'
            '79bf9e5e2d08616e9e6977c08962ad9fcfde5589909d5eb95a11c00af4a6e447'
            'c719ba5b9c7592d6b709d22532ac784e9d98e706310d19e17740e1a749e71f7f'
            'aca4f58ad63f02ad32c9ffb9acc120694ce0bea23306abdf42d71f1ce05106ff')

package() {
    install -d "${pkgdir}/usr/lib/marmalade"
    install -d "${pkgdir}/usr/share/marmalade"
    install -d "${pkgdir}/usr/bin"

    install -Dm755 "${srcdir}/marmalade" "${pkgdir}/usr/lib/marmalade/marmalade"
    install -Dm755 "${srcdir}/marmalade-gtk3" "${pkgdir}/usr/lib/marmalade/marmalade-gtk3"
    install -Dm755 "${srcdir}/marmalade-gtk4" "${pkgdir}/usr/lib/marmalade/marmalade-gtk4"
    cp -a "${srcdir}/lib" "${pkgdir}/usr/lib/marmalade/"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/usr/share/marmalade/config.json"

    cat > "${pkgdir}/usr/bin/marmalade" <<'EOF'
#!/bin/sh
state_dir="${XDG_CONFIG_HOME:-$HOME/.config}/marmalade"
mkdir -p "$state_dir"

if [ ! -e "$state_dir/config.json" ]; then
    install -m 600 /usr/share/marmalade/config.json "$state_dir/config.json"
fi

if [ ! -L "$state_dir/lib" ]; then
    rm -rf "$state_dir/lib"
    ln -s /usr/lib/marmalade/lib "$state_dir/lib"
fi

cd "$state_dir" || exit 1
exec /usr/lib/marmalade/marmalade "$@"
EOF

    cat > "${pkgdir}/usr/bin/marmalade-gtk3" <<'EOF'
#!/bin/sh
state_dir="${XDG_CONFIG_HOME:-$HOME/.config}/marmalade"
mkdir -p "$state_dir"

if [ ! -e "$state_dir/config.json" ]; then
    install -m 600 /usr/share/marmalade/config.json "$state_dir/config.json"
fi

if [ ! -L "$state_dir/lib" ]; then
    rm -rf "$state_dir/lib"
    ln -s /usr/lib/marmalade/lib "$state_dir/lib"
fi

cd "$state_dir" || exit 1
exec /usr/lib/marmalade/marmalade-gtk3 "$@"
EOF

    cat > "${pkgdir}/usr/bin/marmalade-gtk4" <<'EOF'
#!/bin/sh
state_dir="${XDG_CONFIG_HOME:-$HOME/.config}/marmalade"
mkdir -p "$state_dir"

if [ ! -e "$state_dir/config.json" ]; then
    install -m 600 /usr/share/marmalade/config.json "$state_dir/config.json"
fi

if [ ! -L "$state_dir/lib" ]; then
    rm -rf "$state_dir/lib"
    ln -s /usr/lib/marmalade/lib "$state_dir/lib"
fi

cd "$state_dir" || exit 1
exec /usr/lib/marmalade/marmalade-gtk4 "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/marmalade" \
              "${pkgdir}/usr/bin/marmalade-gtk3" \
              "${pkgdir}/usr/bin/marmalade-gtk4"

    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/marmalade-gtk3.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Marmalade (GTK 3)
Comment=MediaPipe tracking bridge for Linux
Exec=marmalade-gtk3
Icon=xyz.randev.marmalade
Terminal=false
Categories=Utility;Video;
StartupNotify=true
EOF

    cat > "${pkgdir}/usr/share/applications/marmalade-gtk4.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Marmalade (GTK 4)
Comment=MediaPipe tracking bridge for Linux
Exec=marmalade-gtk4
Icon=xyz.randev.marmalade
Terminal=false
Categories=Utility;Video;
StartupNotify=true
EOF

    install -Dm644 "${srcdir}/marmalade_logo.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xyz.randev.marmalade.svg"
    install -Dm644 "${srcdir}/marmalade_logo_256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xyz.randev.marmalade.png"
    install -Dm644 "${srcdir}/marmalade_logo.png" \
        "${pkgdir}/usr/share/pixmaps/xyz.randev.marmalade.png"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
