# Maintainer: Chiwan Park <chiwanpark@hotmail.com>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=pulse-secure
pkgver=22.8r3_b35577
pkgrel=1
pkgdesc='Ivanti Secure Access Client'
arch=(x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends=(gcc-libs libgnome-keyring openssl curl dbus libbsd dmidecode patch)
install=${pkgname}.install
source=("EULA.txt" "setup_cef.sh.patch")
source_x86_64=("https://static.elisa.com/v2/image/2tqybbhjs47b/Mok3PsknSTt7cqboqWSvm/ps-pulse-linux-22.8r3-b35577-installer.rpm")
md5sums=('261848a28201e5386ec4bf587473a48b' 'f8446831883d4892df34209a736dc080')
md5sums_x86_64=('d9be65e4bc926ce65bcd27d68299af8c')
optdepends=('psmisc: for pulsesvc -K', 'gtkmm3: for pulseUi', 'webkit2gtk: for pulseUi')
conflicts=(pulse-connect-secure)

package() {
    install -Dm644 EULA.txt "$pkgdir"/usr/share/licenses/$pkgname/EULA.txt

    for d in $(find opt/pulsesecure -type d); do
        install -dm755 "$d" "$pkgdir"/"$d";
    done
    patch opt/pulsesecure/bin/setup_cef.sh setup_cef.sh.patch
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
    mkdir -p "$pkgdir"/var/lib/pulsesecure/pulse
    ln -s /opt/pulsesecure/resource/pulse.desktop "$pkgdir"/usr/share/applications/pulse.desktop
    ln -s /opt/pulsesecure/lib/JUNS/net.psecure.pulse.conf "$pkgdir"/usr/share/dbus-1/system.d/net.psecure.pulse.conf
    mkdir -p "$pkgdir"/etc/pki/ca-trust/extracted/openssl
    ln -sf /etc/ca-certificates/extracted/ca-bundle.trust.crt "$pkgdir"/etc/pki/ca-trust/extracted/openssl/ca-bundle.trust.crt
    for f in $(find opt/pulsesecure/lib/JUNS/interfaces -type l); do
        ln -s $(readlink $f) "$pkgdir"/"$f" ;
    done
}
