# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

_pkgname=Sparrow
pkgname=sparrow-wallet
pkgver=2.2.2
pkgrel=1
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy. Free and open source"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'alsa-lib' 'libxtst' 'libxrender' 'freetype2' 'libxcrypt-compat')
conflicts=('sparrow-wallet-git' 'sparrow-wallet-reproducible')
source=(
    "https://github.com/sparrowwallet/sparrow/releases/download/$pkgver/sparrowwallet-$pkgver-$CARCH.tar.gz"
    "https://github.com/sparrowwallet/sparrow/releases/download/$pkgver/sparrow-$pkgver-manifest.txt"{,.asc}
    "https://raw.githubusercontent.com/sparrowwallet/sparrow/refs/heads/master/src/main/deploy/package/linux/Sparrow.desktop"
)
validpgpkeys=('D4D0D3202FC06849A257B38DE94618334C674B40')
sha256sums=(
    'a5a9be550ddbc32287d00822c809021135f936801f95c4fae1c481fea16ee51b'
    'ecb5caa1b7ae30ec8b27a378b892e66e0331f999a02a2ad6b3e3668e98041b17'
    'SKIP'
    '71c5d812d7f84faff1898c2407454f230308e148052cde950ccf4ab9a0b2848c'
)

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
}
