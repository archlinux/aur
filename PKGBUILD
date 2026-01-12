# Maintainer: Zhenxi
pkgname=doudou-unstable
pkgver=1.0.0
pkgrel=1
pkgdesc="Stream your music with ease and style (unstable/development version). Source: https://gitlab.com/Openlyst/doudou"
arch=('x86_64')
url="https://gitlab.com/Openlyst/doudou"
license=('GPL3')
depends=('mpv' 'gtk3' 'libmpv.so')
makedepends=('git' 'flutter' 'clang' 'cmake' 'ninja' 'pkgconf')
optdepends=()
provides=()
conflicts=()
options=('!strip')
source=("${pkgname}::git+https://gitlab.com/Openlyst/doudou.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # Fetch version from pubspec.yaml
    grep '^version:' pubspec.yaml | sed 's/version: //g' | cut -d'+' -f1 | tr -d ' '
}

prepare() {
    cd "${srcdir}/${pkgname}"
    
    # Get Flutter dependencies
    flutter pub get
    
    # Generate localization files
    flutter gen-l10n || true
}

build() {
    cd "${srcdir}/${pkgname}"
    
    # Build the Linux release
    flutter build linux --release
}

package() {
    cd "${srcdir}/${pkgname}/build/linux/x64/release/bundle"

    # Install the entire bundle to /opt/doudou-unstable (Flutter needs relative paths)
    install -d "${pkgdir}/opt/doudou-unstable"
    
    # Install main executable
    install -Dm755 "doudou" "${pkgdir}/opt/doudou-unstable/doudou"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/doudou-unstable/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/doudou-unstable/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/doudou-unstable/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/doudou-unstable.desktop" <<EOF
[Desktop Entry]
Name=Doudou (Unstable)
Comment=Stream your music with ease and style (unstable/development version)
Exec=/opt/doudou-unstable/doudou
Icon=doudou-unstable
Type=Application
Categories=Audio;Music;Player;
Keywords=music;streaming;audio;player;
EOF

    # Install icon
    install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/doudou-unstable.png"

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/doudou-unstable/doudou "${pkgdir}/usr/bin/doudou-unstable"
}
