# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=zfs-dkms
pkgver=0.7.12
pkgrel=2
pkgdesc="Kernel modules for the Zettabyte File System."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL')
makedepends=('git')
provides=("${pkgname%-dkms}")
source=("git+https://github.com/zfsonlinux/zfs.git#tag=zfs-${pkgver}?signed"
        "https://github.com/zfsonlinux/zfs/pull/8227/commits/4f981f6ab614a908f912f7dc147b248f96b498a2.patch"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '4ec0d1cd40295dc73c6f595c5e17283caa417ecd6a81fef526e31670034824a6'
            '780e590383fb00389c5e02ac15709b7a476d9e07d3c4935ed9eb67c951a88409')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}

    # fix for linux 4.20 https://github.com/zfsonlinux/zfs/pull/8227
    patch -p1 -i ../4f981f6ab614a908f912f7dc147b248f96b498a2.patch

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # remove unneeded sections from module build
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*)?(${pkgname%-dkms}.release|Makefile)/!d
}" configure.ac

    autoreconf -fi
}

package() {
    depends=("spl-dkms=${pkgver}" "zfs-utils=${pkgver}" 'dkms')

    cd "${srcdir}"/${pkgname%-dkms}

    dkmsdir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure Makefile.in META ${pkgname%-dkms}_config.h.in ${pkgname%-dkms}.release.in include/ module/ "${dkmsdir}"/
    cp config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/enum-extract.pl scripts/dkms.postbuild "${dkmsdir}"/scripts/

    ./scripts/dkms.mkconf -n ${pkgname%-dkms} -v ${pkgver} -f "${dkmsdir}"/dkms.conf
}
