# Maintainer: David P. <megver83@parabola.nu>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

_pkgname=dbus
_commit=73961ee58cf47315b14e30fbde6d0eea825c987b  # tags/dbus-1.10.18^0

pkgname=dbus-elogind
pkgver=1.10.18
pkgrel=1
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
provides=('libdbus' "dbus=$pkgver" "dbus-x11=$pkgver")
conflicts=('libdbus' 'dbus' 'dbus-x11')
depends=('expat' 'libx11' 'libelogind')
makedepends=('xmlto' 'docbook-xsl' 'python' 'yelp-tools' 'doxygen' 'git')
optdepends=('dbus-openrc: dbus initscript')
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=$_commit"
        'dbus-enable-elogind.patch')
sha256sums=('SKIP'
            'faffcaa5b295f49fcedeed2c9ece5298949096be3062fd99a4bf1a6ac3ad1ea0')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

prepare() {
    cd $_pkgname
    git cherry-pick -n 09cb6d7b467f6d1c6685ee9ccc171f4dddbe1f42
    patch -Np 1 -i ${srcdir}/dbus-enable-elogind.patch
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $_pkgname
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/dbus-1.0 \
        --with-dbus-user=dbus \
        --with-system-pid-file=/run/dbus/pid \
        --with-system-socket=/run/dbus/system_bus_socket \
        --with-console-auth-dir=/run/console/ \
        --enable-inotify \
        --enable-elogind \
        --disable-static \
        --disable-verbose-mode \
        --disable-asserts \
        --without-systemdsystemunitdir \
        --disable-systemd \
        --disable-user-session \
        --enable-x11-autolaunch

    make
}

check() {
    cd $_pkgname
    make check
}

package() {
    cd $_pkgname

    make DESTDIR="$pkgdir" install

    rm -r "$pkgdir/var/run"

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

    # Remove docs
    rm -r "$pkgdir/usr/share/doc"
}
