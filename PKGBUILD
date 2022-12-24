# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname=budgie-control-center-git
pkgver=1.1.1.r2.gd86f80693
pkgrel=1
pkgdesc="Budgie's main interface to configure various aspects of the desktop, latest git"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/BuddiesOfBudgie/budgie-control-center"
license=(GPL)
depends=(accountsservice gnome-bluetooth gnome-online-accounts gnome-settings-daemon ibus
         libgtop libpwquality smbclient libcheese libnma udisks2 libhandy gsound colord-gtk)
makedepends=(docbook-xsl modemmanager meson git)
optdepends=("system-config-printer: Printer settings"
            "gnome-user-share: WebDAV file sharing"
            "gnome-remote-desktop: Screen sharing"
            "rygel: Media sharing"
            "openssh: Remote login"
            "power-profiles-daemon: Power profiles support")
provides=(budgie-control-center)
conflicts=(budgie-control-center)
source=("$pkgname"::"git+https://github.com/BuddiesOfBudgie/budgie-control-center.git"
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
    git config submodule.gvc.url "$srcdir/gvc"
    git submodule update
}

build() {
    arch-meson "$pkgname" build -Ddocumentation=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
