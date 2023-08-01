# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>

pkgname=binance-bin
_pkgname=binance
pkgver=latest
pkgrel=3
pkgdesc="Buy & sell Crypto in minutes, join the world's largest crypto exchange"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('MIT')
provides=('binance')
conflicts=('binance')
depends=('nspr' 'nss' 'gtk3' 'alsa-lib')
source=(
    "${_pkgname}-latest.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb"
    "checksum.txt::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux-deb-sha256.txt"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    tar -zxvf "${srcdir}/control.tar.gz" -C "${srcdir}"  > /dev/null
    grep -E '^Version:' control | awk '{print $2}'
}

check() {
    cd "$srcdir"

    DEBFILEHASH=$(sha256sum ${_pkgname}-latest.deb | awk '{print $1}')
    CORRECTHASH=$(cat checksum.txt)

    [[ "$DEBFILEHASH" == "$CORRECTHASH" ]]
}

package() {
    mkdir -p "${srcdir}/data"
    tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/data"

    install -Dd "${pkgdir}/opt"
    cp -r "${srcdir}/data/opt/Binance" "${pkgdir}/opt/Binance"

    install -Dm644 "${srcdir}/data/opt/Binance/resources/icons/size/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/binance.png"
    install -Dm644 "${srcdir}/data/usr/share/applications/binance.desktop" "${pkgdir}/usr/share/applications/binance.desktop"
    install -Dm644 "${srcdir}/data/usr/share/doc/binance/changelog.gz" "${pkgdir}/usr/share/doc/binance/changelog.gz"

    install -Dd "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}

