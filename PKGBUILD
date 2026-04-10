# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-git
_pkgname=Shiori
pkgver=1.0.3.r0.g27c82c8
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
    'speech-dispatcher'
    'sqlite'
    'zstd'
)
makedepends=(
    'git'
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
    'appmenu-gtk-module'
    'gtk3'
    'libappindicator-gtk3'
    'librsvg'
    'sqlite'
    'zstd'
)
optdepends=(
    'speech-dispatcher: Native TTS support (experimental)'
)
provides=(
    'shiorii'
    'shiori'
    'shiori-git'
    'shiori-rin'
    'shiori-ebook'
)
conflicts=(
    'shiorii'
    'shiorii-bin'
    'shiori'
    'shiori-git'
    'shiori-bin'
    'shiori-rin'
    'shiori-rin-bin'
    'shiori-ebook'
    'shiori-ebook-bin'
)
source=("git+https://github.com/vinayydv3695/Shiori.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local tag rev
    tag="$(git describe --tags --abbrev=0 | sed 's/^v//')"
    rev="$(git rev-list --count "$(git describe --tags --abbrev=0)"..HEAD)"
    printf '%s.r%s.g%s' "${tag}" "${rev}" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    npm install
}

build() {
    cd "${srcdir}/${_pkgname}"
    npm run build
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "src-tauri/target/release/shiori" "${pkgdir}/usr/bin/shiori"

    install -Dm644 "src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/shiori.png"
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/shiori.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shiori.desktop" <<'EOF'
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

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
