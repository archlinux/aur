pkgname=tradingview-bin-latest
pkgver=2.14.0_1
pkgrel=1
pkgdesc="TradingView desktop client (prebuilt .deb, minimal installation, symlinked binary)"
arch=('x86_64')
url="https://www.tradingview.com"
license=('LicenseRef-TradingView')
depends=('gtk3' 'nss')
source=("https://tvd-packages.tradingview.com/ubuntu/stable/latest/jammy/tradingview_amd64.deb")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd "$srcdir"
    # Extract version from the .deb control info
    bsdtar -xf tradingview_amd64.deb control.tar.gz
    version=$(bsdtar -xOf control.tar.gz ./control | grep ^Version: | awk '{print $2}')
    version="${version//-/_}"
    echo "${version}"
}

package() {
    # Extract the .deb
    bsdtar -xf "${srcdir}/tradingview_amd64.deb" -C "${srcdir}"

    # Extract the tarball
    if [[ -f "${srcdir}/data.tar.xz" ]]; then
        bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    elif [[ -f "${srcdir}/data.tar.gz" ]]; then
        bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    else
        echo "ERROR: No data.tar.* found"
        exit 1
    fi

    # Remove debug folder
    rm -rf "${pkgdir}/opt/TradingView/debug"

    # Create symlink in path
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/TradingView/tradingview" "${pkgdir}/usr/bin/tradingview"

    # Fix directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}

