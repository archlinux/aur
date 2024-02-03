# This is the 2.x branch of netatalk with compatibility for pre-OS X Mac
# systems
#
# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=netatalk2
_pkgname=netatalk
pkgver=2.3.1
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
source=("https://github.com/Netatalk/$_pkgname/releases/download/$_pkgname-${pkgver//./-}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('47f531841aa7499587302b3b83af8031ae6368c9d349a1a202e8d4226c4bc84e')

#prepare() {
#    cd "$_pkgname-$pkgver"
#    for p in "$srcdir/"*.patch; do
#        echo "Applying patch: $p"
#        patch -p1 -i "$p"
#    done
#}

build() {
    cd "$_pkgname-$pkgver"
    autoreconf -fi
    rm -rf ../build
    mkdir ../build
    cd ../build
    "../$_pkgname-$pkgver/configure" \
        --disable-install-privileged \
        --disable-zeroconf \
        --enable-ddp \
        --enable-pgp-uam \
        --enable-shared \
        --enable-srvloc \
        --enable-systemd \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --prefix=/usr \
        --runstatedir=/run \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --with-systemd-prefix=/usr/lib \
        --without-cracklib
    make
}

check() {
    #cd "$_pkgname-$pkgver"
    cd build
    make -k check
}

package() {
    #cd "$_pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
