# This is the 2.x branch of netatalk with compatibility for pre-OS X Mac
# systems
#
# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=netatalk2
_pkgname=netatalk
pkgver=2.2.10
pkgrel=1
pkgdesc="Open-source implementation of the Apple Filing Protocol (for old Macs)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://netatalk.sourceforge.io"
license=('GPL')
depends=(
    'acl'
    'avahi'
    'cracklib'
    'db' 
    'libcups'
    'libgcrypt'
    'libgpg-error'
    'libldap'
    'libxcrypt'
    'openslp'
    'openssl'
    'pam'
    'perl'
)
makedepends=()
optdepends=('cups: Printer support')
conflicts=(netatalk)
backup=(
    etc/pam.d/netatalk
    etc/netatalk/AppleVolumes.system
    etc/netatalk/netatalk.conf
    etc/netatalk/afp_ldap.conf
    etc/netatalk/atalkd.conf
    etc/netatalk/papd.conf
    etc/netatalk/afpd.conf
    etc/netatalk/AppleVolumes.default
)
options=()
install=
source=("https://github.com/Netatalk/$_pkgname/releases/download/$_pkgname-${pkgver//./-}/$_pkgname-$pkgver.tar.bz2"
        "01-systemctl.patch")
sha256sums=('0443368ec1a6019c41a0406d34fe6681b00207a5abe8a8a731a557d1d2a998e8'
            '79d914326b23aa3fdf6fbfd202d7865049ce278f30558f3bfa057a7c66fa8353')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i "$srcdir/01-systemctl.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --localstatedir=/var \
        --runstatedir=/run \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib \
        --sysconfdir=/etc \
        --enable-a2boot \
        --enable-ddp \
        --enable-pgp-uam \
        --enable-shared \
        --enable-srvloc \
        --enable-systemd \
        --enable-timelord \
        --enable-zeroconf \
        --with-cnid-cdb-backend \
        --with-cracklib
    make
}

check() {
    cd "$_pkgname-$pkgver"
    make -k check
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" servicedir=/usr/lib/systemd/system install
    # Conflicting header with glibc. The workaround sucks, but I can't think
    # of a good option.
    mv "$pkgdir/usr/include/netatalk/at.h" "$pkgdir/usr/include/netatalk/at-netatalk.h"
}
