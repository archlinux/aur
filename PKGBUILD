# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname=budgie-desktop-git
pkgver=10.7.1.r50.g84ccb505
pkgrel=1
pkgdesc="A familiar, modern desktop environment - latest git"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/BuddiesOfBudgie/budgie-desktop"
license=('GPL2' 'LGPL')
depends=('budgie-screensaver' 'budgie-control-center' 'gnome-bluetooth' 'gnome-menus' 'gnome-session' 'gnome-themes-standard'
         'libgee' 'libpeas' 'libwnck3' 'magpie-wm' 'accountsservice' 'ibus' 'zenity')
makedepends=('git' 'gobject-introspection' 'intltool' 'meson' 'dart-sass' 'vala' 'gtk-doc')
optdepends=('budgie-desktop-view: Desktop icons'
            'budgie-backgrounds: Default background set'
            'network-manager-applet: Network management in the panel'
            'switcheroo-control: Open apps with the secondary GPU')
provides=('budgie-desktop')
conflicts=('budgie-desktop')
source=("$pkgname"::'git+https://github.com/BuddiesOfBudgie/budgie-desktop.git'
        "gvc"::"git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        "30_org.archlinux.budgie-desktop.gschema.override")
sha256sums=('SKIP'
            'SKIP'
            '500efe7bc76e6c6c383e5fed55503d3071646cc0ee71524860d6efcf229a920a')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.gvc "$srcdir/gvc"
    git submodule update
}

build() {
    arch-meson "$pkgname" build -Duse-old-zenity=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm 644 30_org.archlinux.budgie-desktop.gschema.override -t "${pkgdir}/usr/share/glib-2.0/schemas"
}
