# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-control-center-git
pkgver=1.0.1.r64.g11a92640a
pkgrel=1
pkgdesc="Budgie's main interface to configure various aspects of the desktop, latest git"
url="https://github.com/BuddiesOfBudgie/budgie-control-center"
license=(GPL)
arch=(x86_64)
depends=(budgie-desktop gnome-online-accounts libgtop libpwquality smbclient libcheese libnma
         udisks2 libhandy gsound colord-gtk)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
            'power-profiles-daemon: Power profiles support')
provides=(budgie-control-center)
conflicts=(budgie-control-center gnome-control-center)
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
