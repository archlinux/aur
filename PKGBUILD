# Maintainer: crowforkotlin <crowforkotlin@gmail.com>

pkgname=proxypin
pkgver=1.2.9
pkgrel=2
pkgdesc="A cross-platform HTTP/HTTPS proxy tool for capturing and manipulating network traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/wanghongenpin/proxypin"
license=('Apache-2.0')
depends=(
    'gtk3'
    'libepoxy'
    'alsa-lib'
    'xdg-utils'
)
makedepends=(
    'flutter'
    'clang'
    'cmake'
    'ninja'
    'pkgconf'
    'xz'
    'git'
)
optdepends=(
    'libnotify: for desktop notifications'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop"
)
sha256sums=('bfbd0db4559bce72acab03974ca1548633ad5b62509d18ea25f7784030638098'
            '33ccb42b1719c8682334d6b7c059cd6c71dfb054dc9d3966995689b53b3a3606')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Get Flutter dependencies
    flutter pub get

    # Build Linux release
    flutter build linux --release
}

package() {
    # Determine Flutter build arch directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        _flutter_arch="x64"
    elif [[ "${CARCH}" == "aarch64" ]]; then
        _flutter_arch="arm64"
    fi

    # Install application bundle
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux/${_flutter_arch}/release/bundle/"* \
        "${pkgdir}/opt/${pkgname}/"

    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon (multiple sizes for hicolor theme)
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Create symlink in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/ProxyPin" "${pkgdir}/usr/bin/${pkgname}"

    # Install license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
