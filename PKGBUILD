# Maintainer: DrRac27 <drrac27 at riseup dot net>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

pkgname=uplexa-bin
pkgver=0.2.1.0
gitver=2.1.0
pkgrel=1
pkgdesc="uPlexa: Incentivizing the mass compute power of IoT devices to form a means of anonymous blockchain payments - CLI release (includes daemon, wallet and miner)"
arch=('x86_64')
conflicts=("${pkgname%-bin}"
           "uplexad"
           "uplexa-blockchain-export"
           "uplexa-blockchain-import"
           "uplexa-utils-deserialize"
           "uplexa-wallet-cli"
           "uplexa-wallet-rpc"
) # TODO
url="https://uplexa.com/"
license=("BSD3")
depends=('libnorm1')
backup=("etc/uplexad.conf")
provides=("uplexad=${pkgver}"
          "uplexa-blockchain-export=${pkgver}"
          "uplexa-blockchain-import=${pkgver}"
          "uplexa-utils-deserialize=${pkgver}"
          "uplexa-wallet-cli=${pkgver}"
          "uplexa-wallet-rpc=${pkgver}"
) # TODO
source=("https://github.com/uPlexa/uplexa/releases/download/v${gitver}/uplexa-cmd-linux-x86_64.tar.gz"
	"uplexad.conf"
        "uplexad.service"
        "LICENSE"
)
sha256sums=('862c742b259364eb9f318539d66ad145084946db324f57a369cdb6aca68b3680'
	    '0c8ed5f082a01f36392406d09c5881ae332803133acb8e76f0aca9d6f1b0c73b'
            '5539816584076695422c0da445e10b27fe7594a5cdd0ff0ef5e0280898fe13c6'
            '68be90bc8012ff79b67a8b3fedd84538a2a9f03500a85ecf90aa015880b6aaf0')


package() {
    # uplexa build system renamed the extracted folders to non version specific names
    if [ -e "${srcdir}/uplexa-v${pkgver}" ]; then
        echo "WARNING: Using existing files. To clean build run 'rm -r ${srcdir}/uplexa-v${pkgver}' and try again."
    else
        [ "$CARCH" == "x86_64" ] && mv "${srcdir}/uplexa-cmd-linux-x86_64/" "${srcdir}/uplexa-v${pkgver}"
    fi

    # Binary file
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-blockchain-ancestry" "${pkgdir}/usr/bin/uplexa-blockchain-ancestry"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-blockchain-depth" "${pkgdir}/usr/bin/uplexa-blockchain-depth"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-blockchain-export" "${pkgdir}/usr/bin/uplexa-blockchain-export"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-blockchain-import" "${pkgdir}/usr/bin/uplexa-blockchain-import"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-blockchain-mark-spent-outputs" "${pkgdir}/usr/bin/uplexa-blockchain-mark-spent-outputs"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-blockchain-usage" "${pkgdir}/usr/bin/uplexa-blockchain-usage"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexad" "${pkgdir}/usr/bin/uplexad"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-gen-trusted-multisig" "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-wallet-cli" "${pkgdir}/usr/bin/uplexa-wallet-cli"
    install -Dm755 "${srcdir}/uplexa-v${pkgver}/uplexa-wallet-rpc" "${pkgdir}/usr/bin/uplexa-wallet-rpc"

    # Configuration and service file
    install -Dm644 "${srcdir}/uplexad.conf" "${pkgdir}/etc/uplexad.conf"
    install -Dm644 "${srcdir}/uplexad.service" "${pkgdir}/usr/lib/systemd/system/uplexad.service"

    # License file
    install -Dm 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/uplexa/LICENSE"
}
