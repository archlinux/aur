# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Jeremy Rand
# Contributor:  The Namecoin Developers
# Contributor:  The Electrum-DOGE Developers
# Contributor:  The Electrum Developers
# Contributor:  Thomas Voegtlin
# Contributor:  The Bitcoin Developers

pkgname=electrum-nmc-bin
pkgver=4.0.0b1
pkgrel=1
pkgdesc='Namecoin port of Electrum client with name support'

arch=('x86_64')
url='https://www.namecoin.org/'
license=('Custom: multiple open source')

depends=()

optdepends=('cython: Compilation support for all hardware wallet dependencies'
            'python-btchip: Ledger, Trezor, and KeepKey hardware wallet support dependency'
            'python-trezor: Trezor hardware support dependency'
            'python-keepkey: KeepKey hardware wallet support dependency'
            'python-ckcc-protocol: Coldcard wallet support')

provides=('electrum-nmc' 'electrum-nmc-bin')
conflicts=('electrum-nmc-bin')

source=("electrum-nmc.AppImage::https://www.namecoin.org/files/electrum-nmc/electrum-nmc-${pkgver}/electrum-nmc-nc${pkgver}-x86_64.AppImage"
        "electrum_nmc_bin.png::https://raw.githubusercontent.com/namecoin/electrum-nmc/30762795b88da0e0a208dc748bb98bdc35f6fb79/electrum_nmc/electrum/gui/icons/electrum_nmc.png"
        "AUTHORS::https://raw.githubusercontent.com/namecoin/electrum-nmc/30762795b88da0e0a208dc748bb98bdc35f6fb79/AUTHORS"
        "README.rst::https://raw.githubusercontent.com/namecoin/electrum-nmc/30762795b88da0e0a208dc748bb98bdc35f6fb79/README.rst"
        "RELEASE-NOTES::https://raw.githubusercontent.com/namecoin/electrum-nmc/30762795b88da0e0a208dc748bb98bdc35f6fb79/RELEASE-NOTES"
        "LICENCE::https://raw.githubusercontent.com/namecoin/electrum-nmc/30762795b88da0e0a208dc748bb98bdc35f6fb79/LICENCE"
        "LICENCE.DOGE::https://raw.githubusercontent.com/namecoin/electrum-nmc/30762795b88da0e0a208dc748bb98bdc35f6fb79/LICENCE.DOGE")

noextract=('electrum-nmc.AppImage' "electrum-nmc-nc${pkgver}-x86_64.AppImage")
options=(!strip)

sha256sums=('ad05759cdffdd1f35b6cfa182e43e44f67762b3df8672e2c2330762fc585e2dc'
            'b9a107d0716183fd98439b93a93643856b7774342f36cf9afcd6a83419c6f38d'
            '507ca68a5818f30dabc14bb61f4d5045e78dfd13f1e01cf56a8e61c7e1d0fb8f'
            '6e9a46c9c296676072eb059d29a9cbf23a04719156c45df3ab34e269ab61b9c2'
            'f31755ae0b7dfd8f0a10887b8694da52aeb5daa4c69246e4760844a3cafac933'
            '3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

prepare() {
    cat <<EOF > "${srcdir}/electrum-nmc-appimage.desktop"
[Desktop Entry]
Comment=Lightweight Namecoin Client With Full Name Support
Exec=electrum-nmc.AppImage %u
Icon=electrum_nmc_bin
Name=Electrum Namecoin Wallet (AppImage)
Categories=Finance;Network;
Terminal=false
Type=Application
MimeType=x-scheme-handler/namecoin;
EOF
    touch "${srcdir}/no_desktopintegration"
}

package() {
    cd "${srcdir}/"

    # I don't like touching the system, but I don't know a better way to accomplish this.
    # There's no CLI flag as far as I know. Please contact me if you know a better way.
    if [ ! -f /usr/share/appimagekit/no_desktopintegration ]; then
        install -Dm644 "${srcdir}/no_desktopintegration" "${pkgdir}/usr/share/appimagekit/no_desktopintegration"
    fi

    install -Dm755 "${srcdir}/electrum-nmc.AppImage" "${pkgdir}/usr/bin/electrum-nmc.AppImage"
    install -Dm755 "${srcdir}/electrum-nmc-appimage.desktop" "${pkgdir}/usr/share/applications/electrum-nmc-appimage.desktop"
    install -Dm644 "${srcdir}/electrum_nmc_bin.png" "${pkgdir}/usr/share/pixmaps/electrum_nmc_bin.png"
    install -Dm644 "${srcdir}/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 "${srcdir}/README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -Dm644 "${srcdir}/RELEASE-NOTES" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE-NOTES"
    install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
    install -Dm644 "${srcdir}/LICENCE.DOGE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.DOGE"
}

