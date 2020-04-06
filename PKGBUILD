# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=zfs-dkms
pkgver=0.8.3
pkgrel=2
pkgdesc="Kernel modules for the Zettabyte File System."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL')
conflicts=('spl-dkms')
provides=("ZFS-MODULE=${pkgver}" "SPL-MODULE=${pkgver}" 'spl-dkms')
# ambiguous, provided for backwards compat, pls don't use
provides+=('zfs')
replaces=('spl-dkms')
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${pkgver}/zfs-${pkgver}.tar.gz"{,.asc}
        "https://github.com/openzfs/zfs/commit/2fcab8795c7c493845bfa277d44bc443802000b8.patch"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('545a4897ce30c2d2dd9010a0fdb600a0d3d45805e2387093c473efc03aa9d7fd'
            'SKIP'
            'daae58460243c45c2c7505b1d88dcb299ea7d92bcf3f41d2d30bc213000bb1da'
            '780e590383fb00389c5e02ac15709b7a476d9e07d3c4935ed9eb67c951a88409')
b2sums=('8b51b9d5b61543566bc7839d8452fdf9358442155e95f93a011531338824bbd4fc8879500e276b02d5d49d504a046728ecc0c6154f69eb7b47180b9bb0e46958'
        'SKIP'
        'd221881cd4c1edc0af010343b34c941ec8bf11bf34378eef09bb5152d442f0552a527f46105ace2af76dd4b2ff4ad93d6f39fd1be3f42ccda837d0208d7f4365'
        '1fdae935043d979b9241f07f8baa25a9a0367c24c31c84a59dfe8d6b468a523d8f49b68da3c7fd3194db6638f9d7bef046fc5e2669ce25d73c65009c16bf6c50')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    # fix compilation on kernel 5.5 https://github.com/openzfs/zfs/issues/9745
    patch -p1 -i ../2fcab8795c7c493845bfa277d44bc443802000b8.patch

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # remove unneeded sections from module build
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*)?(${pkgname%-dkms}.release|Makefile)/!d
}" configure.ac

    autoreconf -fi
}

build() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    ./scripts/dkms.mkconf -n ${pkgname%-dkms} -v ${pkgver} -f dkms.conf
}

package() {
    depends=("zfs-utils=${pkgver}" 'dkms')

    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    dkmsdir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure dkms.conf Makefile.in META ${pkgname%-dkms}_config.h.in ${pkgname%-dkms}.release.in include/ module/ "${dkmsdir}"/
    cp config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/enum-extract.pl scripts/dkms.postbuild "${dkmsdir}"/scripts/
}
