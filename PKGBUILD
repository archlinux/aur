# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

_pkgname=Sparrow
pkgname=sparrow-wallet
pkgver=2.2.3
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
sha256sums=('32c11181f246a71464426e16c37d1373de644e18e5808fa73b86eadb334675e5'
            'a8f22596a16a7bce014887186186beaca26f4a937f427a261e7b0ea13c65ca5e'
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
}
