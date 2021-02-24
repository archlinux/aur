# Maintainer: Chiwan Park <chiwanpark@hotmail.com>

pkgname=pulse-secure
pkgver=9.1r11.0_b6725
pkgrel=1
pkgdesc='Pulse Connect Secure (PCS) Client'
arch=(x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends=(gcc-libs libgnome-keyring openssl curl dbus libbsd)
install=${pkgname}.install
source=(EULA.txt)
source_x86_64=("https://www.rz.uni-osnabrueck.de/fileadmin/user_upload/VPN/Software/ps-pulse-linux-9.1r11.0-b6725-64-bit-installer.rpm")
md5sums=('261848a28201e5386ec4bf587473a48b')
md5sums_x86_64=('f94e9bc2f08ca8fe26be7cd9fe23aa9f')
optdepends=('psmisc: for pulsesvc -K', 'gtkmm3: for pulseUi', 'webkit2gtk: for pulseUi')
conflicts=(pulse-connect-secure)

package() {
    install -Dm644 EULA.txt "$pkgdir"/usr/share/licenses/$pkgname/EULA.txt

    for d in $(find opt/pulsesecure -type d); do
        install -dm755 "$d" "$pkgdir"/"$d";
    done
    for f in $(find opt/pulsesecure/bin -type f); do
        install -Dm755 "$f" "$pkgdir"/"$f";
    done
    for f in $(find opt/pulsesecure/lib -type f); do
        install -Dm755 "$f" "$pkgdir"/"$f";
    done
    for f in $(find opt/pulsesecure/resource -type f); do
        install -Dm644 "$f" "$pkgdir"/"$f";
    done
    install -Dm644 usr/share/man/man1/pulse.1.gz "$pkgdir"/usr/share/man/man1/pulse.1.gz

    # we move service unit file to /usr/lib/systemd/system due to pacman limitation
    install -Dm644 lib/systemd/system/pulsesecure.service "$pkgdir"/usr/lib/systemd/system/pulsesecure.service

    mkdir -p "$pkgdir"/usr/share/applications/ "$pkgdir"/usr/share/dbus-1/system.d/ "$pkgdir"/opt/pulsesecure/lib/JUNS/interfaces
    ln -s /opt/pulsesecure/resource/pulse.desktop "$pkgdir"/usr/share/applications/pulse.desktop
    ln -s /opt/pulsesecure/lib/JUNS/net.psecure.pulse.conf "$pkgdir"/usr/share/dbus-1/system.d/net.psecure.pulse.conf
    for f in $(find opt/pulsesecure/lib/JUNS/interfaces -type l); do
        ln -s $(readlink $f) "$pkgdir"/"$f" ;
    done
}
