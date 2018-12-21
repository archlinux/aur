# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=muffin-git
pkgver=4.0.5.r0.gf001ea2
pkgrel=1
pkgdesc="A window manager for GNOME"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/muffin"
license=('GPL')
depends=('cinnamon-desktop' 'gobject-introspection-runtime' 'libcanberra' 'libinput'
         'libsm' 'libxkbcommon-x11' 'startup-notification' 'zenity')
makedepends=('git' 'intltool' 'gobject-introspection' 'gtk-doc' 'gnome-doc-utils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!emptydirs')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}"/${pkgname%-git}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --libexecdir=/usr/lib/muffin \
                --localstatedir=/var \
                --disable-gtk-doc \
                --disable-static \
                --disable-schemas-compile \
                --enable-compile-warnings=minimum

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}"/${pkgname%-git}

    make DESTDIR="${pkgdir}" install

    # Remove unused stuff
    make -C src DESTDIR="${pkgdir}" uninstall-binPROGRAMS uninstall-desktopfilesDATA
    make -C src/tools DESTDIR="${pkgdir}" uninstall
    make -C src/compositor/plugins DESTDIR="${pkgdir}" uninstall
    make -C doc/man DESTDIR="${pkgdir}" uninstall
}
