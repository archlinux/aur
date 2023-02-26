# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# PRs are welcome: https://github.com/yurikoles-aur/zfs-dkms-git

pkgname=zfs-dkms-raidz-expansion-git
_pkgbase=zfs-dkms-git
pkgver=2.1.99
pkgrel=2
epoch=1
pkgdesc='Kernel modules for the Zettabyte File System.'
arch=('x86_64')
url='https://zfsonlinux.org/'
license=('CDDL')
groups=('zfs-git')
depends=(zfs-utils-git 'dkms')
makedepends=('git')
provides=("ZFS-MODULE=${pkgver}" "SPL-MODULE=${pkgver}" "${pkgname%-git}=${pkgver}" "${_pkgbase%-git}=${pkgver}" 'spl-dkms')
conflicts=("${pkgname%-git}" "${_pkgbase%-git}" 'spl-dkms')
replaces=('spl-dkms-git')
source=('git+https://github.com/nicman23/zfs.git#branch=ahrens-raidz-expand'
        "0001-only-build-the-module-in-dkms.conf.patch"
        ecb6a50819448cd2d6570298a5ba46b45eded216.diff)
sha256sums=('SKIP'
            '539f325e56443554f9b87baff33948b91a280ec1daadcb0c636b105252fcd0f5'
            a60a6e008270b2624b12cf7556832867c29d33ae2bddc06d8205046948a4e0f0)

prepare() {
    cd zfs

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch
    patch -p1 -i ../ecb6a50819448cd2d6570298a5ba46b45eded216.diff

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
    dkmsdir="${pkgdir}/usr/src/zfs-${pkgver}"
    install -d "${dkmsdir}"
    cp -a zfs/. "${dkmsdir}"
    rm -rf "${dkmsdir}"/.git*
}
