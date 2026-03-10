# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook
pkgver=0.1.7
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'librsvg'
    'sqlite'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'webkit2gtk-4.1'
    'base-devel'
    'curl'
    'wget'
    'file'
    'openssl'
    'gtk3'
    'libappindicator-gtk3'
    'librsvg'
)
provides=('shiori-ebook')
conflicts=('shiori-ebook-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

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
    
    # Install icons
    install -Dm644 "src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/shiori-ebook.png"
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/shiori-ebook.png"
    
    # Create desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shiori-ebook.desktop" <<EOF
[Desktop Entry]
Name=Shiori eBook Manager
GenericName=eBook Library Manager
Comment=Organize, read, and manage your eBook collection
Exec=shiori
Icon=shiori-ebook
Type=Application
Categories=Office;Viewer;Education;
Keywords=ebook;reader;library;epub;pdf;mobi;
Terminal=false
StartupNotify=true
MimeType=application/epub+zip;application/pdf;application/x-mobipocket-ebook;application/vnd.amazon.ebook;
EOF
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
