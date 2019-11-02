pkgname=gram-wallet-bin
pkgver=0.9.2
pkgrel=21156636
provides=('gram-wallet')
conflicts=('gram-wallet' 'gram-wallet-git')
pkgdesc="Desktop Gram Wallet"
arch=('x86_64')
depends=()
makedepends=('wget' 'jq' 'grep')
url="https://mfcoin.net/"
license=('GPL3')
repo="ton-blockchain/wallet-desktop"
current_release=$(wget -O - https://api.github.com/repos/${repo}/releases/${pkgrel} 2>/dev/null)

_tarball(){
    assets=$(echo "${current_release}" | jq '.assets')
    length=$(echo "${assets}" | jq '. | length')
    for (( i=0; i <= $length; i++ )); do
        url=$(echo "${assets}" | jq --raw-output ".[$i].browser_download_url")
        name=$(echo "${assets}" | jq --raw-output ".[$i].label")
        echo "$name" | grep -P '[Ll]inux.*64' > /dev/null && echo "$url"
    done
}

source_x86_64=(
    "$(_tarball)"
)

sha256sums_x86_64=(
    '6fa5ae92f3c539c558d21bd50f61d45e424ccd2fc8c08100b9d20ed2b1d7d564'
)

package() {
    mkdir -p $pkgdir/usr/bin
    cp Wallet/Wallet $pkgdir/usr/bin/gram-wallet
}
