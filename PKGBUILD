# Maintainer: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=zfs-utils
pkgver=2.1.7
pkgrel=2
pkgdesc="Userspace utilities for the Zettabyte File System."
arch=("i686" "x86_64" "aarch64")
url="https://zfsonlinux.org/"
license=('CDDL')
optdepends=('python: for arcstat/arc_summary/dbufstat')
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${pkgver}/zfs-${pkgver}.tar.gz"{,.asc}
        "zfs.initcpio.install"
        "zfs.initcpio.hook")
sha256sums=('6462e63e185de6ff10c64ffa6ed773201a082f9dd13e603d7e8136fcb4aca71b'
            'SKIP'
            'd19476c6a599ebe3415680b908412c8f19315246637b3a61e811e2e0961aea78'
            '15b5acea44225b4364ec6472a08d3d48666d241fe84c142e1171cd3b78a5584f')
b2sums=('9c85c3eb72f3bb39bc4fd44aaa80338ca197a4e8183436fee73cd56705abfdaecfaf1b6fbe8dd508ccce707c8259c7ab6e1733b60b17757f0a7ff92d4e52bbad'
        'SKIP'
        'f7c78e5a0ce887e89e5cdc52515381d647a51586cb05c52a900e1307520f6f0fa828f8f5fd5a30823b233dcd79f0496375b21d044103e1d765e20f728c2d0fee'
        '779c864611249c3f21d1864508d60cfe5e0f5541d74fb3093c6bdfa56be2c76f386ac1690d363beaee491c5132f5f6dbc01553aa408cda579ebca74b0e0fd1d0')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>
backup=('etc/default/zfs'
        'etc/zfs/zed.d/zed.rc')

prepare() {
    cd "${srcdir}"/zfs-${pkgver}

    # pyzfs is not built, but build system tries to check for python anyway
    ln -sf /bin/true python3-fake

    autoreconf -fi
}

build() {
    cd "${srcdir}"/zfs-${pkgver}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --with-mounthelperdir=/usr/bin \
                --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-python="$PWD/python3-fake" \
                --enable-pyzfs=no \
                --enable-systemd \
                --with-config=user
    make
}

package() {
    cd "${srcdir}"/zfs-${pkgver}

    make DESTDIR="${pkgdir}" install
    install -D -m644 contrib/bash_completion.d/zfs "${pkgdir}"/usr/share/bash-completion/completions/zfs

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/etc/sudoers.d #???
    # We're experimenting with dracut in [extra], so start installing this.
    #rm -r "${pkgdir}"/usr/lib/dracut
    rm -r "${pkgdir}"/usr/lib/modules-load.d
    rm -r "${pkgdir}"/usr/share/initramfs-tools
    rm -r "${pkgdir}"/usr/share/zfs/*.sh
    rm -r "${pkgdir}"/usr/share/zfs/{runfiles,test-runner,zfs-tests}

    install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
}
