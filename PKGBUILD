# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>
#
# PRs are welcome: https://github.com/yurikoles-aur/zfs-dkms-git
#

pkgname=zfs-dkms-git
pkgver=2.1.99.r1548.gc23738c70e
pkgrel=1
epoch=2
pkgdesc='Kernel modules for the Zettabyte File System.'
arch=('x86_64')
url='https://zfsonlinux.org/'
license=('CDDL')
groups=('zfs-git')
makedepends=('git')
provides=("ZFS-MODULE=${pkgver}" "SPL-MODULE=${pkgver}" "${pkgname%-git}=${pkgver}" 'spl-dkms')
conflicts=("${pkgname%-git}" 'spl-dkms')
replaces=('spl-dkms-git')
source=("git+https://github.com/openzfs/zfs.git"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '539f325e56443554f9b87baff33948b91a280ec1daadcb0c636b105252fcd0f5')

pkgver() {
    cd zfs

    git describe --long | sed 's/^zfs-//;s/-rc/rc/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd zfs

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # remove unneeded sections from module build
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*|zfs.release|Makefile)/!d
}" configure.ac

    autoreconf -fi
}

build() {
    cd zfs

    ./scripts/dkms.mkconf -n zfs -v ${pkgver} -f dkms.conf
    # update metadata
    ./scripts/make_gitrev.sh
    _meta_release=${pkgver#*.r}
    sed -i -e "s/Release:[[:print:]]*/Release:      ${_meta_release/./_}/" META
}

package() {
    depends=("zfs-utils-git=${epoch}:${pkgver}" 'dkms' 'libcrypto.so=1.1')
    dkmsdir="${pkgdir}/usr/src/zfs-${pkgver}"
    install -d "${dkmsdir}"
    cp -a zfs/. "${dkmsdir}"
    rm -rf "${dkmsdir}"/.git*
}
