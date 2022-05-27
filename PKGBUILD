# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# PRs are welcome: https://github.com/yurikoles-aur/zfs-utils-git

pkgname=zfs-utils-git
pkgver=2.1.99.r1271.g1c0c729ab4
pkgrel=1
epoch=2
pkgdesc="Userspace utilities for the Zettabyte File System."
arch=('x86_64')
url='https://zfsonlinux.org/'
license=('CDDL')
groups=('zfs-git')
makedepends=('python' 'python-setuptools' 'python-cffi' 'git')
optdepends=('python: pyzfs and extra utilities', 'python-cffi: pyzfs')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/zfsonlinux/zfs.git'
        'zfs.initcpio.install'
        'zfs.initcpio.hook'
        'zfs.initcpio.zfsencryptssh.install')
sha256sums=('SKIP'
            '600f49d610906476f492d53ee1830154e4ebedf999284485e07d9cb2b3084766'
            '8b8c9b6ebfddfb51f2ab70fb943f53f08f6140140561efcb106120941edbc36e'
            '93e6ac4e16f6b38b2fa397a63327bcf7001111e3a58eb5fb97c888098c932a51')
b2sums=('SKIP'
        '5147f165bc53cb792aaf11724cef253601fe853cd7bc43aeff0ef5cd3a23dbde57e38710c941803d6b5f5838bde99271804608221f1c6b33f30b734edbd85913'
        '32352e2e188073da4f61278899b6d343313ee3494d69dd10a38ab87bce2f2003767f0f49bc1c3c4d785dd1fc67eab4a27a6fdd5ffc5e63cf94d25f3dbffae4c1'
        '04e2af875e194df393d6cff983efc3fdf02a03a745d1b0b1e4a745f873d910b4dd0a45db956c1b5b2d97e9d5bf724ef12e23f7a2be3d5c12be027eaccf42349a')

pkgver() {
    cd zfs

    git describe --long | sed 's/^zfs-//;s/-rc/rc/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd zfs

    autoreconf -fi
}

build() {
    cd zfs

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --with-mounthelperdir=/usr/bin \
        --with-udevdir=/usr/lib/udev \
        --libexecdir=/usr/lib/zfs \
        --enable-pyzfs \
        --enable-systemd \
        --with-config=user \
        --with-zfsexecdir=/usr/lib/zfs
    make
}

package() {
    cd zfs
    make DESTDIR="${pkgdir}" install

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/etc/sudoers.d #???
    # We're experimenting with dracut in [extra], so start installing this.
    #rm -r "${pkgdir}"/usr/lib/dracut
    rm -r "${pkgdir}"/usr/lib/modules-load.d
    rm -r "${pkgdir}"/usr/share/initramfs-tools

    # Install the support files
    install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.zfsencryptssh.install "${pkgdir}"/usr/lib/initcpio/install/zfsencryptssh
    install -D -m644 contrib/bash_completion.d/zfs "${pkgdir}"/usr/share/bash-completion/completions/zfs
}
