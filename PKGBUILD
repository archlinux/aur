# Maintainer: Cihan Alkan <cihanalk@gmail.com>

pkgname=ukui-settings-daemon
pkgver=1.1.6
pkgrel=1
pkgdesc="UKUI Ayar daemon"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL')
depends=('dbus-glib' 'libcanberra' 'libmatekbd' 'libmatemixer' 'libnotify'
         'ukui-desktop' 'nss' 'polkit')
makedepends=('intltool' 'python')
optdepends=()
groups=('ukui')
source=("git+https://github.com/ukui/ukui-settings-daemon.git")
sha256sums=('SKIP')

prepare() {
 cd ${pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd ${pkgname}
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname} \
        --sysconfdir=/etc \
        --enable-polkit \
        --enable-pulse

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
