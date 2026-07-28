# Maintainer: Jiao Sun <xzzzf.dsx@gmail.com>
# Contributor: Jiao Sun <xzzzf.dsx@gmail.com>

pkgname=marvis-client
pkgver=1.0.0
pkgrel=1
pkgdesc="Marvis Client for eduroam authentication"
arch=('x86_64')
url="https://www.juniper.net/us/en/products/software/mist/marvis.html"
license=('custom')
depends=('glibc')
makedepends=('tar')
source=("https://mobile.mist.com/installers/marvisclient/linux_debian_x86/${pkgver}/marvisclient-installer.deb")
# When updating the script, write sha256sums=('SKIP') and run `updpkgsums`, 'SKIP' will be automatically replaced with the correct sha256sums.
sha256sums=('7de8b2372279f9b99fb770c020e5556f70e388341715db87bb15b86026fd8361')
options=('!strip')

package() {
    cd "$srcdir"

    # Extract the control tarball for license
    if [ -f control.tar.gz ]; then
        bsdtar -xf control.tar.gz -C "$pkgdir" || true
    fi

    # Extract the data tarball (contains the actual files)
    if [ -f data.tar.xz ]; then
        bsdtar -xf data.tar.xz -C "$pkgdir"
    elif [ -f data.tar.zst ]; then
        bsdtar -xf data.tar.zst -C "$pkgdir"
    elif [ -f data.tar.gz ]; then
        bsdtar -xf data.tar.gz -C "$pkgdir"
    fi

    # Ensure binary is executable
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true

    # Install license if present
    install -Dm644 "$srcdir/control" "$pkgdir/usr/share/licenses/$pkgname/control" 2>/dev/null || true
}
