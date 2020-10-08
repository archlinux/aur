# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Contributor   : Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dbus-nosystemd-git
pkgbasename=dbus
pkgver=1.12.20
pkgrel=1
arch=('x86_64')
pkgdesc="Freedesktop.org message bus system (32-bit)"
license=(GPL custom)
url="https://gitlab.freedesktop.org/dbus/dbus"

source=("git+https://gitlab.freedesktop.org/dbus/dbus.git"
	'no-fatal-warnings.diff')

provides=(
    'lib32-libdbus' 'lib32-dbus')

conflicts=(
    'lib32-libdbus' 'lib32-dbus')

replaces=(
    'lib32-libdbus')

depends=(
    'dbus')

makedepends=(
    'lib32-gcc-libs'
    'lib32-expat'
    'git'
    'autoconf-archive')

pkgver() {
    cd "${pkgbasename}"
    git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {

    cd "${pkgbasename}"

# Allow us to enable checks without them being fatal
  patch -Np1 -i ../no-fatal-warnings.diff

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

    cd "${pkgbasename}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libdir=/usr/lib32 \
        --libexecdir=/usr/lib/dbus-1.0 \
        runstatedir=/run \
        --with-system-pid-file=/run/dbus/pid \
        --with-system-socket=/run/dbus/system_bus_socket \
        --with-dbus-session-bus-listen-address=unix:runtime=yes \
        --with-dbus-session-bus-connect-address=autolaunch: \
        --with-dbus-user=dbus \
        --with-console-auth-dir=/run/console/ \
        --enable-inotify \
        --disable-static \
        --disable-verbose-mode \
        --disable-asserts \
        --disable-systemd \
        --without-systemdsystemunitdir \
        --disable-user-session \
        --without-x \
        --disable-x11-autolaunch \
        --disable-checks
    make
}

#check() {
#    make -C "${pkgbasename}" check
#}

package() {
    DESTDIR="${pkgdir}" make -C "${pkgbasename}" install

    rm -r "${pkgdir}"/usr/{bin,include,lib,share}
    rm -r "${pkgdir}"/{etc,var}

    install -d "${pkgdir}/usr/share/licenses"
    ln -s "${pkgbasename}" "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP'
	    'SKIP')
