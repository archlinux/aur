# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Felix Singer
# Contributor: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>

pkgname=murmur-snapshot-ice
pkgver=1.3.0_2868_g44b9004
pkgrel=2
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
	murmur.sysusers)
sha256sums=('28ba96277537376c7eee12a93832ba4a5909ec4833ab648d74de84b778d1275d'
            'SKIP'
            '25bf2dbd7574459724b4621fb93c09484dc7520297fa1d0f247a19b592d8cb8e'
            'ff58059e77eb73a5c9ad8eb4ad8d8d7c865f3ae1fb6cb236a729f742da95d83d')
validpgpkeys=('F3F5324A14AD0B32568F7839F0413B5CB858BD0E')
options=('emptydirs')

build() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    qmake-qt5 main.pro CONFIG+="no-client no-bonjour optimize"
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
    install -Dm644 ${srcdir}/murmur.sysusers ${pkgdir}/usr/lib/sysusers.d/murmur.conf
}
