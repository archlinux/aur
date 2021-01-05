# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

_pkgname=ConsoleKit2
pkgname=consolekit-git
pkgver=r807.51c11c1
pkgrel=1
pkgdesc="A framework for defining and tracking users, login sessions, and seats"
arch=('i686' 'x86_64')
url="https://github.com/ConsoleKit2/ConsoleKit2"
license=('GPL-2.0')
provides=('consolekit' 'consolekit2')
replaces=('consolekit')
conflicts=('consolekit')
depends=('dbus' 'glib2' 'libx11' 'polkit-consolekit' 'udev' 'zlib')
optdepends=('consolekit-openrc: consolekit openrc initscript'
            'pm-utils: suspend/hibernate support')
makedepends=('acl' 'git' 'python' 'xmlto' 'docbook-xsl')
options=('libtool')
install=consolekit.install
source=("git://github.com/ConsoleKit2/ConsoleKit2"
        'consolekit.tmpfiles.conf')
sha256sums=('SKIP'
            '778552dc12b3c235bde200e476d4262da0c135f3f6f8b3e975a87881d1f154d1')
validpgpkeys=('6DD4217456569BA711566AC7F06E8FDE7B45DAAC')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	cd $srcdir/$_pkgname
    NOCONFIGURE=1 ./autogen.sh
}

build(){
	cd $srcdir/$_pkgname

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --with-rundir=/run \
        --libexecdir=/usr/lib/consolekit \
        --localstatedir=/var \
        --enable-polkit \
        --enable-pam-module \
        --enable-udev-acl \
        --enable-docbook-docs \
        --with-dbus-services=/usr/share/dbus-1/services \
        --with-xinitrc-dir=/etc/X11/xinit/xinitrc.d \
        --with-pam-module-dir=/usr/lib/security \
        --without-systemdsystemunitdir \
        --disable-cgroups

    make
}

package() {
    cd $srcdir/$_pkgname
    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}"/run
	
    install -D -m644 "$srcdir/consolekit.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/consolekit.conf"
}

# vim:set ts=4 sw=4 sts=4 et:
