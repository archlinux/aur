# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: atie H. <atie.at.matrix@gmail.com>
# Contributor: alesko <askondro@gmail.com>

pkgname=clutter-git
pkgver=1.26.0.r28.g55093e304
pkgrel=1
pkgdesc="A toolkit for creating fast, portable, compelling dynamic UIs"
arch=('i686' 'x86_64')
url='http://clutter-project.org/'
license=('LGPL')
depends=('gtk3' 'cogl' 'libinput')
makedepends=('git' 'gobject-introspection' 'gtk-doc')
provides=("clutter=${pkgver}")
conflicts=('clutter')
source=('git://git.gnome.org/clutter')
md5sums=('SKIP')

pkgver() {
    cd clutter
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd clutter

    ./autogen.sh --prefix=/usr \
        --enable-introspection \
        --enable-egl-backend \
        --enable-gdk-backend \
        --enable-wayland-backend \
        --enable-x11-backend \
        --enable-evdev-input \
        --enable-wayland-compositor \
        --enable-gtk-doc

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd clutter
    make DESTDIR="$pkgdir" install
}
