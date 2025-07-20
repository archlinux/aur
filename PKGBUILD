# Maintainer: ElysiumOrpheus <contact@elysiumorpheus.com>
# Contributor: NyaMisty (Upstream Developer)
# Contributor: jkcoxson (Upstream Developer)

_altserver_ver=0.0.5
_netmuxd_ver=0.1.4

pkgname=altserver-linux-bin
pkgver=${_altserver_ver}
pkgrel=1
pkgdesc="Enables an AltServer-compatible server for sideloading apps on Linux"
arch=('x86_64')
url="https://github.com/NyaMisty/AltServer-Linux"
license=('GPL3') # IMPORTANT: Verify the license of all components! I am guessing here.
provides=("altserver-linux")
conflicts=("altserver-linux")
depends=(
    'avahi'
    'libimobiledevice'
    'libimobiledevice-glue'
    'libplist'
    'usbmuxd'
    'gtk3'
    'openssl'
    'libtatsu-git' # This is an AUR dependency
)
optdepends=(
    'docker: for running the required Anisette server'
)
source=(
    "altserver-v${_altserver_ver}::https://github.com/NyaMisty/AltServer-Linux/releases/download/v${_altserver_ver}/AltServer-x86_64"
    "netmuxd-v${_netmuxd_ver}::https://github.com/jkcoxson/netmuxd/releases/download/v${_netmuxd_ver}/x86_64-linux-netmuxd"
    'altserver.service'
    'netmuxd.service'
)
sha256sums=('0be7c3adc69ec1177a15032b3b8e37c5d0e4fefb47c9c439cd62c238b3ea17fb'
            'a0ce9047a2b46b8cb79bff628b3c55a78e4bfd13fb61ed418ffa00c7eeea9a27'
            'ba2f02cc7129d80029bd28cc00feb69323845c7ebacafdfc25f236d7fd24a738'
            '1502c76e4ff235528c369345621053403eb9997cc402cf77987c71f57ad99e5a')
install=${pkgname}.install

package() {
    cd "$srcdir"

    # Install binaries to /opt/altserver
    install -d "${pkgdir}/opt/altserver"
    install -m755 "altserver-v${_altserver_ver}" "${pkgdir}/opt/altserver/AltServer"
    install -m755 "netmuxd-v${_netmuxd_ver}" "${pkgdir}/opt/altserver/netmuxd"

    # Install systemd user services
    install -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "altserver.service" "${pkgdir}/usr/lib/systemd/user/"
    install -m644 "netmuxd.service" "${pkgdir}/usr/lib/systemd/user/"
}
