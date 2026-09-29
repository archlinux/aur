# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=matedit-bin
pkgver=20260929
pkgrel=1
pkgdesc="Material editor for PrimeXT"
arch=('x86_64')
url="https://github.com/hgruntt/MatEdit"
license=('GPL-3.0-only')
depends=('libglvnd')
provides=('matedit')
conflicts=('matedit')

source=(
    "MatEdit-linux-x64-gcc-20260929-1.tar.gz::https://github.com/hgruntt/MatEdit/releases/download/nightly/MatEdit-linux-x64-gcc-20260929-1.tar.gz"
    "icon.png::https://raw.githubusercontent.com/hgruntt/MatEdit/main/icon.png"
)

sha256sums=('b706169643d7acdef5ec9ec78527c2415e1388cb449a89578feba3217507d710' 'SKIP')

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