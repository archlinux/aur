# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=zfs-dkms
pkgver=0.8.1
pkgrel=2
pkgdesc="Kernel modules for the Zettabyte File System."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL')
makedepends=('git')
conflicts=('spl-dkms')
provides=("${pkgname%-dkms}" 'spl-dkms')
replaces=('spl-dkms')
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${pkgver}/zfs-${pkgver}.tar.gz"{,.asc}
        "https://github.com/zfsonlinux/zfs/commit/041205afee7e151a0ac10c9b5314186cf65417dc.patch"
        "https://github.com/zfsonlinux/zfs/commit/e7a99dab2b065ac2f8736a65d1b226d21754d771.patch"
        "0001-Linux-5.3-compat-Makefile-subdir-m-no-longer-support.patch"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('0af79fde44b7b8ecb94d5166ce2e4fff7409c20ed874c2d759db92909e6c2799'
            'SKIP'
            '38bc398be920b62f63275268068e326dbee50bc26363c8e136fa0e1aee3a69b5'
            'dba82a102bbbc7ab32af4f90a863d7566f8844f8571975bf30817f9a9cacd3e3'
            '37b84048ebb0c64c6e8a2186dbb0789978890bf816d6f454cb99b51d5ecf9590'
            '780e590383fb00389c5e02ac15709b7a476d9e07d3c4935ed9eb67c951a88409')
b2sums=('f18268656381c20af6bd18421636a1c56633c7eafaf91b1308d15508d5f4bdcfa5dfbb4e09d0302ac3de9d6a4f69718fe9c3d083ed5b3ab2a32c6fb7a1db624b'
        'SKIP'
        '352fdf46212afcc6fb376251442398011cc1a511efb36d0af730078559cee4d120a955f81f4878aa977bed85ef5d7599272b0433640f8a3d9bea8c6d57191479'
        '2af677303b5af602cc65c1b732b63493e15e8d314f08c419a81d8fe3aedaeb7cf3bfb918196d4b9cfc6f86c2bcd2f11c242ee36cb0d9f4a57466e81cd3848bf9'
        '17011f106c74196fa2d430b329223f955a4bcb14a37f1ac44636f71095d3123ecf97d9f0340b3bb6850b3baafc5a1744b8ec2fd46348045c58e2d55a3dab68ce'
        '1fdae935043d979b9241f07f8baa25a9a0367c24c31c84a59dfe8d6b468a523d8f49b68da3c7fd3194db6638f9d7bef046fc5e2669ce25d73c65009c16bf6c50')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # backport fixes for building on linux 5.3
    # https://github.com/zfsonlinux/zfs/issues/9332
    patch -p1 -i ../041205afee7e151a0ac10c9b5314186cf65417dc.patch
    patch -p1 -i ../e7a99dab2b065ac2f8736a65d1b226d21754d771.patch
    patch -p1 -i ../0001-Linux-5.3-compat-Makefile-subdir-m-no-longer-support.patch

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
