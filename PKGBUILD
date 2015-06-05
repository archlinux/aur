# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=blueman
pkgname=${_pkgname}-git
pkgver=2.0.r2.g9bd5a20
pkgrel=1
pkgdesc="A GTK+ Bluetooth Manager (BlueZ 5) - git"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/blueman-project/blueman"
depends=('bluez' 'dbus-glib' 'gconf' 'gtk3' 'notification-daemon' 'libnotify'
         'polkit' 'python-cairo' 'python-dbus' 'python-gobject'
         'python-pybluez' 'startup-notification')
optdepends=('dnsmasq: DHCP server for Network Access Point'
            'pulseaudio: for some audio support')
makedepends=('cython' 'git' 'intltool' 'libtool')
conflicts=('blueman' 'blueman-bzr')
provides=('blueman')
source=("${pkgname}"::"git+https://github.com/blueman-project/${_pkgname}.git")
sha1sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=3.0 \
        --disable-hal \
        --disable-sendto \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
