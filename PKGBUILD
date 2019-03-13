# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Felix Singer
# Contributor: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>

pkgname=murmur-snapshot-ice
pkgver=1.3.0_2942_g755c290
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
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz"
	"https://github.com/mumble-voip/mumble/commit/ce0ecff200dd6e57a13c67b189406318595b52fb.patch"
	murmur.tmpfilesd
	murmur.sysusers)
sha256sums=('209cc0680fcf90adc8d374a0f73a932c3a3dfa71611d2a78a3036121e67f78a2'
            'af078c71af9a2892254c7104b1f6a73d98b2df03927b74c08f64f6f6d6826cc3'
            '25bf2dbd7574459724b4621fb93c09484dc7520297fa1d0f247a19b592d8cb8e'
            'ff58059e77eb73a5c9ad8eb4ad8d8d7c865f3ae1fb6cb236a729f742da95d83d')
#validpgpkeys=('F3F5324A14AD0B32568F7839F0413B5CB858BD0E')
options=('emptydirs')

prepare() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot
    patch --forward --strip=1 --input="${srcdir}/ce0ecff200dd6e57a13c67b189406318595b52fb.patch"
}

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
