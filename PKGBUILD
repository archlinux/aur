# Maintainer: Josh Klecka <makamakamaka5 at gmail dot com>

pkgname="zfs-utils-openrc"
pkgver="2.1.5"
pkgdesc="OpenRC init scripts for the Zettabyte File System."
pkgrel=1
arch=('any')
url="https://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${pkgver}/zfs-${pkgver}.tar.gz"{,.asc})
sha256sums=("1913041e5c44ff07ca384346ad8145aeedf77e77cd1cea9ec5d533246691e10c"
"SKIP")
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>
license=("CDDL")
provides=('init-zfs-utils')
conflicts=('init-zfs-utils')

prepare() {
    cd "${srcdir}"/zfs-${pkgver}

    # Trick the build system into thinking python3 is installed and works
    ln -sf /bin/true fakepython3

    # Use openrc-run as the interpreter
    cd etc/init.d
    sed -i 's/\@DEFAULT_INIT_SHELL\@/\/sbin\/openrc-run/g' zfs-*.in
}

build() {
    cd "${srcdir}"/zfs-${pkgver}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --with-mounthelperdir=/usr/bin \
                --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-python="$PWD/fakepython3" \
                --enable-pyzfs=no \
                --enable-systemd=no \
                --enable-sysvinit=yes \
                --with-config=user

    # We only care about the init scripts, so run
    # make on the makefile in the init.d folder
    cd etc/init.d
    make
}

package() {
    depends=("zfs-utils=${pkgver}" "openrc")
    
    # Run make install only for the init scripts
    cd "${srcdir}"/zfs-${pkgver}/etc/init.d

    make DESTDIR="${pkgdir}" install
}
