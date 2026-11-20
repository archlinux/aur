# Maintainer: a821 <a821 at mail de>
# Contributor: mrdotx <klassiker at gmx.de>
# Contributor: AndyRTR <andyrtr at archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

_pkgname='iwd'
pkgname=iwd-git
pkgver=3.12.r0.gd003d0e5
pkgrel=1
pkgdesc='Internet Wireless Daemon'
arch=('x86_64')
url='https://git.kernel.org/cgit/network/wireless/iwd.git/'
license=('LGPL-2.1-or-later')
depends=(
    'glibc'
    'readline'
    'libreadline.so'
    'libgcc'
)
makedepends=(
    'git'
    'python-docutils'
    'dbus'
    'systemd'
)
optdepends=('qrencode: for displaying QR code after DPP is started')
provides=('iwd')
conflicts=('iwd')
source=(
    'git+https://git.kernel.org/pub/scm/network/wireless/iwd.git'
    'git+https://git.kernel.org/pub/scm/libs/ell/ell.git'
    0001-use-network-group-for-unprivileged-access.diff
    0001-rrm-fix-stack-buffer-overflow-in-rrm_report_beacon_r.patch
    0002-ie-fix-off-by-one-in-HE-Capabilities-Channel-Width-S.patch
    0003-ft-fix-mde_equal-self-comparison-and-type-mismatch.patch
    0004-ie-fix-uint8_t-underflow-in-FTE-sub-element-parser.patch
)
sha256sums=('SKIP'
            'SKIP'
            'd5fb4fb864b7a0632117aa2039df535ab5c1d024ae618a1f09e34dfab8ee0cc7'
            'db5e63cf8e7d2071b0048f134e4aebed1f46e0b191cad5530ce99c07b1157b13'
            'cdd07a19f831c5f207817cdf8398a790bb5b233e32bb0e7d7998eb41a1a61763'
            'c160d0c3c7c0219ceff7cf107f8c24c33163c92cee3fc2573c26b1515bd05f22'
            '42dba8b8f2b0d39036df71f4b1887db5915e25ca3575e841d3f5352dfb0d514a')
options=('!lto')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    # replace Debian "netdev" group with existing "network" group
    # see issues 2 and 3 on arch's gitlab iwd package
    # sed -i 's/netdev/network/' src/iwd-dbus.conf wired/ead-dbus.conf
    patch -p1 < ../0001-use-network-group-for-unprivileged-access.diff

    # fixes for https://www.openwall.com/lists/oss-security/2026/08/02/2
    # see https://github.com/abhinavagarwal07/iwd-security-poc/blob/main/patches/README.md
    for patch in "${source[@]:3}"; do
        patch -p1 < ../$patch
    done

    # remove redefined _FORTIFY_SOURCE flag
    sed -i '/_FORTIFY_SOURCE/d' configure.ac

    # remove test that fails in chroot
    # sed -r -i "s:unit/test-wsc(\.c)?::" Makefile.am
    sed -r -i "s:unit/test-storage(\.c)?::" Makefile.am
    sed -r -i "s:unit/test-eap-sim(\.c)?::" Makefile.am

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
        --disable-tools
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
