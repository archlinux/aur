# Maintainer: nexttrex <jan@nexttrex.de>
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>

pkgbase="zfs-encryption-dkms-git"
pkgname=("zfs-encryption-dkms-git" "zfs-utils-encryption-dkms-git")
_ver=0.7.0
pkgver=0.7.0_r2965.076800258
pkgrel=3
license=('CDDL')
makedepends=("git" "spl-dkms-git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/tcaputi/zfs.git"
        "zfs.bash-completion-r1"
        "zfs.initcpio.install"
        "zfs.initcpio.hook")
sha256sums=('SKIP'
            'b60214f70ffffb62ffe489cbfabd2e069d14ed2a391fac0e36f914238394b540'
            'aa5706bf08b36209a318762680f3c9fb45b3fc4b8e4ef184c8a5370b2c3000ca'
            '4b66b694f72d9028b2bd0bafe789be327e2d894f9dcddd7b5a71f955f4205601')

pkgver() {
    cd "${srcdir}/zfs"
    printf "${_ver}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/zfs"
    ./autogen.sh

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --with-mounthelperdir=/usr/bin \
                --libdir=/usr/lib \
                --datadir=/usr/share \
                --includedir=/usr/include \
                --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-config=user
    make
}

package_zfs-encryption-dkms-git() {
    pkgdesc="Kernel modules for the Zettabyte File System build with support for native encryption. (Git version)"
    depends=("spl-dkms-git" "zfs-utils-encryption-dkms-git=${pkgver}-${pkgrel}" "dkms")
    optdepends=('plymouth-zfs: plymouth support for encrypted root')
    provides=("zfs")
    conflicts=("zfs-git" "zfs-lts" "zfs-dkms" "zfs-dkms-git")

    dkmsdir="${pkgdir}/usr/src/zfs-${pkgver%%_*}"
    install -d "${dkmsdir}"
    cp -a ${srcdir}/zfs/. ${dkmsdir}

    cd "${dkmsdir}"
    make clean
    make distclean
    find . -name ".git*" -print0 | xargs -0 rm -fr --
    scripts/dkms.mkconf -v ${pkgver%%_*} -f dkms.conf -n zfs
    chmod g-w,o-w -R .
}

package_zfs-utils-encryption-dkms-git() {
    pkgdesc="Kernel module support files for the Zettabyte File System build with support for native encryption. (Git version)"
    provides=("zfs-utils")
    conflicts=("zfs-utils-git" "zfs-utils-lts" "zfs-utils" "zfs-utils-dkms-git")

    cd "${srcdir}/zfs"
    make DESTDIR="${pkgdir}" install

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/usr/lib/dracut
    rm -r "${pkgdir}"/usr/share/initramfs-tools

    install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
    install -D -m644 "${srcdir}"/zfs.bash-completion-r1 "${pkgdir}"/usr/share/bash-completion/completions/zfs

    mkdir -p "${pkgdir}"/usr/lib/initcpio/install
}
