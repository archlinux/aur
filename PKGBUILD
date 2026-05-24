# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

pkgname=sparrow-wallet
pkgver=2.5.1
pkgrel=2
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy. Free and open source"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'freetype2'
    'fontconfig'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libglvnd'
    'libstdc++'
    'libusb'
    'libx11'
    'libxcrypt-compat'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'libxxf86vm'
    'pango'
    'systemd-libs'
)
optdepends=(
    'bitbox-udev: udev rules for BitBox hardware wallets'
    'bitcoin-daemon: connect to a local Bitcoin Core node'
    'keepkey-udev: udev rules for KeepKey hardware wallets'
    'ledger-udev: udev rules for Ledger hardware wallets'
    'python-ckcc-protocol: Python CLI and udev rules for Coldcard hardware wallets'
    'trezor-udev: udev rules for Trezor hardware wallets'
)
conflicts=('sparrow-wallet-git' 'sparrow-wallet-reproducible')
options=(!debug !strip)
source=(
    "https://github.com/sparrowwallet/sparrow/releases/download/${pkgver}/sparrowwallet-${pkgver}-${CARCH}.tar.gz"
    "https://github.com/sparrowwallet/sparrow/releases/download/${pkgver}/sparrow-${pkgver}-manifest.txt"{,.asc}
    "https://raw.githubusercontent.com/sparrowwallet/sparrow/refs/tags/${pkgver}/src/main/deploy/package/linux/Sparrow.desktop"
)
validpgpkeys=('D4D0D3202FC06849A257B38DE94618334C674B40')
sha256sums=('1bd3675962f1b59d08c86f0606dbd38749361b1cbf4f0af58e681d37202aa284'
            '9a9930b0a1b265b7ccaf73fa5ecc0432fec22e20b9ed88f2264db4e599663219'
            'SKIP'
            '71c5d812d7f84faff1898c2407454f230308e148052cde950ccf4ab9a0b2848c')

prepare() {
    sha256sum -c --ignore-missing sparrow-$pkgver-manifest.txt
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"

    cp -a "${srcdir}/Sparrow"/* "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/sparrow" << EOF
#!/bin/bash
exec /opt/${pkgname}/bin/Sparrow "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/sparrow"

    install -dm755 "${pkgdir}/usr/share/applications"
    sed "s|/opt/sparrowwallet|/opt/${pkgname}|g" \
        "${srcdir}/Sparrow.desktop" > \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${srcdir}/Sparrow/lib/sparrowwallet-Sparrow-MimeInfo.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
