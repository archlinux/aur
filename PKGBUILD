# Maintainer: Aloys233 <luodh233@gmail.com>
pkgname=quickflare
pkgver=0.1.0
pkgrel=1
pkgdesc="A native-feeling Cloudflare Tunnel GUI for Linux, macOS and Windows."
arch=('x86_64')
url="https://github.com/Aloys233/quickflare"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'libsecret'
    'openssl'
)
makedepends=(
    'rust'
    'nodejs'
    'pnpm'
    'pkgconf'
    'librsvg'
)
optdepends=(
    'cloudflared: required to create Cloudflare tunnels'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d29cfb1c6fdb04302b4745492269d2fb186fbd7bec5c78da21028d1b6d496ac')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    pnpm install --frozen-lockfile
    pnpm tauri build --ci --no-bundle
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "src-tauri/target/release/quickflare" "${pkgdir}/usr/bin/quickflare"
    install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/quickflare.png"
    install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/quickflare.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/app.quickflare.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Quickflare
Comment=Local Cloudflare Tunnel manager.
Exec=quickflare
Icon=quickflare
Terminal=false
Categories=Development;
DESKTOP

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
