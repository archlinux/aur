# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>

_use_zeroc_ice="0"

pkgname=murmur-git
pkgver=1.2.5.606.g2c0d37f
pkgrel=1
pkgdesc="The voice chat application server for Mumble (git version)"
arch=('i686' 'x86_64')
url="http://mumble.sourceforge.net"
license=('BSD')
depends=('avahi' 'lsb-release' 'protobuf' 'qt4' 'icu')

if [[ ${_use_zeroc_ice} == "1" ]]; then
    depends=( "${depends[@]}" zeroc-ice )
fi

makedepends=('git' 'boost')
conflicts=('murmur' 'murmur-static' 'murmur-ice')
provides=('murmur')
backup=("etc/murmur.ini")
install="murmur.install"
source=("git://github.com/mumble-voip/mumble.git"
    "murmur.dbus.conf"
    "murmur.service")
md5sums=('SKIP'
         'eddea4cdbd0bde4b960a67e16b5d5478'
         'd27a9adcd7561859e7b033046729bc0e')

_gitname="mumble"

pkgver() {
    cd ${srcdir}/$_gitname
    git describe | sed 's/^v//;s/-/./g'
}

build() {
    cd ${srcdir}/${_gitname}

    # build

    if [[ $_use_zeroc_ice == "1" ]]; then
        qmake-qt4 main.pro CONFIG+="no-client"
    else
        qmake-qt4 main.pro CONFIG+="no-client no-ice"
    fi

    make release
}

package() {
    cd ${srcdir}/${_gitname}

    sed -e "1i# vi:ft=cfg" \
      -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
      -e "s|#logfile=murmur.log|logfile=|" \
      -e "s|#uname=|uname=murmur|" \
      -i scripts/murmur.ini

    install -dm755 -o 122 -g 122 ${pkgdir}/var/lib/murmur    
    install -Dm755 release/murmurd ${pkgdir}/usr/bin/murmurd
    install -Dm644 scripts/murmur.ini ${pkgdir}/etc/murmur.ini
    install -Dm644 ${srcdir}/murmur.dbus.conf ${pkgdir}/etc/dbus-1/system.d/murmur.conf
    install -Dm644 README ${pkgdir}/usr/share/doc/murmur/README
    install -Dm644 man/murmurd.1 ${pkgdir}/usr/share/man/man1/murmurd.1
    install -Dm644 ${srcdir}/murmur.service ${pkgdir}/usr/lib/systemd/system/murmur.service
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    if [[ $_use_zeroc_ice == "1" ]]; then
        install -Dm644 src/murmur/Murmur.ice ${pkgdir}/usr/share/murmur/Murmur.ice
    fi
}
