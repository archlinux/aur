# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# PRs are welcome: https://github.com/yurikoles-aur/zfs-utils-git

pkgname=zfs-utils-git
pkgver=2.1.99.r1446.g72c99dc959
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
source=('git+https://github.com/openzfs/zfs.git'
        'zfs.initcpio.install'
        'zfs.initcpio.hook'
        'zfs.initcpio.zfsencryptssh.install')
b2sums=('SKIP'
        'f7c78e5a0ce887e89e5cdc52515381d647a51586cb05c52a900e1307520f6f0fa828f8f5fd5a30823b233dcd79f0496375b21d044103e1d765e20f728c2d0fee'
        '4b041722b4f355c9fca300fc021e3e4a0ffbb649f61d1ad9efd2b5c6b83fa2ecf5e60243f6a40bd3962a9140403043b3951e38b4a2e86ec5b5f07501a058ba75'
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
