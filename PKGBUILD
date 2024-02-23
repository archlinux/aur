# Maintainer: Angelo Haller <aur.archlinux@szanni.org>
# Contributor: Jan Houben <jan@nexttrex.de>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>
#
# WARNING: This package does not build in its current form due to licensing
# incompatibilities. Some of the linux-rt patches change some of the exported
# kernel symbols to GPL-only which conflicts with the zfs CDDL license.
#
pkgbase="zfs-linux-rt"
pkgname=("zfs-linux-rt" "zfs-linux-rt-headers")
_zfsver="2.2.2"
_kernelver="6.6.5.16.realtime1-3"
_extramodules="${_kernelver}-rt"

pkgver="${_zfsver}_$(echo ${_kernelver} | sed s/-/./g)"
pkgrel=1
makedepends=("linux-rt-headers=${_kernelver}")
arch=("x86_64")
url="https://zfsonlinux.org/"
# zfs-linux-lts 6.6.16-1 uses kernel patch 6.7, so we do so too
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${_zfsver}/zfs-${_zfsver}.tar.gz" "linux-6.7-compat.patch")
sha256sums=('76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f39ed12fc9' '43bca1a6717bfc77d42a4c51656c38674c6be8d7ec46f04c7febcdafd9295916')
license=("CDDL")
depends=("kmod" "zfs-utils=${_zfsver}" "linux-rt=${_kernelver}")

prepare() {
    cd "${srcdir}/zfs-${_zfsver}"
    patch -Np1 -i ${srcdir}/linux-6.7-compat.patch
}

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

package_zfs-linux-rt() {
    pkgdesc="Kernel modules for the Zettabyte File System."
    install=zfs.install
    provides=("zfs" "spl")
    groups=("archzfs-linux-rt")
    conflicts=("zfs-dkms" "zfs-dkms-git" "zfs-dkms-rc" "spl-dkms" "spl-dkms-git")
    cd "${srcdir}/zfs-${_zfsver}"
    make DESTDIR="${pkgdir}" INSTALL_MOD_PATH=${pkgdir}/usr INSTALL_MOD_STRIP=1 install
    # Remove src dir
    rm -r "${pkgdir}"/usr/src
}

package_zfs-linux-rt-headers() {
    pkgdesc="Kernel headers for the Zettabyte File System."
    provides=("zfs-headers" "spl-headers")
    conflicts=("zfs-headers" "zfs-dkms" "zfs-dkms-git" "zfs-dkms-rc" "spl-dkms" "spl-dkms-git" "spl-headers")
    cd "${srcdir}/zfs-${_zfsver}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/lib"
    # Remove reference to ${srcdir}
    sed -i "s+${srcdir}++" ${pkgdir}/usr/src/zfs-*/${_extramodules}/Module.symvers
}
