# Maintainer: Daniel Playfair Cal <Daniel.playfair.cal@gmail.com>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Davide Depau <davide@depau.eu>

pkgname=mate-panel-git
_pkgname=mate-panel
sha256sums=('SKIP')
provides=(mate-panel)
pkgver=v1.25.3.r0.gb7f96b10
pkgrel=1
pkgdesc="The MATE Panel"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL')
depends=('dbus-glib' 'libwnck3' 'libcanberra' 'libmateweather' 'libsm' 'mate-menus' 'mate-desktop' 'gtk-layer-shell')
makedepends=('mate-common' 'yelp-tools' 'intltool' 'itstool' 'gobject-introspection' 'gtk-layer-shell')
source=("git+https://github.com/mate-desktop/mate-panel")
groups=('mate')
conflicts=('mate-panel-gtk3' 'mate-panel')
provides=('mate-panel-gtk3' 'mate-panel')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    	cd "${_pkgname}"
        ./autogen.sh
    	./configure \
        	--prefix=/usr \
        	--libexecdir=/usr/lib/${_pkgname} \
        	--sysconfdir=/etc \
        	--localstatedir=/var \
        	--enable-introspection \
		--enable-wayland

    	#https://bugzilla.gnome.org/show_bug.cgi?id=656231
    	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    	make
}

package() {
    	cd "${_pkgname}"
    	make DESTDIR="${pkgdir}" install
}
