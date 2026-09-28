# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=matedit-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Material editor for PrimeXT (git version)"
arch=('x86_64')
url="https://github.com/hgruntt/MatEdit"
license=('GPL-3.0-only')
depends=('libglvnd')
makedepends=('git' 'cmake')
provides=('matedit')
conflicts=('matedit' 'matedit-bin')

source=(
    "git+https://github.com/hgruntt/MatEdit.git"
    "icon.png::https://raw.githubusercontent.com/hgruntt/MatEdit/main/icon.png"
)

sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/MatEdit"

    printf "r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cat > "$srcdir/matedit.desktop" <<'EOF'
[Desktop Entry]
Name=MatEdit
GenericName=Material Editor
Comment=Material editor for PrimeXT
Exec=matedit-git
Icon=matedit
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;Development;
StartupWMClass=MaterialEditor
EOF
}

build() {
    cmake \
        -S "$srcdir/MatEdit" \
        -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DGLFW_BUILD_WAYLAND=OFF \
        -DGLFW_BUILD_X11=ON

    cmake --build "$srcdir/build" --parallel
}

package() {
    install -Dm755 \
        "$srcdir/build/MaterialEditor" \
        "$pkgdir/usr/bin/matedit-git"

    install -Dm644 \
        "$srcdir/matedit.desktop" \
        "$pkgdir/usr/share/applications/matedit-git.desktop"

    install -Dm644 \
        "$srcdir/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/matedit.png"
}
