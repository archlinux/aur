# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Felix Singer
# Contributor: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>

pkgname=murmur-snapshot-ice
pkgver=1.3.0_2523_g5aaf1ed
pkgrel=1
pkgdesc="The voice chat application server for Mumble (development snapshot)"
arch=('i686' 'x86_64' 'armv7h')
url="https://wiki.mumble.info/wiki/"
license=('BSD')
depends=('protobuf' 'qt5-base' 'zeroc-ice')

makedepends=('boost' 'python')
conflicts=('murmur' 'murmur-static' 'murmur-ice' 'murmur-snapshot-noice')
provides=('murmur')
backup=("etc/murmur.ini")
install=murmur.install
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz"{,.sig}
	murmur.tmpfilesd
	murmur-ice3.7.patch)
sha256sums=('e08c5f5a3e0fdb147b917657d2e20a015ba4864fc2917642af8c61cd0ef26917'
            'SKIP'
            '25bf2dbd7574459724b4621fb93c09484dc7520297fa1d0f247a19b592d8cb8e'
            '4e67c3de52d7fe856dd9e0eb7be5eabb0f088bd85c7ded413108e1b8bf4fe327')
validpgpkeys=('C4666C6767A26017CE68406988048D0D625297A0')

prepare() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    patch -p1 -i "${srcdir}/murmur-ice3.7.patch"
}

build() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    qmake-qt5 main.pro CONFIG+="no-client no-bonjour optimize" INCLUDEPATH+="/usr/include/openssl-1.0" QMAKE_LFLAGS+="-L/usr/lib/openssl-1.0 -lssl -lcrypto"
    make release
}

package() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    sed -e "1i# vi:ft=cfg" \
      -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
      -e "s|;logfile=murmur.log|logfile=|" \
      -e "s|;uname=|uname=murmur|" \
      -e "s|;pidfile=|pidfile=/run/murmur/murmur.pid|" \
      -i scripts/murmur.ini

    sed -e "s|<policy user=\"mumble-server\">|<policy user=\"murmur\">|" -i scripts/murmur.conf

    install -dm755 ${pkgdir}/var/lib/murmur
    install -Dm755 release/murmurd ${pkgdir}/usr/bin/murmurd
    install -Dm644 scripts/murmur.ini ${pkgdir}/etc/murmur.ini
    install -Dm644 scripts/murmur.conf ${pkgdir}/etc/dbus-1/system.d/murmur.conf
    install -Dm644 README ${pkgdir}/usr/share/doc/murmur/README
    install -Dm644 man/murmurd.1 ${pkgdir}/usr/share/man/man1/murmurd.1
    install -Dm644 scripts/murmur.service ${pkgdir}/usr/lib/systemd/system/murmur.service
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 src/murmur/Murmur.ice ${pkgdir}/usr/share/murmur/Murmur.ice
    install -Dm644 ${srcdir}/murmur.tmpfilesd ${pkgdir}/usr/lib/tmpfiles.d/murmur.conf
}
