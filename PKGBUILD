# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Martin Wimpress <code@flexion.org>

pkgname=blueman
pkgver=2.0
pkgrel=2
pkgdesc="A GTK+ Bluetooth Manager (BlueZ 5)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/blueman-project/blueman"
depends=('bluez' 'dbus-glib' 'gconf' 'gtk3' 'notification-daemon'
         'libnotify' 'polkit' 'python-cairo' 'python-dbus'
         'python-gobject' 'python-pybluez' 'startup-notification')
optdepends=('dnsmasq: DHCP server for Network Access Point'
            'pulseaudio: for some audio support')
makedepends=('autoconf' 'automake' 'cython' 'intltool' 'libtool')
conflicts=('blueman-git' 'blueman-bzr')
source=("${pkgname}-${pkgver}.zip"::"https://github.com/blueman-project/${pkgname}/archive/${pkgver}.zip")
sha256sums=('8050900603104fb2d10a125d8466df0d9b7eb107b588738a37672f30f90ba99b')
install=${pkgname}.install

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export PYTHON=/usr/bin/python
    export CYTHONEXEC=/usr/bin/cython
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${pkgname} \
        --with-gtk=3.0 \
        --disable-hal \
        --disable-sendto \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
