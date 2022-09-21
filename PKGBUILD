# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=nimbus-git
_gitname=nimbus
pkgver=1.0.r7.g172733a
pkgrel=2
pkgdesc="The default OpenIndiana theme"
arch=("any")
url="https://github.com/OpenIndiana/nimbus"
license=("GPL")
depends=("gtk3" "gtk2")
makedepends=("git" "glib2" "gdk-pixbuf2" "icon-naming-utils" "intltool")
conflicts=("nimbus")
source=("git+$url"
        "bottom-panel-image.png"
        "top-panel-image.png")
sha256sums=('SKIP'
            'd0a4bb6018ddcd56c6662f22fc6494b91a464c4372ebdcbe101ac816aa6a1e27'
            '1e4ab3a16451487528622556f586e1ac007accc5e9bf51181824f96b9740a207')

pkgver() {
    cd "$srcdir/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_gitname}"
    mkdir m4
	libtoolize --copy --force
	glib-gettextize -f
	intltoolize --force --copy --automake
	aclocal -I m4
	autoheader
    automake --add-missing --copy --force
    autoconf
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
}

build() {
    cd "$srcdir/${_gitname}"
    make
}

package() {
    make -C "${_gitname}" install DESTDIR="$pkgdir"

    install -d -m755 "$pkgdir/usr/share/mate-panel/pixmaps/nimbus"
    install -m644 bottom-panel-image.png "$pkgdir/usr/share/mate-panel/pixmaps/nimbus/bottom-panel-image.png"
    install -m644 top-panel-image.png "$pkgdir/usr/share/mate-panel/pixmaps/nimbus/top-panel-image.png"
}
