# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>
# Minimal version by: K900 <me@0upti.me>

pkgname=murmur-git-minimal
pkgver=1.2.5.2957.gd56005629
pkgrel=1
pkgdesc="The voice chat application server for Mumble (git version)"
arch=('x86_64')
url="http://mumble.sourceforge.net"
license=('BSD')
depends=('avahi' 'protobuf' 'qt5-base-headless')
makedepends=('git' 'boost' 'python')
conflicts=('murmur' 'murmur-static' 'murmur-ice')
provides=('murmur')
backup=("etc/murmur.ini")
install="murmur.install"
source=("git://github.com/mumble-voip/mumble.git"
    "murmur.dbus.conf"
    "murmur.service"
    "murmur.sysusers")
sha512sums=('SKIP'
            '97c7effdddec324e40195c36ef4927950a5de26d2ee2d268d89df6fb547207bbbe30292773316cae6f57ec9923244f205fb0edc377b798771ba7385e3c11d86a'
            'fc230c3d7119afed34485eeb84fd935968dc69e4a00cbdbebc3a4f4d4ce155613b4581e43c07208d513a6ba4d240ba84058a85f04b2188bfa406f70256f13f65'
            '5af28d0c2b2b072cfbd500b5f63549e88a86cf3fc15e4d2df89e787c4d2bafdecbe078a518e0d1b25d82f9873cb06838ec1c9ebed625ffb7e8c80fcd942ebf74')

_gitname="mumble"

pkgver() {
    cd ${srcdir}/${_gitname}
    git describe | sed 's/^v//;s/-/./g'
}

build() {
    cd ${srcdir}/${_gitname}

    qmake-qt5 main.pro CONFIG+="no-client no-ice no-grpc"
    make release
}

package() {
    cd ${srcdir}/${_gitname}

    sed -e "1i# vi:ft=cfg" \
      -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
      -e "s|;logfile=murmur.log|logfile=|" \
      -e "s|;uname=|uname=murmur|" \
      -i scripts/murmur.ini

    install -dm755 -o 122 -g 122 ${pkgdir}/var/lib/murmur    
    install -Dm755 release/murmurd ${pkgdir}/usr/bin/murmurd
    install -Dm644 scripts/murmur.ini ${pkgdir}/etc/murmur.ini
    install -Dm644 ${srcdir}/murmur.dbus.conf ${pkgdir}/etc/dbus-1/system.d/murmur.conf
    install -Dm644 README ${pkgdir}/usr/share/doc/murmur/README
    install -Dm644 man/murmurd.1 ${pkgdir}/usr/share/man/man1/murmurd.1
    install -Dm644 ${srcdir}/murmur.service ${pkgdir}/usr/lib/systemd/system/murmur.service
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/murmur.sysusers ${pkgdir}/usr/lib/sysusers.d/$pkgname.conf
}
