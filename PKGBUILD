# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, zip files
pkgver="0.11.0"
pkgrel=1
# linux32 zip
sha256sums_i686=("6bf2814f34dd27b08122f200810c7aaba5bc44143f3feab0ee9b96dfa4ae0628")
# linux64 zip
sha256sums_x86_64=("8c7bf7a9c6b46c2f4a6d7f9958524e7f0deb8dc6bd886c6b9ba732b4235be165")

# info
pkgname="ethereumwallet-bin"
_binname="ethereumwallet"
_strver=`echo ${pkgver} | sed "s/\./-/g"`
pkgdesc="Ethereum Wallet from git releases"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/ethereum/mist/releases"

# dependencies
provides=(
    ${_binname}
    'libnode'
    'libffmpeg'
)
conflicts=(
    'ethereumwallet-git'
    'libnode'
    'libnode-git'
)
depends=(
    'nss'
    'libxtst'
    'alsa-lib'
    'libxss'
    'gtk2'
    'gconf'
)
optdepends=(
    'geth: The go-ethereum commandline client (geth cli).'
    'parity: The fast, light, robust Ethereum client.'
)

# 32 and 64 file sources, checksums at top of file
source_i686=("${url}/download/v${pkgver}/Ethereum-Wallet-linux32-${_strver}.zip")
source_x86_64=("${url}/download/v${pkgver}/Ethereum-Wallet-linux64-${_strver}.zip")

# desktop file and icon
source=(
    "EthereumWallet.desktop"
    "icon.png"
)
# their checksums
sha256sums=(
    "57db9dcc5d983942a9f5acf900fa78785b8cc7866d9e46ee58055aa478737177"
    "d4f701bb363e5e1d5cd5cb7ea2e8f2c16f1ccb464a1af8bb81b83bbc3ede1e86"
)

package() {

    # create directories
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/lib"

    if [ $CARCH == "x86_64" ]; then
      rm "${srcdir}/Ethereum-Wallet-linux64-${_strver}.zip"
    else
      rm "${srcdir}/Ethereum-Wallet-linux32-${_strver}.zip"
    fi

    # install
    cp -a   "${srcdir}"                                    "${pkgdir}/usr/share/${_binname}"
    install "${pkgdir}/usr/share/${_binname}/libnode.so"   "${pkgdir}/usr/lib/libnode.so"
    install "${pkgdir}/usr/share/${_binname}/libffmpeg.so" "${pkgdir}/usr/lib/libffmpeg.so"
    ln -s            "/usr/share/${_binname}/${_binname}"  "${pkgdir}/usr/bin/${_binname}"
    rm      "${pkgdir}/usr/share/${_binname}/libnode.so"
    rm      "${pkgdir}/usr/share/${_binname}/libffmpeg.so"

    # desktop file
    cp "${srcdir}/EthereumWallet.desktop" "${pkgdir}/usr/share/applications"
    rm "${pkgdir}/usr/share/ethereumwallet/EthereumWallet.desktop"

    # modes
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/usr/share/${_binname}/${_binname}"
    chmod 755 "${pkgdir}/usr/lib/libnode.so"
    chmod 755 "${pkgdir}/usr/lib/libffmpeg.so"

    # licence
    install -Dm644 "${pkgdir}/usr/share/${_binname}/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
    rm "${pkgdir}/usr/share/${_binname}/LICENSE"
}
