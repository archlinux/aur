# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=evolution-data-server
pkgname=$_pkgname-git
pkgver=3.46.0.r058.geeed4e5a90
pkgrel=1
pkgdesc="Centralized access to appointments and contacts"
arch=(i686 x86_64)
depends=(gtk4
         libcanberra
         libgdata
         libical
         libphonenumber
         libsignon-glib
         nss
         webkit2gtk
         )
makedepends=(git
             gnome-common
             gobject-introspection
             gperf
             gtk-doc
             vala
             )
options=(debug strip)
install=$_pkgname.install
url="https://wiki.gnome.org/Apps/Evolution"
license=(GPL)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
source=(evolution-data-server::git+https://gitlab.gnome.org/GNOME/evolution-data-server.git)
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        git describe --long | awk -F '-' '/-/{ printf "%s.r%3.3d.%s\n", $1, $2, $3 }'
}

build() {
        cd "$srcdir/$_pkgname"

        [ ! -d build ] && mkdir build
        cd build

        cmake .. -G Ninja \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIBEXEC_INSTALL_DIR=/usr/lib \
                -DSYSCONF_INSTALL_DIR=/etc \
                -DENABLE_GTK_DOC=OFF \
                -DENABLE_INTROSPECTION=ON \
                -DENABLE_UOA=OFF \
                -DENABLE_VALA_BINDINGS=ON \
                -DWITH_PHONENUMBER=ON \
                -DENABLE_WEATHER=OFF \

        ninja
}

package() {
        cd "$srcdir/$_pkgname/build"
        DESTDIR="$pkgdir" ninja install
}
