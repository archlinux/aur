# Maintainer: ludvig2457 <ludvig2457@archlinux.org>
# Contributor: SuperLauncher Team

pkgname=superlauncher
pkgver=2.0.0
pkgrel=1
pkgdesc="Minecraft launcher with mod support and server management"
arch=('any')
url="https://github.com/superlauncher/superlauncher"
license=('custom:MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-packaging'
    'python-pillow'
    'python-tqdm'
)
optdepends=(
    'python-pypresence: Discord Rich Presence'
    'python-cryptography: encrypted storage'
    'python-psutil: system resource monitoring'
    'python-minecraft-launcher-lib: Minecraft version management'
    'python-pyjwt: JWT authentication'
    'jdk17-openjdk: run Minecraft Java Edition'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('710d4a1cbc8e275189aa6989f3921dcf07634f3825ba2cdbc41001ff21fbb672')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 superlauncher.desktop \
        "$pkgdir/usr/share/applications/superlauncher.desktop"

    local icon_path
    for icon_path in assets/icon.png SuperLauncher/assets/icon.png; do
        if [ -f "$icon_path" ]; then
            install -Dm644 "$icon_path" \
                "$pkgdir/usr/share/icons/hicolor/256x256/apps/superlauncher.png"
            break
        fi
    done

    # Create necessary directories for runtime data
    install -dm755 "$pkgdir/usr/share/superlauncher"
}
