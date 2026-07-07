# Maintainer: Local package maintainer

pkgname=github-copilot-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="GitHub Copilot desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/github/app"
license=('LicenseRef-GitHub-Proprietary')
depends=(
    'alsa-lib'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libpulse'
    'openssl'
    'webkit2gtk-4.1'
)
makedepends=(
    'binutils'
    'patchelf'
)
provides=(
    'github-copilot'
)
conflicts=(
    'github-copilot'
)
options=(!debug !strip)
source=(
    'LICENSE'
)
source_x86_64=(
    "github-copilot-${pkgver}-x86_64.deb::https://github.com/github/app/releases/download/v${pkgver}/GitHub-Copilot-linux-x64.deb"
)
source_aarch64=(
    "github-copilot-${pkgver}-aarch64.deb::https://github.com/github/app/releases/download/v${pkgver}/GitHub-Copilot-linux-arm64.deb"
)
noextract=(
    "github-copilot-${pkgver}-x86_64.deb"
    "github-copilot-${pkgver}-aarch64.deb"
)
sha256sums=('3d31debed26a6d19a50965aad60931cb83ef000bcc5340aa693d772e539a73f2')
sha256sums_x86_64=('3c6d47ede284ed6f7298743eb51e4c676c28ec4540fb4e1e8c1a5489d1484dc3')
sha256sums_aarch64=('d10132bc74c1ca6643e83d98f20a70e08ff6b896abc0e623d9bcadf413739f29')

package() {
    local deb="${srcdir}/github-copilot-${pkgver}-${CARCH}.deb"
    local desktop_file="${pkgdir}/usr/share/applications/GitHub Copilot.desktop"

    ar p "$deb" data.tar.zst |
        tar --no-same-owner --zstd -xf - -C "$pkgdir"

    if [[ ! -x "${pkgdir}/usr/bin/github" ]]; then
        printf 'Upstream github binary is missing\n' >&2
        return 1
    fi

    if [[ ! -x "${pkgdir}/usr/bin/git-credential-copilot" ]]; then
        printf 'Upstream git-credential-copilot binary is missing\n' >&2
        return 1
    fi

    if [[ ! -f "$desktop_file" ]]; then
        printf 'Upstream desktop entry is missing\n' >&2
        return 1
    fi

    patchelf --set-rpath '$ORIGIN' \
        "${pkgdir}/usr/lib/GitHub Copilot/Microsoft.AI.Foundry.Local.Core.so"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
