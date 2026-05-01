# Maintainer: Caus <caus@ik.me>
# Contributor (original package): Cosmo <cptncosmo@gmail.com>

pkgname=fluxer-canary-bin
pkgver=0.0.100
pkgrel=1
pkgdesc="Fluxer Canary Desktop Application"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0')
depends=('gtk3' 'nss' 'alsa-lib')
options=('!strip')

source=("fluxer-canary.desktop" "fluxer-canary.png")
sha256sums=('c8b078f761ad3b708f9b89c4b27d8a3a4da03a34c22aa0a9de95ead6d9a1ec03'
            'bf29f74512940bb5abfa4cc6579579a2365d78b7a4f6cbf65d58c73cf0202589')
sha256sums_x86_64=('535e89b6b220ebc4cf4645f39588a18a1a5cd89fa90565d7c8d86eae1994a752')
sha256sums_aarch64=('80fcbf63ff60d1ac1eb019316ebb33ce8413d89ffe2224c5dd1f817ee98dea9a')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/canary/linux/x64/${pkgver}/tar_gz")
source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/canary/linux/arm64/${pkgver}/tar_gz")

package() {
    # Determine directory name based on architecture
    if [ "$CARCH" = "x86_64" ]; then
        _arch_dir="Fluxer Canary-${pkgver}-linux-x64"
    elif [ "$CARCH" = "aarch64" ]; then
        _arch_dir="Fluxer Canary-${pkgver}-linux-arm64"
    fi

    check_dir="${srcdir}/${_arch_dir}"

    # Fallback search if directory name is different
    if [ ! -d "$check_dir" ]; then
        cd "${srcdir}"
        # try to find directory matching pattern
        _arch_dir=$(ls -d Fluxer*"${pkgver}"* 2>/dev/null | head -n 1)
    fi

    if [ -z "$_arch_dir" ] || [ ! -d "${srcdir}/${_arch_dir}" ]; then
        echo "Error: Could not find extracted directory for architecture $CARCH"
        # Lists content of srcdir to help debugging
        ls -la "${srcdir}"
        return 1
    fi

    cd "${srcdir}/${_arch_dir}"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -r . "${pkgdir}/opt/${pkgname}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/fluxer-canary" "${pkgdir}/usr/bin/fluxer-canary"

    install -Dm644 "${srcdir}/fluxer-canary.desktop" "${pkgdir}/usr/share/applications/fluxer-canary.desktop"
    install -Dm644 "${srcdir}/fluxer-canary.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/fluxer-canary.png"
}
