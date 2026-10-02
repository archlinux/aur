# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=matedit-bin
pkgver=20261002
pkgrel=5
pkgdesc="Material editor for PrimeXT"
arch=('x86_64')
url="https://github.com/hgruntt/MatEdit"
license=('GPL-3.0-only')
depends=('libglvnd')
provides=('matedit')
conflicts=('matedit')

source=(
    "MatEdit-linux-x64-gcc-20261002-5.tar.gz::https://github.com/hgruntt/MatEdit/releases/download/nightly/MatEdit-linux-x64-gcc-20261002-5.tar.gz"
    "icon.png::https://raw.githubusercontent.com/hgruntt/MatEdit/main/icon.png"
)

sha256sums=('8944de6de962dba09e713b46aa9174b582f231c7b11f8aa55660b24882d12f36' 'SKIP')

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