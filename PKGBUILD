# Maintainer: M0Rf30
# Contributor: Sebastian Jug <seb AT stianj DOT ug>

pkgname=openbazaar-bin
_name=${pkgname%-bin}
pkgver=2.0.17
pkgrel=1
pkgdesc="OpenBazaar Client, Decentralized Peer to Peer Marketplace for Bitcoin -- Static binaries"
arch=('i686' 'x86_64')
url="https://github.com/OpenBazaar/OpenBazaar-Client"
license=('MIT')
depends=('gconf' 'glibc' 'libcap' 'gtk2' 'libgcrypt' 'libnotify' 'nss' 'libxtst' 'python' 'xdg-utils' 'desktop-file-utils' 'nodejs')
optdepends=('gvfs' 'lsb-release' 'gnome-keyring' 'libgnome-keyring')
conflicts=('openbazaar')
install="$pkgname.install"
source_i686=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_i386.deb")
source_x86_64=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_amd64.deb")
source=(icons.patch)

case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=i386 ;;
esac

package() {
    msg2 "Extracting the data.tar.xz..."
    tar -xf data.tar.xz -C "${pkgdir}/"

    msg2 "Cleaning up..."
    rm -r "$pkgdir"/usr/share/lintian/

    msg2 "Fixing permissions..."
    chmod -R 755 "$pkgdir"/usr/

    msg2 "Installing licenses..."
    install -Dm644 "$pkgdir/usr/lib/openbazaar2/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/${_name}/LICENSES.chromium.html"

    cd $pkgdir/usr/lib/openbazaar2/resources/app

    msg2 "Final Clean..."
    patch -Np1 -i $srcdir/icons.patch
    
    cd $pkgdir/usr/lib/openbazaar2/resources/app/temp/
    find . -type f ! -name "${_name}-go-linux-$GOARCH" -exec rm -f {} \;
}

md5sums=('008a9a6a82801d2a61c8463585e90f5d')
md5sums_i686=('ab5b16b64ebc704009a6da93b56cb8fb')
md5sums_x86_64=('98c282b376d2c1c008dd1e59939ff9c2')
