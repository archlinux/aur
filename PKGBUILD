# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gsconnect-git
pkgver=56.r15.g43594cc
pkgrel=4
pkgdesc="KDE Connect implementation. GSConnect CLI usage without Gnome environment"
arch=(any)
url="https://github.com/GSConnect/gnome-shell-extension-${pkgname%-git}"
license=('GPL-2.0-or-later OR MPL-2.0')
depends=(dbus dconf gobject-introspection-runtime gjs gvc-git hicolor-icon-theme libnautilus-extension python python-gobject)
makedepends=(appstream coreutils desktop-file-utils eslint flake8 gettext git glib2 gtk-update-icon-cache meson pkgconf python-black)
optdepends=('ydotool: generic command-line automation tool'
            'wtype: xdotool type for wayland'
            'wl-clipboard: command-line copy/paste utilities for Wayland'
            'waybar: highly customizable Wayland bar'
            'python-pydbus: for fetch gsconnect status for waybar'
            'python-nautilus: Nautilus integration'
            'nemo-python: Nemo integration')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git} gnome-shell-extension-${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git
        ${pkgname%-git}.service)
b2sums=('SKIP'
        'ecd31b50393dbbf23b5f33d16d11573200ce28fd818b99e3f54f269287c505b724fc55f0135809c679629842448b29f7986bed309baa6193aaf1211f144171b4')

pkgver() {
    git -C ${pkgname%-git} describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson -Dinstalled_tests=false -Dfirewalld=true ${pkgname%-git} build
    meson compile -C build
}

package() {
    DESTDIR=$pkgdir meson install -C build
    install -Dm644 ${pkgname%-git}.service -t $pkgdir/usr/lib/systemd/user/
    install -d     $pkgdir/usr/bin/
    ln -s /usr/share/gnome-shell/extensions/${pkgname%-git}@andyholmes.github.io/service/daemon.js           $pkgdir/usr/bin/${pkgname%-git}
    ln -s /usr/share/gnome-shell/extensions/${pkgname%-git}@andyholmes.github.io/${pkgname%-git}-preferences $pkgdir/usr/bin/${pkgname%-git}-preferences
}
