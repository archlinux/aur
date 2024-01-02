# This is the 2.x branch of netatalk with compatibility for pre-OS X Mac
# systems
#
# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=netatalk2
_pkgname=netatalk
pkgver=2.3.0
pkgrel=1
pkgdesc="Open-source implementation of the Apple Filing Protocol (for old Macs)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://netatalk.sourceforge.io"
license=('GPL')
depends=(
    'acl'
    # Avahi and SLP seem to be mutually exlusive due to bugs currently
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
sha256sums=('a47543fae63e46cdc762f05043fe648a25ee7498baea99b1885bf55be5a7ddd2')

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
        --prefix=/usr \
        --localstatedir=/var \
        --runstatedir=/run \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib \
        --sysconfdir=/etc \
        --disable-install-privileged \
        --enable-ddp \
        --enable-pgp-uam \
        --enable-shared \
        --enable-srvloc \
        --enable-systemd \
        --disable-zeroconf \
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
