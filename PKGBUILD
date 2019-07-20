# Maintainer: DrRac27 <drrac27 at riseup dot net>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

pkgname=monero-bin
pkgver=0.14.1.2
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable currency - CLI release version (includes daemon, wallet and miner)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
conflicts=("${pkgname%-bin}"
           "monerod"
           "monero-blockchain-export"
           "monero-blockchain-import"
           "monero-utils-deserialize"
           "monero-wallet-cli"
           "monero-wallet-rpc"
) # TODO
url="https://getmonero.org/"
license=("custom:Cryptonote")
backup=("etc/monerod.conf")
provides=("monerod=${pkgver}"
          "monero-blockchain-export=${pkgver}"
          "monero-blockchain-import=${pkgver}"
          "monero-utils-deserialize=${pkgver}"
          "monero-wallet-cli=${pkgver}"
          "monero-wallet-rpc=${pkgver}"
) # TODO
source_x86_64=("https://downloads.getmonero.org/cli/monero-linux-x64-v${pkgver}.tar.bz2")
source_i686=("https://downloads.getmonero.org/cli/monero-linux-x86-v${pkgver}.tar.bz2")
source_armv7h=("https://downloads.getmonero.org/cli/monero-linux-armv7-v${pkgver}.tar.bz2")
source_aarch64=("https://downloads.getmonero.org/cli/monero-linux-armv8-v${pkgver}.tar.bz2")
source=("monerod.conf"
        "monerod.service"
        "LICENSE"
)
sha256sums=('829445fe9acc00681f94f7b9ca6ce39713e377970b0a3d6f88c37991e1aa61b2'
            '0b66160a5448dedd8e84c38ba2243187217b214b1552f504b05de120b671f121'
            '0e24d8f4b8758ff33612a17f3bb72a69497b74b32d12bbe5d647d954fcef59ad')
sha256sums_x86_64=('a4d1ddb9a6f36fcb985a3c07101756f544a5c9f797edd0885dab4a9de27a6228')
sha256sums_i686=('ede3b29d085d25058268cea932190c77c276618d97fd2a859002dc01de0c54cb')
sha256sums_armv7h=('7f040bf1d0fec4f76064f5c8af249f1df9d5a6decd6846c3080bd749b2516280')
sha256sums_aarch64=('d462fd0f2e4010b6717de2cf6aa8d04a50e56a8fdfd3735230a2a36e63cdb9fb')


package() {
    # Monero build system renamed the extracted folders to non version specific names
    if [ -e "${srcdir}/monero-v${pkgver}" ]; then
        echo "WARNING: Using existing files. To clean build run 'rm -r ${srcdir}/monero-v${pkgver}' and try again."
    else
        [ "$CARCH" == "x86_64" ] && mv "${srcdir}/monero-x86_64-linux-gnu" "${srcdir}/monero-v${pkgver}"
        [ "$CARCH" == "i686" ] && mv "${srcdir}/monero-i686-linux-gnu" "${srcdir}/monero-v${pkgver}"
        [ "$CARCH" == "armv7h" ] && mv "${srcdir}/monero-arm-linux-gnueabihf" "${srcdir}/monero-v${pkgver}"
        [ "$CARCH" == "aarch64" ] && mv "${srcdir}/monero-aarch64-linux-gnu" "${srcdir}/monero-v${pkgver}"
    fi

    # Binary file
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-ancestry" "${pkgdir}/usr/bin/monero-blockchain-ancestry"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-depth" "${pkgdir}/usr/bin/monero-blockchain-depth"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-export" "${pkgdir}/usr/bin/monero-blockchain-export"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-import" "${pkgdir}/usr/bin/monero-blockchain-import"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-mark-spent-outputs" "${pkgdir}/usr/bin/monero-blockchain-mark-spent-outputs"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-prune" "${pkgdir}/usr/bin/monero-blockchain-prune"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-prune-known-spent-data" "${pkgdir}/usr/bin/monero-blockchain-prune-known-spent-data"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-stats" "${pkgdir}/usr/bin/monero-blockchain-stats"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-usage" "${pkgdir}/usr/bin/monero-blockchain-usage"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monerod" "${pkgdir}/usr/bin/monerod"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-gen-trusted-multisig" "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-wallet-cli" "${pkgdir}/usr/bin/monero-wallet-cli"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-wallet-rpc" "${pkgdir}/usr/bin/monero-wallet-rpc"

    # Configuration and service file
    install -Dm644 "${srcdir}/monerod.conf" "${pkgdir}/etc/monerod.conf"
    install -Dm644 "${srcdir}/monerod.service" "${pkgdir}/usr/lib/systemd/system/monerod.service"

    # License file
    install -Dm 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/monero/LICENSE"
}
