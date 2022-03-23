# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=zfs-dkms
pkgver=2.1.4
pkgrel=1
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
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6'
            'SKIP'
            'd964e11018992a2acd98e263244efdbfe4367d26ad15f4728848261d3c6e227a')
b2sums=('be303f1181f604770536aa4aa61d5319ec408abbd04964cedadd15b3101a15deba6539bb5d833f4fed357f323d74f622d035305df699b213df41ae45bffdd200'
        'SKIP'
        '0e91cd2421b81c8ee517503059fb9ebc20e7c150801851cff2ffdfb64cbcd9a4e0657e7678c412a334fc37b589006ec78dca2ccc091b034a83a00966acba6f5b')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

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
