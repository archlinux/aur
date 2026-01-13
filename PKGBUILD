# Maintainer: Zhenxi
pkgname=klit-unstable
pkgver=1.0.0 # Not the Klit version but the aur package version
pkgrel=1
pkgdesc="The successor to BaoBao. A modern, privacy-focused client for the e621 community (unstable/development version). Source: https://gitlab.com/Openlyst/klit"
arch=('x86_64')
url="https://gitlab.com/Openlyst/klit"
license=('AGPL3')
depends=(
    'gtk3'
    'mpv'
)
makedepends=(
    'flutter'
    'git'
    'clang'
    'cmake'
    'ninja'
    'pkg-config'
)
optdepends=()
provides=('klit')
conflicts=('klit')
options=('!strip')
source=("${pkgname}::git+https://gitlab.com/Openlyst/klit.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    grep '^version:' pubspec.yaml | sed 's/version: //g' | cut -d'+' -f1 | tr -d ' '
}

build() {
    cd "${srcdir}/${pkgname}"
    
    # Build Flutter Linux release
    flutter pub get
    flutter build linux --release
}

package() {
    cd "${srcdir}/${pkgname}/build/linux/x64/release/bundle"

    # Install the entire bundle to /opt/klit-unstable (Flutter needs relative paths)
    install -d "${pkgdir}/opt/klit-unstable"
    
    # Install main executable
    install -Dm755 "klit" "${pkgdir}/opt/klit-unstable/klit"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/klit-unstable/lib"
    cp -r lib/* "${pkgdir}/opt/klit-unstable/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/klit-unstable/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/klit-unstable.desktop" <<EOF
[Desktop Entry]
Name=Klit (Unstable)
Comment=A modern, privacy-focused client for the e621 community (unstable/development version)
Exec=/opt/klit-unstable/klit
Icon=klit-unstable
Type=Application
Categories=Network;Graphics;
Keywords=e621;booru;privacy;
EOF

    # Install icon (if available)
    if [ -f "data/flutter_assets/assets/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/klit-unstable.png"
    fi

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/klit-unstable/klit "${pkgdir}/usr/bin/klit-unstable"
}
