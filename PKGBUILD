# Maintainer: Rowan Decker <rdecker [at] scu [dot] edu>

_pkgbase=monero
pkgname=monero-gui-bin
pkgver=0.11.0.0
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable currency - release version (GUI Beta 2. Includes deaemon, wallet and miner)"
arch=("x86_64" "i686")
conflicts=("${_pkgbase}")
url="https://getmonero.org/"
license=("BSD")
depends=("qt5-declarative" "qt5-svg")
provides=("monerod=${pkgver}"
          "monero-blockchain-export=${pkgver}"
          "monero-blockchain-import=${pkgver}"
          "monero-utils-deserialize=${pkgver}"
          "monero-wallet-cli=${pkgver}"
          "monero-wallet-rpc=${pkgver}"
)

source=("https://downloads.getmonero.org/gui/linux64"
    "monero-wallet-gui"
)

sha256sums=("25bdeeb9072b679eda4aca2a5dac0351393d6bd8ceed1822bf65495ab6d113bf"
    "8b69aac7caae305676ccebc6dbfa803c9aadf8b82d2ca1ecf2d8302a0d79cfc9"
)

if [ "$CARCH" = 'i686' ]; then
    source[0]="https://downloads.getmonero.org/gui/linux32"
    sha256sums[0]="284b30fe84c92407117b7dcabc324c12050196e520d64ff5601a031dfbc7bb90"
fi

package() {
    cd "$srcdir"

    # Copy precompiled package
    install -dm755 "${pkgname//-bin/}-${pkgver//_/-}" "${pkgdir}/usr/share/monero-gui/"
    cp -r "${pkgname//-bin/}-${pkgver//_/-}/." "${pkgdir}/usr/share/monero-gui/"
    
    # Fix permissions
    chmod -R +rX "${pkgdir}/usr/share/monero-gui"
    chmod +x "${pkgdir}/usr/share/monero-gui/monero-wallet-gui"
    chmod +x "${pkgdir}/usr/share/monero-gui/start-gui.sh"

    # Wallet launcher script
    install -Dm755 "monero-wallet-gui" "${pkgdir}/usr/bin/monero-wallet-gui"

    # Binary symlinks
    ln -sf /usr/share/monero-gui/monerod "${pkgdir}/usr/bin/monerod"
    ln -sf /usr/share/monero-gui/monero-blockchain-export "${pkgdir}/usr/bin/monero-blockchain-export"
    ln -sf /usr/share/monero-gui/monero-blockchain-import "${pkgdir}/usr/bin/monero-blockchain-import"
    ln -sf /usr/share/monero-gui/monero-utils-deserialize "${pkgdir}/usr/bin/monero-utils-deserialize"
    ln -sf /usr/share/monero-gui/monero-wallet-cli "${pkgdir}/usr/bin/monero-wallet-cli"
    ln -sf /usr/share/monero-gui/monero-wallet-rpc "${pkgdir}/usr/bin/monero-wallet-rpc"
}
