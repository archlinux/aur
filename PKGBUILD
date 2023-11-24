# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite-beta-bin
_pkgname=AirVPN-Suite
pkgver=2.0.0
_pkgver=2.0
_prstage=alpha
_prver=2
pkgrel=2
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt beta"
arch=('x86_64' 'armv7l' 'aarch64')
url="https://airvpn.org/linux/suite"
_dlurl="https://eddie.website/repository"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
depends=('glibc' 'gcc-libs' 'dbus' 'openssl' 'libxml2')
makedepends=('curl')
source=("$_dlurl/$_pkgname/$_pkgver-$_prstage$_prver/$_pkgname-$arch-$pkgver-$_prstage-$_prver.tar.gz"
        "airvpn-suite.sysusers")
sha512sums=(`curl -sLo - "$_dlurl/$_pkgname/$_pkgver-$_prstage$_prver/$_pkgname-$arch-$pkgver-$_prstage-$_prver.tar.gz.sha512"|cut -f1 -d " "`
            'bae4fad4ef209f91f2473101713f0d58db7d4db9eb6b706508527422cf029aa631a7d877eb88d80bcb6c14ecf562f2cc88816200d83a8288cb7b3619261ba72c')
backup=('etc/airvpn/bluetit.rc')
install="$pkgname.install"
changelog="Changelog-Suite.txt"

package() {
    cd "$srcdir/$_pkgname"

    # place binaries
    install -Dm755 bin/bluetit "$pkgdir/usr/bin/bluetit"
    install -Dm755 bin/goldcrest "$pkgdir/usr/bin/goldcrest"
    install -Dm755 bin/hummingbird "$pkgdir/usr/bin/hummingbird"
    install -Dm4755 -g airvpn bin/cuckoo "$pkgdir/usr/bin/cuckoo"

    # place documentation
    install -Dm755 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # place license
    install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

    # place configuration
    install -Dm600 -t "$pkgdir/etc/airvpn/" etc/airvpn/*

    # place D-Bus config
    install -Dm644 -t "$pkgdir/etc/dbus-1/system.d/" etc/dbus-1/system.d/*

    # place Systemd files
    install -Dm644 etc/systemd/system/bluetit.service "$pkgdir/usr/lib/systemd/system/bluetit.service"
    install -Dm644 ../airvpn-suite.sysusers "$pkgdir/usr/lib/sysusers.d/airvpn-suite.conf"
}
