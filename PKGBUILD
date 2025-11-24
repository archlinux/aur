# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/iwd-git by
# Maintainer: a821 <a821 at mail de>
# Contributor: mrdotx <klassiker at gmx.de>
# Contributor: AndyRTR <andyrtr at archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
_pkgname='iwd'
pkgname=iwd-nosystemd-git
pkgver=3.10.r0.g3e7a8fee
pkgrel=1
pkgdesc='Internet Wireless Daemon - compiled without support for systemd.'
arch=('x86_64')
url='https://git.kernel.org/cgit/network/wireless/iwd.git/'
license=('LGPL-2.1-or-later')
depends=(
    'glibc'
    'readline'
    'libreadline.so'
    'gcc-libs'
)
makedepends=(
    'git'
    'python-docutils'
    'dbus'
)
optdepends=('qrencode: for displaying QR code after DPP is started')
provides=('iwd')
conflicts=('iwd')
source=(
    'git+https://git.kernel.org/pub/scm/network/wireless/iwd.git'
    'git+https://git.kernel.org/pub/scm/libs/ell/ell.git'
)
sha256sums=('SKIP'
            'SKIP')
options=('!lto')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    # replace Debian "netdev" group with existing "network" group
    # see issues 2 and 3 on arch's gitlab iwd package
    sed -i 's/netdev/network/' src/iwd-dbus.conf wired/ead-dbus.conf

    # remove redefined _FORTIFY_SOURCE flag
    sed -i '/_FORTIFY_SOURCE/d' configure.ac

    # remove test that fails in chroot
    sed -r -i "s:unit/test-wsc(\.c)?::" Makefile.am
    sed -r -i "s:unit/test-storage(\.c)?::" Makefile.am

    autoreconf -vfi
}

build() {
    cd "$_pkgname"
    dbus-run-session ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/iwd \
        --enable-wired \
        --enable-ofono \
        --enable-hwsim \
        --disable-tools \
        --disable-systemd-service
    make
}

check() {
    make -C "$_pkgname" check
}

package() {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir"
    install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
