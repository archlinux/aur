# Maintainer: xeruf <27jf at pm dot me>
# Creator: dilipvamsi <m.dilipvamsi at gmail dot com>

_pkgname='arangodb'
pkgname="${_pkgname}-bin"
pkgdesc="Arangodb binary from deb."
pkgver=3.10.6
pkgrel=1
arch=('x86_64')
url="https://www.arangodb.com/"
license=('APACHE')
provides=(${_pkgname})
conflicts=(
    "${_pkgname}"
    "${_pkgname}-client-bin"
)
source=("https://download.arangodb.com/arangodb$(echo "${pkgver}" | cut -d '.' -f1-2 | tr -d '.')/Community/Linux/arangodb3_${pkgver}-1_amd64.deb")
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha256sums=('ceb5d51f4cafbe1d2817b6204941890fd25300c0d3dc3f9c1c2bb9b533f82234')
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
