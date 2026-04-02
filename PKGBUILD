# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=yggdrasil-jumper-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Automatic peer-to-peer NAT traversal for Yggdrasil overlay network'
arch=('x86_64' 'aarch64')
url='https://github.com/one-d-wide/yggdrasil-jumper'
license=('GPL-3.0-only')
install=yggdrasil-jumper-bin.install
depends=('yggdrasil')
optdepends=(
    'wireguard-tools: WireGuard bridge mode (no relay, kernel-level forwarding)'
    'conntrack-tools: required for WireGuard bridge mode'
)
provides=('yggdrasil-jumper')
conflicts=('yggdrasil-jumper')
options=('!debug')
source=('yggdrasil-jumper.service')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/one-d-wide/yggdrasil-jumper/releases/download/v${pkgver}/yggdrasil-jumper-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/one-d-wide/yggdrasil-jumper/releases/download/v${pkgver}/yggdrasil-jumper-linux-aarch64")
sha256sums=('860389725f4fc50dadec595ccef95496837b6397fb3214af10f393c24aa6cbf9')
sha256sums_x86_64=('bd5a6f30a3b1f2e9076fbb2343492ea373a793c7398fd823324eb1d9e12bc3c9')
sha256sums_aarch64=('cde8b598d27ff1daad8c569b08829b1f4ffc800c6268df3cdb8076d70afcbe00')

latestver() {
    gh api --paginate repos/one-d-wide/yggdrasil-jumper/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "yggdrasil-jumper-linux-x86_64")) | .tag_name' |
    head -1 | sed -E 's/^v//'
}

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${pkgname}-${pkgver}-x86_64" "$pkgdir/usr/bin/yggdrasil-jumper"
    else
        install -Dm755 "${pkgname}-${pkgver}-aarch64" "$pkgdir/usr/bin/yggdrasil-jumper"
    fi

    install -Dm644 yggdrasil-jumper.service "$pkgdir/usr/lib/systemd/system/yggdrasil-jumper.service"
}
