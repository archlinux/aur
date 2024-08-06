# Maintainer: scorpion-26 <dev dot scorpion26 at gmail dot com>

_pkgname=gBar
pkgname=gbar-git
pkgver=r257.b1e2c2e
pkgrel=1
# Architectures which are atleast confirmed to somewhat work.
arch=('x86_64' 'aarch64')
pkgdesc='Blazingly fast status bar written with GTK'
url='https://github.com/scorpion-26/gBar'
source=("$_pkgname::git+$url")
license=('MIT')
provides=('gbar=$(pkgver)')
conflicts=('gbar')
depends=('cairo'
         'gdk-pixbuf2'
         'glib2'
         'gtk3'
         'gtk-layer-shell'
         'libdbusmenu-gtk3'
         'libpulse'
         'libsass'
         'pamixer'
         'pulse-native-provider'
         'wayland')
optdepends=('bluez-utils: Bluetooth support'
            'dbus: Tray and bluetooth support'
            'hyprland: Workspace widgets'
            'nvidia-utils: Nvidia GPU support'
            'pacman-contrib: Arch update checking')
makedepends=('git' 'meson' 'ninja' 'python-packaging' 'glib2-devel')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson setup build -Dbuildtype=release -Dprefix=/usr
    meson compile -C build
}

package() {
    cd "$_pkgname"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    # TODO: Install default config into /usr/share (not supported by gBar)
}
