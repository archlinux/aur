# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Jan Houben <jan@nexttrex.de>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>
#
# ! WARNING !
#
# This packages is meant to build a kernel module, so these modules will only
# work with the kernel package they target. In this case, the zfs-linux-lts
# packages will only work with the default linux-lts package!
#

pkgbase="zfs-linux-lts"
pkgname=("zfs-linux-lts" "zfs-linux-lts-headers")
_zfsver="2.4.1"
_kernelver="6.12.74-1"
_kernelver_full="6.12.74-1"
_extramodules="6.12.74-1-lts"

pkgver="${_zfsver}_$(echo ${_kernelver} | sed s/-/./g)"
pkgrel=1
makedepends=("linux-lts-headers=${_kernelver}")
arch=("x86_64")
url="https://openzfs.org/"
source=("https://github.com/openzfs/zfs/releases/download/zfs-${_zfsver}/zfs-${_zfsver}.tar.gz")
sha256sums=('c17b69770f0023154f578eb8c7536a70f07d6a3bb0bd38f04fa0e8811c3c1390')
license=("CDDL-1.0")
depends=("kmod" "zfs-utils=${_zfsver}" "linux-lts=${_kernelver}")

build() {
    cd "${srcdir}/zfs-${_zfsver}"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
                --datadir=/usr/share --includedir=/usr/include --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib --with-config=kernel \
                --with-linux=/usr/lib/modules/${_extramodules}/build \
                --with-linux-obj=/usr/lib/modules/${_extramodules}/build
    make
}

package_zfs-linux-lts() {
    pkgdesc="Kernel modules for the Zettabyte File System."
    install=zfs.install
    provides=("zfs" "spl")
    groups=("archzfs-linux-lts")
    conflicts=("zfs-dkms" "zfs-dkms-git" "zfs-dkms-rc" "spl-dkms" "spl-dkms-git" 'zfs-linux-lts-git' 'zfs-linux-lts-rc' 'spl-linux-lts')
    replaces=("spl-linux-lts")
    cd "${srcdir}/zfs-${_zfsver}"
    make DESTDIR="${pkgdir}" INSTALL_MOD_PATH=${pkgdir}/usr INSTALL_MOD_STRIP=1 install
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_zfs-linux-lts-headers() {
    pkgdesc="Kernel headers for the Zettabyte File System."
    provides=("zfs-headers" "spl-headers")
    conflicts=("zfs-headers" "zfs-dkms" "zfs-dkms-git" "zfs-dkms-rc" "spl-dkms" "spl-dkms-git" "spl-headers")
    cd "${srcdir}/zfs-${_zfsver}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/zfs-*/${_extramodules}/Module.symvers
}
