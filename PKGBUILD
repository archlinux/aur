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
        "https://github.com/zfsonlinux/zfs/pull/9161/commits/d4b15200e75a37da053589aa2ddff06872302ac2.patch"
        "https://github.com/zfsonlinux/zfs/pull/9161/commits/ee1848356f32e31f001ca96cc68e06a445f72108.patch"
        "0001-Linux-5.3-compat-Makefile-subdir-m-no-longer-support.patch"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('0af79fde44b7b8ecb94d5166ce2e4fff7409c20ed874c2d759db92909e6c2799'
            'SKIP'
            'c65c950abda42fb91fb99c6c916a50720a522c53e01a872f9310a4719bae9e2a'
            '19f798a29c00874874751880f1146c5849b8ebdb6233d8ae923f9fdd4661de19'
            '37b84048ebb0c64c6e8a2186dbb0789978890bf816d6f454cb99b51d5ecf9590'
            '780e590383fb00389c5e02ac15709b7a476d9e07d3c4935ed9eb67c951a88409')
b2sums=('f18268656381c20af6bd18421636a1c56633c7eafaf91b1308d15508d5f4bdcfa5dfbb4e09d0302ac3de9d6a4f69718fe9c3d083ed5b3ab2a32c6fb7a1db624b'
        'SKIP'
        'a8acfad7924ce07ac6bf4569a5262a351ee8de757fb1efd0f54db50590f22922f99e4547973aa9d1ed589e2866a09135627edc64a5593472315ef819a27e544b'
        '850bd5226fba2a14acb4c1e808ebfd0bac3ba7dda576a20b4d20dbd29ee05a098ec3fda2d2b905f0751595fb6fdf0dc4137986a596441ee9ad6bc4c41ee98c36'
        '17011f106c74196fa2d430b329223f955a4bcb14a37f1ac44636f71095d3123ecf97d9f0340b3bb6850b3baafc5a1744b8ec2fd46348045c58e2d55a3dab68ce'
        '1fdae935043d979b9241f07f8baa25a9a0367c24c31c84a59dfe8d6b468a523d8f49b68da3c7fd3194db6638f9d7bef046fc5e2669ce25d73c65009c16bf6c50')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # backport fixes for building on linux 5.3
    # https://github.com/zfsonlinux/zfs/issues/9332
    patch -p1 -i ../d4b15200e75a37da053589aa2ddff06872302ac2.patch
    patch -p1 -i ../ee1848356f32e31f001ca96cc68e06a445f72108.patch
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
