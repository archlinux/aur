# Maintainer: Silvio Knizek <killermoehre@gmx.net>
_pkgname=xfconf
pkgname="${_pkgname}-git"
pkgver=4.13.5.r54.gd2b8a3e
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system - git checkout"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4util' 'dbus-glib')
makedepends=('intltool' 'git' 'xfce4-dev-tools' 'perl-extutils-depends' 'perl-extutils-pkgconfig' 'glib-perl' 'chrpath')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname" 'terminal')
replaces=("$_pkgname" 'terminal')
source=("git://git.xfce.org/xfce/$_pkgname")
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh \
        --disable-dependency-tracking \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --localstatedir=/var \
        --disable-static \
        --enable-gtk-doc \
        --enable-checks \
        --with-perl-options=INSTALLDIRS="vendor"
    make
}
package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install

    # Fix insecure rpath, http://bugs.archlinux.org/task/19980
    find "$pkgdir" -name Xfconf.so -exec chrpath -d {} +
}
