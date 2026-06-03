# Maintainer: Yukari0201 <130890393+Yukari0201@users.noreply.github.com>

_pkgname=carton
pkgname="${_pkgname}-bin"
pkgver=0.3.0 # renovate: datasource=github-releases depName=821869798/carton
pkgrel=1
pkgdesc="A Windows and Linux GUI client for sing-box.(主打高性能和易用性，非electron tauri等web套皮)"
arch=('x86_64' 'aarch64')
url="https://github.com/821869798/carton"
license=('GPL-3.0')
makedepends=('patchelf')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-appimage")

source=(
    "LICENSE::https://raw.githubusercontent.com/821869798/carton/refs/tags/v${pkgver}/LICENSE"
    "carton_icon.png::https://raw.githubusercontent.com/821869798/carton/refs/tags/v${pkgver}/src/carton.GUI/Assets/carton_icon.png"
)
source_x86_64=("${_pkgname}-v${pkgver}-x64-portable.tar.gz::https://github.com/821869798/carton/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-portable.tar.gz")
source_aarch64=("${_pkgname}-v${pkgver}-arm64-portable.tar.gz::https://github.com/821869798/carton/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64-portable.tar.gz")

sha256sums=('d0f7cd798fd03274d6742245e320bbd2133dfdb7161c4470df4ea862b4fa57dd'
            'ddcf47960f17c5652904b24ad99a4a92af03dab850b8f29e50401d2a4a038138')
sha256sums_x86_64=('ebe4fdefd4714eee28aa4e7c69ac63d20d0ab812b7385da827c7d5dfe64d1d7b')
sha256sums_aarch64=('af09073af7afca7c72354c7bbaff323673173a402d7f1d1c971d68cd90d0f0c4')

package() {
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -p "${srcdir}"/{"${_pkgname}",sing-box,*.so} "${pkgdir}/opt/${_pkgname}/"

    patchelf --set-rpath '$ORIGIN' "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications/"
    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Carton
Exec=/usr/bin/carton
Icon=carton_icon
Type=Application
Comment=A Windows and Linux GUI client for sing-box.
Terminal=false
Categories=Utility;
EOF

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/share/icons"
    cp "${srcdir}/carton_icon.png" "${pkgdir}/usr/share/icons"

    # License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
