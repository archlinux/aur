# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=hiddify
pkgver=2.5.7
_corever=3.1.8
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, etc."
arch=('x86_64')
url="https://github.com/hiddify/hiddify-app"
license=('GPL-3.0-or-later')
depends=('at-spi2-core' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'pango')
makedepends=('clang' 'cmake' 'fvm' 'gendesk' 'ninja')
conflicts=("${pkgname}-next")
replaces=("${pkgname}-next")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-core-${_corever}.tar.gz::https://github.com/hiddify/hiddify-core/releases/download/v${_corever}/hiddify-core-linux-amd64.tar.gz"
        "https://github.com/hiddify/hiddify-app/commit/06a542478e1284a307dedd08ba7f461e2bacfa8d.patch")
sha256sums=('6accdce090f84a2624b92c7d6cc752b3163511f6df8882a21f38d942c61e50ef'
            'ada19358999d1612a8b6914a6f915d13980a12c353f6dec0803ed3a1f07ea7cc'
            'c36d6a8db1d5d9dd9d516ddcf6fc6b51bb7c29af5a82c5dac93b1688fdbbb897')

prepare() {
    cd "${pkgname}-app-${pkgver}"
    patch -Np1 -i "${srcdir}/06a542478e1284a307dedd08ba7f461e2bacfa8d.patch"

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --genericname "${pkgname^}" \
        --categories 'Network' \
        --startupnotify true \
        --custom Keywords='Hiddify;Proxy;VPN;V2ray;Nekoray;Xray;Psiphon;OpenVPN'

    ln -s "${srcdir}" ./libcore/bin

    fvm install 3.24.3
    fvm global 3.24.3
    fvm flutter config --no-analytics
    fvm flutter pub get
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm dart run slang
}

build() {
    cd "${pkgname}-app-${pkgver}"
    fvm flutter build linux --release --target=lib/main_prod.dart
}

package() {
    cd "${pkgname}-app-${pkgver}"
    install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/images/logo.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
}
