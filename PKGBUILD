# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>

_use_zeroc_ice="1"
_use_grpc="1"

pkgname=murmur-git
pkgver=1.4.0.development.snapshot.006.r27.g8c99fe811
pkgrel=1
pkgdesc="The voice chat application server for Mumble (git version)"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.mumble.info/"
license=('BSD')
depends=('avahi' 'lsb-release' 'protobuf' 'qt5-base')

if [[ ${_use_zeroc_ice} == "1" ]]; then
    depends+=('zeroc-ice')
fi

if [[ ${_use_grpc} == "1" ]]; then
    depends+=('grpc')
fi

makedepends=('git' 'boost' 'python' 'cmake')
conflicts=('murmur' 'murmur-static' 'murmur-ice')
provides=('murmur')
backup=("etc/murmur.ini")
install="murmur.install"
source=("git+https://github.com/mumble-voip/mumble.git"
    "git+https://github.com/Krzmbrzl/FindPythonInterpreter.git"
    "murmur.dbus.conf"
    "murmur.service"
    "murmur.sysusers"
    "murmur.tmpfiles")
sha512sums=('SKIP'
            'SKIP'
            '97c7effdddec324e40195c36ef4927950a5de26d2ee2d268d89df6fb547207bbbe30292773316cae6f57ec9923244f205fb0edc377b798771ba7385e3c11d86a'
            'fc230c3d7119afed34485eeb84fd935968dc69e4a00cbdbebc3a4f4d4ce155613b4581e43c07208d513a6ba4d240ba84058a85f04b2188bfa406f70256f13f65'
            '5af28d0c2b2b072cfbd500b5f63549e88a86cf3fc15e4d2df89e787c4d2bafdecbe078a518e0d1b25d82f9873cb06838ec1c9ebed625ffb7e8c80fcd942ebf74'
            '411784e8e0dcf6c163780ae895ae1a6bdad0bb2dd2b128911c484ac3eff073d95c5791b625493a2b8296d24bd7e6ac72d3c42180817e48b29f0c6a8fd841807c')

_gitname="mumble"

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_gitname}"
    git submodule init
    git config submodule.3rdparty/FindPythonInterpreter.url $srcdir/FindPythonInterpreter
    git submodule update 3rdparty/FindPythonInterpreter
}

build() {
    CMAKE_OPTS="-Dclient:BOOL='OFF'"

    if [[ ${_use_zeroc_ice} == "0" ]]; then
        CMAKE_OPTS+=" -Dice:BOOL='OFF'"
    fi

    if [[ ${_use_grpc} == "1" ]]; then
        CMAKE_OPTS+=" -Dgrpc:BOOL='ON'"
    fi

    cmake -B build -S "${_gitname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        ${CMAKE_OPTS}
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install

    install -Dm644 murmur.dbus.conf "${pkgdir}"/usr/share/dbus-1/system.d/murmur.conf
    install -Dm644 murmur.service "${pkgdir}"/usr/lib/systemd/system/murmur.service
    install -Dm644 murmur.sysusers "${pkgdir}"/usr/lib/sysusers.d/murmur.conf
    install -Dm644 murmur.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/murmur.conf

    cd "${_gitname}"

    sed -e "1i; vi:ft=cfg" \
      -e "s|database=|database=/var/db/murmur/murmur.sqlite|" \
      -e "s|;logfile=murmur.log|logfile=|" \
      -e "s|;uname=|uname=murmur|" \
      -i scripts/murmur.ini

    install -Dm644 scripts/murmur.ini "${pkgdir}"/etc/murmur.ini
    install -Dm644 README.md "${pkgdir}"/usr/share/doc/murmur/README.md
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE


    if [[ ${_use_zeroc_ice} == "1" ]]; then
        install -Dm644 src/murmur/Murmur.ice "${pkgdir}"/usr/share/murmur/Murmur.ice
    fi

    if [[ ${_use_grpc} == "1" ]]; then
        install -Dm644 src/murmur/MurmurRPC.proto "${pkgdir}"/usr/share/murmur/MurmurRPC.proto
    fi
}
