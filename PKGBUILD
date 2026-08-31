# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=2.3.91
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
    'speech-dispatcher'
    'espeak-ng'
)
provides=(
    'shiorii'
    'shiori'
    'shiori-bin'
    'shiori-rin-bin'
    'shiori-ebook-bin'
)
conflicts=(
    'shiorii'
    'shiorii-git'
    'shiori'
    'shiori-git'
    'shiori-bin'
    'shiori-rin'
    'shiori-rin-bin'
    'shiori-ebook'
    'shiori-ebook-bin'
)
source=("Shiori_${pkgver}_linux_amd64.tar.gz::https://github.com/vinayydv3695/Shiori/releases/download/v${pkgver}/Shiori_${pkgver}_linux_amd64.tar.gz")
sha256sums=('e3ba5b6b871698e08b6c5bed02d5f3b7008e6ce757224132a35d3cb7eac9c407')

package() {
    bsdtar -xpf "${srcdir}/Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

    if [[ ! -f "${pkgdir}/usr/bin/shiori" ]]; then
        echo "Missing usr/bin/shiori in release tarball" >&2
        return 1
    fi

    if [[ ! -f "${pkgdir}/usr/share/applications/Shiori.desktop" ]]; then
        echo "Missing usr/share/applications/Shiori.desktop in release tarball" >&2
        return 1
    fi

    # Move the real binary to /usr/lib/shiori/ so the wrapper at /usr/bin/shiori
    # can set required webkit2gtk env vars before exec-ing it.
    install -d "${pkgdir}/usr/lib/shiori"
    mv "${pkgdir}/usr/bin/shiori" "${pkgdir}/usr/lib/shiori/shiori"
    chmod 755 "${pkgdir}/usr/lib/shiori/shiori"

    # Wrapper script: sets WEBKIT_DISABLE_DMABUF_RENDERER=1 unconditionally.
    # This fixes the blank white screen on Arch Linux with webkit2gtk-4.1.
    # Users who need DMA-BUF can override by setting SHIORI_WEBKIT_DMABUF=1.
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

    # Update the .desktop Exec= to point to the wrapper (which is already /usr/bin/shiori)
    # — no change needed since /usr/bin/shiori is the wrapper itself.

    # Harden runtime assets: rewrite absolute-root asset refs in shipped web bundle.
    # This covers both the main JS/CSS chunks and the fonts/fonts.css file.
    while IFS= read -r -d '' web_file; do
        sed -i \
            -e 's|"/assets/|"./assets/|g' \
            -e "s|'\/assets/|'./assets/|g" \
            -e 's|"/fonts/|"./fonts/|g' \
            -e "s|'\/fonts/|'./fonts/|g" \
            -e 's|"/favicon\.png"|"./favicon.png"|g' \
            -e "s|'\/favicon\.png'|'./favicon.png'|g" \
            -e 's|"/logo\.png"|"./logo.png"|g' \
            -e "s|'\/logo\.png'|'./logo.png'|g" \
            "${web_file}"
    done < <(find "${pkgdir}/usr" -type f \( -name '*.html' -o -name '*.js' -o -name '*.css' \) -print0)

    # Fix fonts.css: rewrite absolute /FontName.woff2 refs to same-directory ./FontName.woff2
    # This ensures fonts load correctly under Tauri's custom protocol on Linux.
    local fonts_css
    fonts_css=$(find "${pkgdir}/usr" -name 'fonts.css' -print -quit)
    if [[ -f "${fonts_css}" ]]; then
        sed -i "s|url('\//|url('./|g; s|url('/|url('./|g" "${fonts_css}"
    fi

    chmod -R u=rwX,go=rX "${pkgdir}/usr"
    chmod 755 "${pkgdir}/usr/bin/shiori"
    chmod 755 "${pkgdir}/usr/lib/shiori/shiori"
}
