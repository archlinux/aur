# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-git
_pkgname=Shiori
pkgver=1.0.13
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
    'gtk3'
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

    # Some user makepkg environments force lld via -fuse-ld=lld and can break
    # native Rust deps (ring/sqlite/zstd) at final link. Normalize linker.
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/cc
    export CFLAGS="${CFLAGS//-fuse-ld=lld/}"
    export CXXFLAGS="${CXXFLAGS//-fuse-ld=lld/}"
    export LDFLAGS="${LDFLAGS//-fuse-ld=lld/}"
    export RUSTFLAGS="${RUSTFLAGS//-Clink-arg=-fuse-ld=lld/}"
    export RUSTFLAGS="${RUSTFLAGS//-C link-arg=-fuse-ld=lld/}"
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-Wl,--no-as-needed"

    npm run build
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Install real binary to /usr/lib/shiori/
    install -Dm755 "src-tauri/target/release/shiori" "${pkgdir}/usr/lib/shiori/shiori"

    # Wrapper script: sets WEBKIT_DISABLE_DMABUF_RENDERER=1 unconditionally.
    # This fixes the blank white screen on Arch Linux with webkit2gtk-4.1.
    # Users who need DMA-BUF can override by setting SHIORI_WEBKIT_DMABUF=1.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/shiori" <<'EOF'
#!/bin/sh
# Shiori launcher — disables broken DMA-BUF renderer on webkit2gtk-4.1
# to prevent blank/white screen on Arch Linux (both X11 and Wayland).
# Set SHIORI_WEBKIT_DMABUF=1 to opt back in to DMA-BUF rendering.
if [ -z "${SHIORI_WEBKIT_DMABUF}" ]; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi
exec /usr/lib/shiori/shiori "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/shiori"

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
