# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-control-center-git
pkgver=v1.0.0.r2.g5cb3b3deb
pkgrel=2
pkgdesc="Budgie's main interface to configure various aspects of the desktop, latest git"
url="https://github.com/BuddiesOfBudgie/budgie-control-center"
license=(GPL2)
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
source=("$pkgname"::"git+https://github.com/BuddiesOfBudgie/budgie-control-center.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init
    meson build --prefix=/usr --sysconfdir=/etc -Ddocumentation=true
}


build() {
    cd "$srcdir/$pkgname"
    meson compile -C build
}

package() {
    cd "$srcdir/$pkgname"
    meson install -C build --destdir "$pkgdir"
}
