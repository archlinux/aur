# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-desktop-git
pkgver=10.6.r90.g41a6187d
pkgrel=1
pkgdesc="A familiar, modern desktop environment - latest git"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/BuddiesOfBudgie/budgie-desktop"
license=('GPL2' 'LGPL')
depends=('budgie-screensaver' 'budgie-control-center' 'gnome-bluetooth' 'gnome-menus' 'gnome-session' 'gnome-themes-standard'
         'libgee' 'libpeas' 'libwnck3' 'mutter' 'accountsservice' 'sassc' 'ibus')
makedepends=('meson' 'git' 'gobject-introspection' 'intltool' 'vala' 'gtk-doc')
optdepends=('budgie-desktop-view: Desktop icons'
            'network-manager-applet: Network management')
provides=('budgie-desktop')
conflicts=('budgie-desktop')
source=("$pkgname"::'git+https://github.com/BuddiesOfBudgie/budgie-desktop.git'
        "gvc"::"git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

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
    arch-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
