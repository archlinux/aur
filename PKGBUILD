# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# PRs are welcome: https://github.com/yurikoles-aur/zfs-utils-git

pkgname=zfs-utils-raidz-expansion-git
_pkgbase=zfs-utils-git
pkgver=2.1.99
pkgrel=2
epoch=1
pkgdesc="Userspace utilities for the Zettabyte File System."
arch=('x86_64')
url='https://zfsonlinux.org/'
license=('CDDL')
groups=('zfs-git')
makedepends=('python' 'python-setuptools' 'python-cffi' 'git')
optdepends=('python: pyzfs and extra utilities', 'python-cffi: pyzfs')
provides=("${pkgname%-git}=${pkgver}"  "${_pkgbase%-git}=${pkgver}"  "${_pkgbase}=${pkgver}")
conflicts=("${pkgname%-git}" "${_pkgbase%-git}" "${_pkgbase}")
source=('git+https://github.com/nicman23/zfs.git#branch=ahrens-raidz-expand'
        'zfs.initcpio.install'
        'zfs.initcpio.hook'
        'zfs.initcpio.zfsencryptssh.install'
        2a7dcc5eb1357962dce1836c98f3824a297fd921.diff)

prepare() {
    cd zfs
    patch -p1 -i ../2a7dcc5eb1357962dce1836c98f3824a297fd921.diff
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
md5sums=('SKIP'
         '5b4f7c4a828b9771c67acdb06df3ddbf'
         '4caf48dc87f42640ecfce4830599ea29'
         '13a7889e01be24d9e89dd86113bf5bcf'
         '0161955a0b61552485306a4288c44337')
