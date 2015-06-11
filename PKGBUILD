# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Martin Wimpress <code@flexion.org>

_pkgname=blueman
pkgname=python2-blueman
pkgver=2.0
pkgrel=1
pkgdesc="A GTK+ Bluetooth Manager (BlueZ 5) - Python2"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/blueman-project/blueman"
depends=('bluez' 'dbus-glib' 'gconf' 'gtk3' 'notification-daemon'
         'libnotify' 'polkit' 'python2-cairo' 'python2-dbus'
         'python2-gobject' 'python2-pybluez' 'startup-notification')
optdepends=('dnsmasq: DHCP server for Network Access Point'
            'pulseaudio: for some audio support')
makedepends=('autoconf' 'automake' 'cython2' 'intltool' 'libtool')
conflicts=('blueman-git' 'blueman-bzr' 'blueman')
source=("${_pkgname}-${pkgver}.zip"::"https://github.com/blueman-project/${_pkgname}/archive/${pkgver}.zip")
sha256sums=('8050900603104fb2d10a125d8466df0d9b7eb107b588738a37672f30f90ba99b')
install=${pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Replace the python interpreter with python2
    for PY in apps/blueman-*
    do
        sed -i 's/python/python2/' "${PY}"
    done
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PYTHON=/usr/bin/python2
    export CYTHONEXEC=/usr/bin/cython2
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
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
