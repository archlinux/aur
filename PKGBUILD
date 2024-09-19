# This is the 2.x branch of netatalk with compatibility for pre-OS X Mac
# systems
#
# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=netatalk2
_pkgname=netatalk
pkgver=2.4.9
pkgrel=1
pkgdesc="Open-source implementation of the Apple Filing Protocol (for old Macs)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://netatalk.sourceforge.io"
license=('GPL-2.0-only')
depends=(
    'acl'
    # Avahi and SLP seem to be mutually exclusive due to bugs currently
    #'avahi'
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
makedepends=('meson')
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
source=(
    "https://github.com/Netatalk/$_pkgname/releases/download/$_pkgname-${pkgver//./-}/$_pkgname-$pkgver.tar.xz"
)
sha256sums=('c0901e40925eca22bed5eeec1a43606d8183dff97d0cd938d1e22a6be40aa182')

#prepare() {
#    cd "$_pkgname-$pkgver"
#    for p in "$srcdir/"*.patch; do
#        echo "Applying patch: $p"
#        patch -p1 -i "$p"
#    done
#}

build() {
    arch-meson "$_pkgname-$pkgver" build \
        --localstatedir /var \
        --sysconfdir /etc \
        -Dwith-cracklib=false \
        -Dwith-ddp=true \
        -Dwith-init-hooks=false \
        -Dwith-init-style=systemd \
        -Dwith-kerberos=false \
        -Dwith-pam-config-path=/etc/pam.d \
        -Dwith-pgp-uam=true \
        -Dwith-pkgconfdir-path=/etc/netatalk \
        -Dwith-spooldir=/var/spool/netatalk \
        -Dwith-srvloc=true \
        -Dwith-tests=true \
        -Dwith-zeroconf=false \
        -Dwith-lockfile-path=/run/lock/

    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    rm -rf "$pkgdir/etc/ld.so.conf.d"
    rm -rf "$pkgdir/usr/include/netatalk/at.h"
}
