pkgname=arch-parental-controls
pkgver=1.0.0
pkgrel=2
pkgdesc="Arch Linux Parental Controls for supervised accounts"
arch=('x86_64')
url="https://github.com/jersobh/arch-parental-controls"
license=('GPL3')
depends=('python-gobject' 'gtk4' 'libadwaita' 'polkit' 'nftables' 'systemd' 'acl' 'curl')
makedepends=('cargo' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'gettext' 'git')
install="$pkgname.install"
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    # Build Rust daemon
    cd "$srcdir/$pkgname/age-signal"
    cargo build --release
    
    # Build Python package
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    # Install Rust daemon
    install -Dm755 "$srcdir/$pkgname/age-signal/target/release/arch-parental-daemon" "$pkgdir/usr/bin/arch-parental-daemon"

    # Install Python package
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install Polkit files
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/polkit-1/actions/org.archparentalcontrols.policy" "$pkgdir/usr/share/polkit-1/actions/org.archparentalcontrols.policy"
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/polkit-1/rules.d/50-arch-parental-controls.rules" "$pkgdir/usr/share/polkit-1/rules.d/50-arch-parental-controls.rules"

    # Install Desktop and Icon
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/applications/arch-parental-controls.desktop" "$pkgdir/usr/share/applications/arch-parental-controls.desktop"
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/icons/hicolor/scalable/apps/arch-parental-controls.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-parental-controls.svg"

    # Install helper scripts and daemon
    install -dm755 "$pkgdir/usr/lib/arch-parental-controls"
    install -m755 "$srcdir/$pkgname/data-files/usr/lib/arch-parental-controls/group-helper" "$pkgdir/usr/lib/arch-parental-controls/group-helper"
    install -m755 "$srcdir/$pkgname/age-signal/target/release/arch-parental-daemon" "$pkgdir/usr/lib/arch-parental-controls/arch-parental-daemon"

    # Install systemd units
    install -Dm644 "$srcdir/$pkgname/data-files/usr/lib/systemd/system/arch-parental-daemon.service" "$pkgdir/usr/lib/systemd/system/arch-parental-daemon.service"
    install -Dm644 "$srcdir/$pkgname/data-files/usr/lib/systemd/system/arch-parental-dns-restore.service" "$pkgdir/usr/lib/systemd/system/arch-parental-dns-restore.service"
    install -Dm644 "$srcdir/$pkgname/data-files/usr/lib/systemd/user/arch-parental-daemon.service" "$pkgdir/usr/lib/systemd/user/arch-parental-daemon.service"

    # Install DBus files
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/dbus-1/system.d/org.archparentalcontrols.ParentalDaemon.conf" "$pkgdir/usr/share/dbus-1/system.d/org.archparentalcontrols.ParentalDaemon.conf"
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/dbus-1/services/org.archparentalcontrols.ParentalDaemon.service" "$pkgdir/usr/share/dbus-1/services/org.archparentalcontrols.ParentalDaemon.service"
    install -Dm644 "$srcdir/$pkgname/data-files/usr/share/dbus-1/interfaces/org.archparentalcontrols.AgeSignal.xml" "$pkgdir/usr/share/dbus-1/interfaces/org.archparentalcontrols.AgeSignal.xml"

    # Install UI resources
    install -dm755 "$pkgdir/usr/share/arch-parental-controls"
    cp -r "$srcdir/$pkgname/src/arch_parental_controls/data/"* "$pkgdir/usr/share/arch-parental-controls/"

    # Compile and install translations
    for po in "$srcdir/$pkgname/data-files/locale/"*.po; do
        lang=$(basename "$po" .po)
        install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt "$po" -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/arch-parental-controls.mo"
    done

    # Set permissions for the data directory (755 allows UI to read settings)
    install -dm755 "$pkgdir/var/lib/arch-parental-controls"
}
