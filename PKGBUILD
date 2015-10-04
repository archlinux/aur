#
# Maintainer: bjin <bjin1990 at gmail dot com>
# Contributor: isiachi <isiachi@rhyeworld.it>
#

pkgbase="zfs-dkms-git"
pkgname=("zfs-dkms-git" "zfs-utils-dkms-git")
pkgver=0.6.5.2_0_g0b7b4bd
pkgrel=1
license=('CDDL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/zfs.git#tag=zfs-0.6.5.2"
        "zfs-utils.bash-completion-r1"
        "zfs-utils.initcpio.install"
        "zfs-utils.initcpio.hook")
md5sums=('SKIP'
         '9ddb0c8a94861f929d0fa741fdc49950'
         '9ef4841abb85dee611828cc7e6f5c6fe'
         '62ba32c6853c315ff231c396cf8bfdbb')

pkgver() {
    cd "${srcdir}/zfs"
    git describe --match "zfs-*" --long --tags | sed -e 's|zfs-||g' -e 's|[-: ]|_|g'
}

build() {
    cd "${srcdir}/zfs"
    ./autogen.sh
    scripts/dkms.mkconf -v ${pkgver%%_*} -f dkms.conf -n zfs

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --libdir=/usr/lib \
                --datadir=/usr/share \
                --includedir=/usr/include \
                --with-udevdir=/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-mounthelperdir=/usr/bin \
                --with-config=user
    make
}

package_zfs-dkms-git() {
    pkgdesc="Kernel modules for the Zettabyte File System."
    depends=("spl-dkms-git" "zfs-utils-dkms-git=${pkgver}-${pkgrel}" "dkms")
    provides=("zfs-dkms")
    conflicts=("zfs-git" "zfs-lts" "zfs-dkms")
    install=zfs.install

    install -d ${pkgdir}/usr/src
    cp -a ${srcdir}/zfs ${pkgdir}/usr/src/zfs-${pkgver%%_*}
    cd ${pkgdir}/usr/src/zfs-${pkgver%%_*}
    rm -rf .git .gitignore
    make clean
}

package_zfs-utils-dkms-git() {
    pkgdesc="Kernel module support files for the Zettabyte File System."
    depends=("spl-dkms-git")
    provides=("zfs-utils")
    conflicts=("zfs-utils-git" "zfs-utils-lts" "zfs-utils")

    cd "${srcdir}/zfs"
    make DESTDIR="${pkgdir}" install

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/usr/lib/dracut

    # move module tree /lib -> /usr/lib
    cp -r "${pkgdir}"/{lib,usr}
    rm -r "${pkgdir}"/lib

    install -D -m644 "${srcdir}"/zfs-utils.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs-utils.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
    install -D -m644 "${srcdir}"/zfs-utils.bash-completion-r1 "${pkgdir}"/usr/share/bash-completion/completions/zfs
}
