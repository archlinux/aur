#
# Maintainer: isiachi <isiachi@rhyeworld.it>
#

pkgbase="zfs-dkms"
pkgname=("zfs-dkms" "zfs-utils")
pkgver=0.6.5.2
pkgrel=1
license=('CDDL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/zfs.git"
        "zfs-utils.bash-completion-r1"
        "zfs-utils.initcpio.install"
        "zfs-utils.initcpio.hook")
md5sums=('SKIP'
         '9ddb0c8a94861f929d0fa741fdc49950'
         '9ef4841abb85dee611828cc7e6f5c6fe'
         '62ba32c6853c315ff231c396cf8bfdbb')
#install=zfs.install

_dirver="${pkgver}"
_gittag="zfs-${pkgver}"

prepare() {
    cd "${srcdir}/zfs"
    
    git checkout ${_gittag}
}

build() {
    cd "${srcdir}/zfs"
    ./autogen.sh
    scripts/dkms.mkconf -v ${_dirver} -f dkms.conf -n zfs
    
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
		--bindir=/usr/bin \
                --sbindir=/usr/bin \
                --libdir=/usr/lib \
                --datadir=/usr/share \
                --includedir=/usr/include \
                --with-udevdir=/lib/udev \
                --libexecdir=/usr/lib/zfs \
                --with-config=user
    make
}

package_zfs-dkms() {
    pkgdesc="Kernel modules for the Zettabyte File System."
    depends=("spl-dkms=${pkgver}-${pkgrel}" "zfs-utils=${pkgver}-${pkgrel}" "dkms")
    provides=("zfs")
    conflicts=("zfs-git" "zfs-lts")
    replaces=("zfs-dkms-git")
    install=zfs.install
    
    install -d ${pkgdir}/usr/src
    cp -a ${srcdir}/zfs ${pkgdir}/usr/src/zfs-${_dirver}
    rm -rf ${pkgdir}/usr/src/zfs-${_dirver}/.git
    rm -f ${pkgdir}/usr/src/zfs-${_dirver}/.gitignore
}

package_zfs-utils() {
    pkgdesc="Kernel module support files for the Zettabyte File System."
    depends=("spl-dkms=${pkgver}-${pkgrel}")
    conflicts=("zfs-utils-git" "zfs-utils-lts")
    replaces=("zfs-utils-dkms-git")

    cd "${srcdir}/zfs"
    make DESTDIR="${pkgdir}" install

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/usr/lib/dracut

    # move module tree /lib -> /usr/lib
    cp -r "${pkgdir}"/{lib,usr}
    rm -r "${pkgdir}"/lib
    mv "${pkgdir}"/sbin/* "${pkgdir}"/usr/bin
    rm -r "${pkgdir}"/sbin

    install -D -m644 "${srcdir}"/zfs-utils.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs-utils.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
    install -D -m644 "${srcdir}"/zfs-utils.bash-completion-r1 "${pkgdir}"/usr/share/bash-completion/completions/zfs
}
