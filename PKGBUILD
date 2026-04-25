# Maintainer: Caus <caus@ik.me>
# Contributor (original package): Cosmo <cptncosmo@gmail.com>

pkgname=fluxer-canary-bin
pkgver=0.0.41
pkgrel=1
pkgdesc="Fluxer Canary Desktop Application"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0')
depends=('gtk3' 'nss' 'alsa-lib')
options=('!strip')

source=("fluxer-canary.desktop" "fluxer-canary.png")
sha256sums=('5fd5189db59a90c3c02dd234d6e80b0486423ff98afdc25aec19d1e4cea03d51'
            'bf29f74512940bb5abfa4cc6579579a2365d78b7a4f6cbf65d58c73cf0202589')
sha256sums_x86_64=('806f9b551aa554d2769fc835b943fa24385613d3452bf60f1507dd433d447aa1')
sha256sums_aarch64=('ba0dc470ba059c373dbd9dcd82c4aca22235f63924bde48e375187787e6d01e8')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/canary/linux/x64/latest/tar_gz")
source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/canary/linux/arm64/latest/tar_gz")

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
    ln -s "/opt/${pkgname}/fluxer_desktop_canary" "${pkgdir}/usr/bin/fluxer-canary"

    install -Dm644 "${srcdir}/fluxer-canary.desktop" "${pkgdir}/usr/share/applications/fluxer-canary.desktop"
    install -Dm644 "${srcdir}/fluxer-canary.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/fluxer-canary.png"
}
