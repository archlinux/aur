# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cjs-git
pkgver=4.0.0.r2.gea081f32
pkgrel=2
pkgdesc="Javascript Bindings for Cinnamon"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('dbus-glib' 'gtk3' 'gobject-introspection-runtime' 'js52')
makedepends=('git' 'autoconf-archive' 'gobject-introspection')
checkdepends=('xorg-server-xvfb')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    autoreconf -fi
}

build() {
    cd "${srcdir}"/${pkgname%-git}

    ./configure --prefix=/usr \
                --libexecdir=/usr/lib \
                --disable-static

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

check() {
    cd "${srcdir}"/${pkgname%-git}

    # Needs a display
    xvfb-run make -k check || :
}

package() {
    cd "${srcdir}"/${pkgname%-git}

    make DESTDIR="${pkgdir}" install
}
