# Maintainer: Chiwan Park <chiwanpark@hotmail.com>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=test-repair-check
pkgver=22.8r5_b41063
pkgrel=2
pkgdesc='Ivanti Secure Access Client'
arch=(x86_64)

license=(custom)
url='https://www.pulsesecure.net/'

source=("EULA.txt")
source_x86_64=("https://dl.vpn.ucsb.edu/clients/Linux%20VPN%20Client/ps-pulse-linux-22.8r5-b41063-installer.rpm")
md5sums=('261848a28201e5386ec4bf587473a48b')
md5sums_x86_64=('93a073f8ff0f30d71bb603388dadb417')
optdepends=('npm' 'psmisc: for pulsesvc -K', 'gtkmm3: for pulseUi', 'webkit2gtk: for pulseUi')
conflicts=(pulse-connect-secure)
options=(!strip)

package() {
    install -Dm644 EULA.txt "$pkgdir"/usr/share/licenses/pulse-secure/EULA.txt

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
    mkdir -p "$pkgdir"/var/lib/pulsesecure/pulse
    ln -s /opt/pulsesecure/resource/pulse.desktop "$pkgdir"/usr/share/applications/pulse.desktop
    ln -s /opt/pulsesecure/lib/JUNS/net.psecure.pulse.conf "$pkgdir"/usr/share/dbus-1/system.d/net.psecure.pulse.conf
    mkdir -p "$pkgdir"/etc/pki/ca-trust/extracted/openssl
    ln -sf /etc/ca-certificates/extracted/ca-bundle.trust.crt "$pkgdir"/etc/pki/ca-trust/extracted/openssl/ca-bundle.trust.crt
    for f in $(find opt/pulsesecure/lib/JUNS/interfaces -type l); do
        ln -s $(readlink $f) "$pkgdir"/"$f" ;
    done
}
depends=(curl dbus dmidecode gcc-libs libbsd libsecret npm openssl patch)
