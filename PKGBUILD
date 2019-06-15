# Maintainer: DrRac27 <drrac27 at riseup dot net>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

pkgname=monero-bin
pkgver=0.14.1.0
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
sha256sums_x86_64=('2b95118f53d98d542a85f8732b84ba13b3cd20517ccb40332b0edd0ddf4f8c62')
sha256sums_i686=('a31bca6e556064d56f7a37ddbea26408902e5f387e5b67fa5b0999ca299b8eef')
sha256sums_armv7h=('b95903a0f1b0c15cefdf59814fe12e3597a3322ae6d0567c732f0ab79c877724')
sha256sums_aarch64=('cf46a1cdea6f7983697df6dfbbb184b6dd23e816ed156899070885a78b310171')


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
