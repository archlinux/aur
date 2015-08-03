# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
pkgname=pertino
pkgver=466.4505
pkgrel=1
pkgdesc="Cloud-based VPN client"
arch=(i686 x86_64)
url="http://pertino.com/"
license=('proprietary')
depends=('dhclient')
makedepends=('rpmextract' 'sed')
source=("http://download.pertino.com/clients/linux/$(echo $pkgver | tr . -)/$pkgname-$pkgver-1.$CARCH.rpm")
noextract=($(basename "${source[0]}"))
sha1sums=('9984674aacd0d9170b8ba838f6d7df7774244711')
install=${pkgname}.install

package() {
    srcfile="${noextract[0]}"
    mv "$srcfile" "$pkgdir"
    cd "$pkgdir"
    rpmextract.sh "$pkgdir/$srcfile"
    rm "$pkgdir/$srcfile"

    # Put the systemd unit in the proper place and patch the executable
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    sed -e 's#/opt/pertino/pgateway/pGateway#/usr/bin/pGateway#' \
        "$pkgdir/opt/pertino/pgateway/init/pgateway.service" \
        > "$pkgdir/usr/lib/systemd/system/pgateway.service"

    # Remove the other init scripts
    rm -rf "$pkgdir/opt/pertino/pgateway/init"

    # Move /opt into /usr/share
    mkdir -p "$pkgdir/usr/share"
    mv "$pkgdir/opt/pertino/pgateway" "$pkgdir/usr/share/"
    rmdir "$pkgdir/opt/pertino/"
    rmdir "$pkgdir/opt"

    # Symlink the executables
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/share/pgateway/pGateway" "$pkgdir/usr/bin/pGateway"
    ln -s "/usr/share/pgateway/pertino" "$pkgdir/usr/bin/pertino"
}
