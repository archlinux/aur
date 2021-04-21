# Maintainer: Charles Delfly <charles@delfly.fr>
pkgname=xs-update-manjaro
pkgver=3.5.5
pkgrel=3
pkgdesc="Automatic update of Archlinux/Manjaro System"
arch=('any')
url="https://github.com/lectrode/xs-update-manjaro"
license=('Unlicense')
groups=()
depends=('coreutils' 'curl' 'grep' 'pacman' 'iputils')
optdepends=('flatpak: flatpak package updates'
    'glib2: notifications with gdbus (Xfce, Gnome)'
    'libnotify: notifications with notify-send (partial Xfce and KDE)'
    'notify-desktop-git: notifications (Xfce, KDE, and Gnome)'
    'pacman-mirrors: update mirrors list (for Manjaro)'
    'pikaur: update AUR packages'
    'wget: replace curl for self update')
makedepends=('git')
provides=()
conflicts=()
replaces=()
options=()
backup=('etc/xs/auto-update.conf')
install=
source=("git+https://github.com/lectrode/$pkgname.git#tag=v$pkgver"
    'auto-update.conf'
    'xs-autoupdate.service'
    'xs-autoupdate.timer')
noextract=()
md5sums=('SKIP'
         'df6dc850f36c994113534259332bbe47'
         'e2bf3d15375818c2848517d9832e9548'
         'ecb692e534f7b36578189fa2a530154e')

prepare() {
    cd "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname"
    if ! pacman -Q manjaro-system > /dev/null 2>&1; then
        sed -i 's/manjaro-keyring manjaro-system//g' auto-update.sh
    fi
}

check() {
    cd "$srcdir/$pkgname"
}

package() {
    cd "$srcdir"
    mkdir -p $pkgdir/etc/{xdg/autostart,xs} $pkgdir/usr/lib/systemd/system $pkgdir/usr/share/{pixmaps,xs} 
    install -m 644 xs-autoupdate.service $pkgdir/usr/lib/systemd/system/
    install -m 644 xs-autoupdate.timer $pkgdir/usr/lib/systemd/system/
    install -m 644 $pkgname/xs-updatehelper.desktop $pkgdir/etc/xdg/autostart/
    install -m 644 auto-update.conf $pkgdir/etc/xs/
    install -m 644 $pkgname/ElectrodeXS.png $pkgdir/usr/share/pixmaps/
    install -m 755 $pkgname/auto-update.sh $pkgdir/usr/share/xs/
}
