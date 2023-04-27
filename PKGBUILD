# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-desktop-git
pkgver=10.7.1.r29.g868c87eb
pkgrel=1
pkgdesc="A familiar, modern desktop environment - latest git"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/BuddiesOfBudgie/budgie-desktop"
license=('GPL2' 'LGPL')
depends=('budgie-screensaver' 'budgie-control-center' 'gnome-bluetooth' 'gnome-menus' 'gnome-session' 'gnome-themes-standard'
         'libgee' 'libpeas' 'libwnck3' 'mutter' 'accountsservice' 'ibus' 'zenity')
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
            '8bf90523787a7acf907adff557e0f578d8516f76c4c63aefe1395250f497324a')

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
