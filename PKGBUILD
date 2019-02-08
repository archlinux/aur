#
# Maintainer: Grey Christoforo <first name at last name dot net>
#

pkgbase="zfs-dkms-rc"
pkgname=("zfs-dkms-rc" "zfs-utils-rc")
_pkgver=0.8.0-rc3
_pkgver_base=${_pkgver%-*}
pkgver=${_pkgver//-rc/.}
pkgrel=1
license=('CDDL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${_pkgver}/zfs-${_pkgver}.tar.gz"
        "zfs.bash-completion-r1"
        "zfs.initcpio.install"
        "zfs.initcpio.hook")
sha256sums=('5c344d6ff876d4c5286d83745700127054858cea379d31741fe96589ac40baff'
            'b60214f70ffffb62ffe489cbfabd2e069d14ed2a391fac0e36f914238394b540'
            '17114052aa20c528f022f7f1349971aa28810e2ed2c97871226b5679a91f7e77'
            '138964b43d7a282e1ed5f7fcf1f8dc9baa4f664655b628eeac1912a3017a787b')

build() {
    cd "${srcdir}/zfs-${_pkgver_base}"
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

package_zfs-dkms-rc() {
    pkgdesc="Kernel modules for the Zettabyte File System -- release candidates"
    depends=("zfs-utils-rc=${pkgver}-${pkgrel}" "dkms")
    provides=("zfs")
    conflicts=("zfs-git" "zfs-lts" "zfs-dkms")

    dkmsdir="${pkgdir}/usr/src/zfs-${pkgver}"
    install -d "${dkmsdir}"
    cp -a "${srcdir}/zfs-${_pkgver_base}/." ${dkmsdir}

    cd "${dkmsdir}"
    make clean
    make distclean
    find . -name ".git*" -print0 | xargs -0 rm -fr --
    scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n zfs
    chmod g-w,o-w -R .
}

package_zfs-utils-rc() {
    pkgdesc="Kernel module support files for the Zettabyte File System -- release candidates"
    conflicts=("zfs-utils-git" "zfs-utils-lts" "zfs-dkms")

    cd "${srcdir}/zfs-${_pkgver_base}"
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
