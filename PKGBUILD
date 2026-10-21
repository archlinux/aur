# Maintainer: Kyle Jackson <your@email.com>
# paintfe-bin — installs the prebuilt Linux binary from the GitHub release.
# Faster to install than paintfe (no Rust compile). x86_64 only.
# Update pkgver + sha256sums for each new release.
# Portable archive sha256 is in checksums-SHA256.txt attached to each GitHub release.

pkgname=paintfe-bin
pkgver=1.4.13
pkgrel=1
pkgdesc="Fast, GPU-accelerated raster image editor (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kylejckson/PaintFE"
license=('MIT')
# Preserve the published compatibility-host binary: its adjacent .sha256 file
# verifies the exact release artifact before PaintFE loads legacy plugins.
options=('!strip')
provides=('paintfe')
conflicts=('paintfe')
depends=(
    'gcc-libs'
    'glibc'
    'libxkbcommon'
    'wayland'
    'libx11'
)
optdepends=(
    'vulkan-icd-loader: hardware-accelerated GPU rendering (recommended)'
    'mesa: software/OpenGL fallback rendering'
)
source=(
    "PaintFE-linux-x64-${pkgver}.tar.gz::https://github.com/kylejckson/PaintFE/releases/download/v${pkgver}/PaintFE-linux-x64.tar.gz"
    "PaintFE-${pkgver}.desktop::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/packaging/appimage/PaintFE.AppDir/PaintFE.desktop"
    "PaintFE-${pkgver}.png::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/assets/icons/app_icon.png"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/LICENSE.md"
)
sha256sums=('520f6280190c0ac4b10165b2c338e2de45a31e1bc6dffbb52f24ab1ff1d61b41'
            'cc0764b5e156e1c7af4ca70d1cadec0c47368e51ae480324eee2f448db58e4d4'
            '81d202b768f21db258ba7268288eefb643f5c082edb6eb0b8d481b2e100ee0f0'
            '93a341aa77d861fdf5fcf20243c40a13da5bf7ab1d2058e9d67b8777534a5c0e')

package() {
    install -Dm755 "PaintFE-linux-x64/PaintFE"      "$pkgdir/usr/bin/PaintFE"
    install -d "$pkgdir/usr/lib/paintfe/paintdotnet-host"
    cp -a PaintFE-linux-x64/paintdotnet-host/. "$pkgdir/usr/lib/paintfe/paintdotnet-host/"
    ln -s /usr/lib/paintfe/paintdotnet-host "$pkgdir/usr/bin/paintdotnet-host"
    install -Dm644 "PaintFE-${pkgver}.desktop"      "$pkgdir/usr/share/applications/PaintFE.desktop"
    install -Dm644 "PaintFE-${pkgver}.png"          "$pkgdir/usr/share/icons/hicolor/256x256/apps/PaintFE.png"
    install -Dm644 "LICENSE-${pkgver}.md"           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
