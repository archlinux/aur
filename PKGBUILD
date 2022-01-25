# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=zfs-dkms
pkgver=2.1.2
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
        "0001-only-build-the-module-in-dkms.conf.patch"
        "0002-check-slabh-for-kvmalloc.patch::https://github.com/openzfs/zfs/commit/e86f88aa0b4f4e2784980d6d5c04f397e4839493.patch"
        "0003-added-add_disk-check-for-return.patch::https://github.com/openzfs/zfs/commit/12fa250d84c0a96b95fd0ff70509c43dd8b640a0.patch"
        "0004-added-mapping-for-iov_iter_fault_in_readable.patch::https://github.com/openzfs/zfs/commit/299fbf75ecf302e790908d8098a8cd215125a6b5.patch"
        "0005-add-support-for-falloc_fl_zero_range.patch::https://github.com/openzfs/zfs/commit/4372e96f4b4b21c8e79c0c961589f61b11859e07.patch")
sha256sums=('258cf1d17a1f668a3b99b61eaf14be06c614df42503db0319bef1b9fc4c8b9e7'
            'SKIP'
            '780e590383fb00389c5e02ac15709b7a476d9e07d3c4935ed9eb67c951a88409'
            'd3f406a988d8cb365b1476df9e56e667ae4126c6fd094dd31bd83eea38ff53d8'
            '6d5ed172126687fb741e1981aa325b9f147fa9b8c2a4bcdb8ca5a1beb2edc14a'
            'd4aabba2a4accb5fac545a173573d3c857cf148d7484982ccf6f2a71f4de0bc0'
            'abd3a03d109330e408ad08695b7a71453a6c4aa549752248d92e8d03a228c392')
b2sums=('ab4e2d85200438373c7eeeaa5256a712dbfb2862b85de1fb7554ad0cc2b9f8e1255ab4564bca62f65a81a823adb8c112957e6e8771b8e5e6944c3731bc894584'
        'SKIP'
        '1fdae935043d979b9241f07f8baa25a9a0367c24c31c84a59dfe8d6b468a523d8f49b68da3c7fd3194db6638f9d7bef046fc5e2669ce25d73c65009c16bf6c50'
        '164c2f8aaaa06cfe6eb1cad8102b8886543224bb171505990e0b6d2c8a5ca28e7880b05e492b2da42d8bce719e2c9a9dd17ea31b38bf3ad53b46f75d6b12072d'
        '6011e4f2e794f955fe509cbf9008e9116e9f3ea1066339aca2aabb2939f1660cc48940b7a847316d39b2d0b3a4c5e1cbfc4a964875559ae937f9d56b959c69ad'
        'c6a8ddbaab468788fff978999e6d15a6710fcbb2bdeba6ed97089cf59d4d53ef86e0dac2dd43352cd116f602ab87adcbfdd02cbd640927a8391340fa2255301f'
        'ec748954dc52c6f318bc4b73aad4b62e1c3aef7b2c587c79dd693596d10299dd80c57d284b9ff11916984092138e329f26d266d9155a49513e21a44b357c52fa')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # "A couple of Linux 5.16 fixes", https://github.com/openzfs/zfs/pull/12975
    patch -p1 -i ../0002-check-slabh-for-kvmalloc.patch
    patch -p1 -i ../0003-added-add_disk-check-for-return.patch
    patch -p1 -i ../0004-added-mapping-for-iov_iter_fault_in_readable.patch
    patch -p1 -i ../0005-add-support-for-falloc_fl_zero_range.patch

    # remove unneeded sections from module build
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*|${pkgname%-dkms}.release|Makefile)/!d
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
    cp config/compile config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/enum-extract.pl scripts/dkms.postbuild "${dkmsdir}"/scripts/
}
