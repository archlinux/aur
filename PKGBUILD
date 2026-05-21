# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.12
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
optdepends=(
    'speech-dispatcher: Native TTS support (experimental)'
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
sha256sums=('eb7776f2692eef469f0313a72047995e21b8703d306a59d2fbee64796d78dfc8')

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
}
