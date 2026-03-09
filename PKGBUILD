# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook
pkgver=0.1.5
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk'
    'gtk3'
    'libayatana-appindicator'
    'librsvg'
    'speech-dispatcher'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'webkit2gtk'
    'base-devel'
    'curl'
    'wget'
    'file'
    'openssl'
    'appmenu-gtk-module'
    'gtk3'
    'libappindicator-gtk3'
    'librsvg'
)
optdepends=(
    'speech-dispatcher: Native TTS support (experimental)'
)
provides=('shiori-ebook')
conflicts=('shiori-ebook-git' 'shiori-ebook-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # Will be updated after first release tag

prepare() {
    cd "${srcdir}/Shiori-${pkgver}"
    
    # Install Node.js dependencies
    npm install
}

build() {
    cd "${srcdir}/Shiori-${pkgver}"
    
    # Build frontend and Tauri app
    npm run build
}

package() {
    cd "${srcdir}/Shiori-${pkgver}"
    
    # Install the binary
    install -Dm755 "src-tauri/target/release/shiori" "${pkgdir}/usr/bin/shiori"
    
    # Install desktop file
    install -Dm644 "${srcdir}/Shiori-${pkgver}/src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/shiori.png"
    install -Dm644 "${srcdir}/Shiori-${pkgver}/src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/shiori.png"
    
    # Create desktop entry
    cat > "${pkgdir}/usr/share/applications/shiori.desktop" <<EOF
[Desktop Entry]
Name=Shiori
GenericName=eBook Library Manager
Comment=Organize, read, and manage your eBook collection
Exec=shiori
Icon=shiori
Type=Application
Categories=Office;Viewer;Education;
Keywords=ebook;reader;library;epub;pdf;mobi;
Terminal=false
StartupNotify=true
MimeType=application/epub+zip;application/pdf;application/x-mobipocket-ebook;application/vnd.amazon.ebook;
EOF
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
