# Maintainer: Silvio Knizek <killermoehre@gmx.net>
_pkgname=xfconf
pkgname="${_pkgname}-git"
pkgver=4.16.0+102+gb836868
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
source=("git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
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
