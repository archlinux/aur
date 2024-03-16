# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gsconnect
pkgver=56
pkgrel=1
pkgdesc="KDE Connect implementation. GSConnect CLI usage without Gnome environment"
arch=(any)
url="https://github.com/GSConnect/gnome-shell-extension-$pkgname"
license=('GPL-2.0-or-later OR MPL-2.0')
depends=(dbus dconf gobject-introspection-runtime gjs gvc-git hicolor-icon-theme libnautilus-extension python python-gobject)
makedepends=(appstream coreutils desktop-file-utils eslint flake8 gettext glib2 gtk-update-icon-cache meson pkgconf python-black)
optdepends=('ydotool: generic command-line automation tool'
            'wtype: xdotool type for wayland'
            'wl-clipboard: command-line copy/paste utilities for Wayland'
            'waybar: highly customizable Wayland bar'
            'python-pydbus: for fetch gsconnect status for Waybar'
            'python-nautilus: Nautilus integration'
            'nemo-python: Nemo integration')
conflicts=(gnome-shell-extension-$pkgname)
options=(!debug)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname.service)
b2sums=('a389ad50585bed2826f6a4b12552c5d6ff431bf4674d23710c992eb4a89cd3ecc363cddb90a2e14c65f14061a4be1c43ab956e3646b814de454d32ef08e9cf91'
        'ecd31b50393dbbf23b5f33d16d11573200ce28fd818b99e3f54f269287c505b724fc55f0135809c679629842448b29f7986bed309baa6193aaf1211f144171b4')

build() {
    arch-meson -Dinstalled_tests=false -Dfirewalld=true gnome-shell-extension-$pkgname-$pkgver build
    meson compile -C build
}

package() {
    DESTDIR=$pkgdir meson install -C build
    install -Dm644 $pkgname.service -t $pkgdir/usr/lib/systemd/user/
    install -d     $pkgdir/usr/bin/
    ln -s /usr/share/gnome-shell/extensions/$pkgname@andyholmes.github.io/service/daemon.js    $pkgdir/usr/bin/$pkgname
    ln -s /usr/share/gnome-shell/extensions/$pkgname@andyholmes.github.io/$pkgname-preferences $pkgdir/usr/bin/$pkgname-preferences
}
