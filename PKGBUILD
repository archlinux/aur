# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>
#
# PRs are welcome: https://github.com/yurikoles-aur/zfs-utils-git
#

pkgname=zfs-utils-git
pkgver=2.1.99.r1548.gc23738c70e
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
sha256sums=('SKIP'
            'd19476c6a599ebe3415680b908412c8f19315246637b3a61e811e2e0961aea78'
            '569089e5c539097457a044ee8e7ab9b979dec48f69760f993a6648ee0f21c222'
            '93e6ac4e16f6b38b2fa397a63327bcf7001111e3a58eb5fb97c888098c932a51')

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
        --libdir=/usr/lib \
        --datadir=/usr/share \
        --includedir=/usr/include \
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
    rm -r "${pkgdir}"/usr/share/initramfs-tools
    rm -r "${pkgdir}"/usr/lib/modules-load.d
    # fix permissions
    chmod 750 ${pkgdir}/etc/sudoers.d
    chmod 440 ${pkgdir}/etc/sudoers.d/zfs

    # Install the support files
    install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.zfsencryptssh.install "${pkgdir}"/usr/lib/initcpio/install/zfsencryptssh
    install -D -m644 contrib/bash_completion.d/zfs "${pkgdir}"/usr/share/bash-completion/completions/zfs
}
