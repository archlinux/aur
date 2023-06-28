# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=blueman
pkgname=${_pkgname}-git
pkgver=2.3.beta1.r134.gb76b1bb2
pkgrel=1
pkgdesc="A GTK+ Bluetooth Manager (BlueZ 5) - git"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/blueman-project/blueman"
depends=('bluez' 'dbus-glib' 'gtk3' 'notification-daemon' 'libnotify'
         'polkit' 'python-cairo' 'python-dbus' 'python-gobject'
         'python-pybluez' 'startup-notification')
optdepends=('dnsmasq: DHCP server for Network Access Point'
            'pulseaudio: for some audio support')
makedepends=('cython' 'git' 'intltool' 'libtool')
conflicts=('blueman' 'blueman-bzr')
provides=('blueman')
source=("${pkgname}"::"git+https://github.com/blueman-project/${_pkgname}.git#branch=main")
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
        --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
    chmod 0750 "${pkgdir}"/usr/share/polkit-1/rules.d
}
