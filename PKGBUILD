# Maintainer: Local package maintainer

pkgname=github-copilot-bin
pkgver=1.0.18
pkgrel=2
pkgdesc="GitHub Copilot desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/github/app"
license=('LicenseRef-GitHub-Proprietary')
depends=(
    'alsa-lib'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libcurl-gnutls'
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
sha256sums_x86_64=('c94a442f69ceb0e975513e4901f2bf52f45de8d75a19729b71b963cb01259bd6')
sha256sums_aarch64=('f0bf5cc4833a3eda0c6d65631ce10cbf4349f74835894f3668e7ebf1309e7209')

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
