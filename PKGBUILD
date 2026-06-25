# Maintainer: Local package maintainer

pkgname=github-copilot-bin
pkgver=1.0.8
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
sha256sums_x86_64=('33b6c5ee63d4df5f97358b79658aa3fa63a1a4db1a4da11005c5327d4b2bd987')
sha256sums_aarch64=('a62777224515f170265848faadfe764e5df70b14c9c1ab84a465cae2eb83fd9e')

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
