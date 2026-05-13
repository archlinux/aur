# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.8
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
sha256sums=('56450de3b684f30f98a5444fff44feec9b8cac3b4f2b2abcb1c12d2ff74ff2d0')

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

    # Hotfix: older release tarballs can contain absolute asset paths (/assets/*, /fonts/*)
    # that break on some Linux/AUR installs and cause white screen.
    while IFS= read -r -d '' index_html; do
        sed -i \
            -e 's|href="/assets/|href="./assets/|g' \
            -e 's|src="/assets/|src="./assets/|g' \
            -e 's|href="/fonts/|href="./fonts/|g' \
            -e 's|href="/favicon\.png"|href="./favicon.png"|g' \
            "${index_html}"
    done < <(find "${pkgdir}/usr" -type f -name index.html -print0)

    chmod -R u=rwX,go=rX "${pkgdir}/usr"
    chmod 755 "${pkgdir}/usr/bin/shiori"
}
