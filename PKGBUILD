# Maintainer: LunarEclipse <luna@lunareclipse.zone>

pkgname=smart-notifier
pkgver=0.28_8
pkgrel=2
pkgdesc='Graphical hard disk health status notifier'
arch=('any')
url="https://salsa.debian.org/debian/smart-notifier"
license=('GPL2')
depends=('python' 'python-dbus' 'python-gobject' 'dbus' 'smartmontools>=5.34' 'gtk3')
makedepends=()
optdepends=()
provides=()
conflicts=()
install="smart-notifier.install"
#source=("$pkgname-$pkgver"::"git+https://salsa.debian.org/debian/smart-notifier.git#tag=debian/${pkgver/_/-}")
source=("$pkgname-$pkgver"::"git+https://salsa.debian.org/debian/smart-notifier.git#commit=83ce01b349c23d441ae6e02ee4b2810c198f02e8")
noextract=()
sha512sums=('SKIP')

# TODO: Possibly ask the Arch Linux maintainers to include a script with the `smartmontools` package that executes all scripts from a directory, configured in by default, like Debian seems to do
prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Apply the patches provided by Debian
    for _patch in $(cat debian/patches/series); do
        patch --forward --strip=1 --input="debian/patches/$_patch"
    done

    # Adjust a path in the smart-notifier script
    sed -i 's:/usr/share/smart-notifier:/usr/lib/smart-notifier:' 'scripts/smart-notifier'
    # Adjust the 60smart-notifier script for usage in Arch Linux
    sed -i 's: < "$1"::' 'scripts/60smart-notifier'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dt "$pkgdir/usr/lib/smart-notifier/smart_notifier/" "src/smart_notifier/gui.py" "src/smart_notifier/__init__.py" "src/smart_notifier/smart-notifier.xml"
    install -Dt "$pkgdir/usr/lib/smart-notifier/scripts/" "scripts/60smart-notifier" "scripts/smart-notifier"
    install -Dt "$pkgdir/etc/xdg/autostart/" "config/smart-notifier.desktop"
    install -Dm 644 -t "$pkgdir/usr/share/dbus-1/system.d/" "config/smart-notifier.conf"
    mkdir -p "$pkgdir/usr/bin/"
    ln -s "$pkgdir/usr/lib/smart-notifier/scripts/smart-notifier" "$pkgdir/usr/bin/smart-notifier"
}
