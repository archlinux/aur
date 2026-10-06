# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=matedit-bin
pkgver=20261006
pkgrel=1
pkgdesc="Material editor for PrimeXT"
arch=('x86_64')
url="https://github.com/hgruntt/MatEdit"
license=('GPL-3.0-only')
depends=('libglvnd')
provides=('matedit')
conflicts=('matedit')

source=(
    "MatEdit-linux-x64-gcc-20261006-1.tar.gz::https://github.com/hgruntt/MatEdit/releases/download/nightly/MatEdit-linux-x64-gcc-20261006-1.tar.gz"
    "icon.png::https://raw.githubusercontent.com/hgruntt/MatEdit/main/icon.png"
)

sha256sums=('6c00faf6d8aff45e0845867dc0d38ac692654adfb7223fff5dae8e43f339766a' 'SKIP')

prepare() {
    mkdir -p "$srcdir/matedit"

    tar -xf "$srcdir/MatEdit-linux-x64-gcc-${pkgver}-${pkgrel}.tar.gz" \
        -C "$srcdir/matedit"

    if [[ ! -f "$srcdir/matedit/MaterialEditor" ]]; then
        error "MaterialEditor was not found in the release archive"
        return 1
    fi

    cat > "$srcdir/matedit.desktop" <<'EOF'
[Desktop Entry]
Name=MatEdit
GenericName=Material Editor
Comment=Material editor for PrimeXT
Exec=matedit-bin
Icon=matedit
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;Development;
StartupWMClass=MaterialEditor
EOF
}

package() {
    install -Dm755 \
        "$srcdir/matedit/MaterialEditor" \
        "$pkgdir/usr/bin/matedit-bin"

    install -Dm644 \
        "$srcdir/matedit.desktop" \
        "$pkgdir/usr/share/applications/matedit.desktop"

    install -Dm644 \
        "$srcdir/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/matedit.png"
}