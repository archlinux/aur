# Maintainer: dilipvamsi <m.dilipvamsi at gmail dot com>

_pkgname='arangodb'
pkgname="${_pkgname}-bin"
pkgdesc="Arangodb binary from deb."
pkgver=3.5.3
pkgrel=1
_pkgver='3.5.3-1'
arch=('x86_64')
url="https://www.arangodb.com/"
license=('APACHE')
provides=(${_pkgname})
conflicts=(
    "${_pkgname}"
    "${_pkgname}-client-bin"
)
source=(
    https://download.arangodb.com/arangodb34/Community/Linux/arangodb3_${_pkgver}_amd64.deb
)
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha256sums=(
    25b63ff6cd9dc97c270d46dfce0ca621c0de82d1d2cd03b20260c424418f3ad3
)
install=arangodb.install
package() {
    msg2 "Extracting the data.tar.gz..."
    tar -xf "data.tar.gz" -C $pkgdir

    msg2 "Removing /etc/init.d"
    rm -r $pkgdir/etc/init.d

    msg2 "Moving all binaries from /usr/sbin to /usr/bin and then removing it"
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
    rmdir $pkgdir/usr/sbin

    msg2 "Changing /usr/sbin to /usr/bin in arangodb3.service"
    sed -i 's/\/usr\/sbin/\/usr\/bin/g' $pkgdir/lib/systemd/system/arangodb3.service

    msg2 "Moving /lib to /usr/lib"
    mv $pkgdir/lib $pkgdir/usr
}
