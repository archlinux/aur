# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/iwd-git by
# Maintainer: a821 <a821 at mail de>
# Contributor: mrdotx <klassiker at gmx.de>
# Contributor: AndyRTR <andyrtr at archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
_pkgname='iwd'
pkgname=iwd-nosystemd-git
pkgver=3.12.r0.gd003d0e5
pkgrel=1
pkgdesc='Internet Wireless Daemon - compiled without support for systemd'
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
        '0001-rrm-fix-stack-buffer-overflow-in-rrm_report_beacon_r.patch'
        '0002-ie-fix-off-by-one-in-HE-Capabilities-Channel-Width-S.patch'
        '0003-ft-fix-mde_equal-self-comparison-and-type-mismatch.patch'
        '0004-ie-fix-uint8_t-underflow-in-FTE-sub-element-parser.patch')
b2sums=('SKIP'
        'SKIP'
        '74b38b31520f48a6f93d97b67f88ec36f873e9be77fdbf8aa91a460a990a3da11c54680c27b30bd0a7a3db3750cf2b4f009f75e32236c6aa482825e3069c8c0c'
        '2d0cdac22ced156f63ff03a855d8c247033e327aef4d748251fe987946ca370d757dcae91dc301a3b02ca2292cab9d7a724181a1ba5a30c241d3ccdcc48e3fe6'
        '4f4cffca5d4c93285579aee9436e8a7e25cdfbddd343f74651989fae7e259ca8f408be4c6153d9c49c5fa64d6c9a8816e3823eaea588e63e1c6595bcd30b93b4'
        'c47122453e939f70e60de1fc097b596cfede39749e8f4e518e3459da21f134b344cef3b633cb2726b5640469978f26e28a4e07171246c79f302ca7c30e37ba7c')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

     patch -Np1 -i ../0001-rrm-fix-stack-buffer-overflow-in-rrm_report_beacon_r.patch
     patch -Np1 -i ../0002-ie-fix-off-by-one-in-HE-Capabilities-Channel-Width-S.patch
     patch -Np1 -i ../0003-ft-fix-mde_equal-self-comparison-and-type-mismatch.patch
     patch -Np1 -i ../0004-ie-fix-uint8_t-underflow-in-FTE-sub-element-parser.patch
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
