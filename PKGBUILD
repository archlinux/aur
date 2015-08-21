# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
pkgname=pertino
pkgver=470.4537
pkgrel=1
pkgdesc="Cloud-based VPN client"
arch=(i686 x86_64)
url="http://pertino.com/"
license=('proprietary')
depends=('dhclient')
makedepends=('sed')
_srcfileprefix="${pkgname}_${pkgver}-1_"
source_i686=("client.conf" "pgateway.service" "http://download.pertino.com/clients/linux/$(echo $pkgver | tr . -)/${_srcfileprefix}i386.deb")
source_x86_64=("client.conf" "pgateway.service" "http://download.pertino.com/clients/linux/$(echo $pkgver | tr . -)/${_srcfileprefix}amd64.deb")
noextract=("${source[@]%%::*}")
sha1sums_i686=(16c08a94d0e72d610fef71ed6ed0839db56d6484 1ed8d0eef425ca9ee605c3e9510010065e71b222 b70d22aaa843c5b99661778dfb789480d601af99)
sha1sums_x86_64=(16c08a94d0e72d610fef71ed6ed0839db56d6484 1ed8d0eef425ca9ee605c3e9510010065e71b222 891650db47a3943234d3d31d7b6be6aef729edb6)
install=${pkgname}.install
backup=(usr/share/pgateway/conf/client.conf)

package() {
    # extract source deb file
    if [ "x$CARCH" = "xx86_64" ]
    then
        srcfile=${_srcfileprefix}amd64.deb
    else
        srcfile=${_srcfileprefix}i386.deb
    fi
    mv "$srcfile" "$pkgdir"
    cd "$pkgdir"
    ar -xf "$pkgdir/$srcfile"
    tar -xzf data.tar.gz
    rm "$srcfile" "control.tar.gz" "data.tar.gz" "debian-binary"

    # Remove the other init scripts
    rm -rf "$pkgdir/opt/pertino/pgateway/init"

    # Move /opt into /usr/share
    mkdir -p "$pkgdir/usr/share"
    mv "$pkgdir/opt/pertino/pgateway" "$pkgdir/usr/share/"
    rmdir "$pkgdir/opt/pertino/"
    rmdir "$pkgdir/opt"

    # base config
    cp "$srcdir/client.conf" "$pkgdir/usr/share/pgateway/conf/client.conf"

    # systemd unit
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    cp "$srcdir/pgateway.service" "$pkgdir/usr/lib/systemd/system/pgateway.service"

    # Symlink the executables
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/share/pgateway/pGateway" "$pkgdir/usr/bin/pGateway"
    ln -s "/usr/share/pgateway/pertino" "$pkgdir/usr/bin/pertino"
}
