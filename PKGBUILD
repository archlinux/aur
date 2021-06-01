# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=zfs-dkms
pkgver=2.0.4
pkgrel=3
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
        "https://github.com/openzfs/zfs/commit/f315d9a3ff3cc0b81c99dd9be5878a55d2e98d8e.patch"
        "https://github.com/openzfs/zfs/commit/77352db228c07ce8ba50478b9029820ca69c6c1b.patch"
        "https://github.com/openzfs/zfs/commit/6eced028dbbc2a44e32c4c0a76234ac2da9a365a.patch"
        "https://github.com/openzfs/zfs/commit/b3f8b103cb3a4bbb7ad41f6faf630be7baa4f585.patch"
        "https://github.com/openzfs/zfs/commit/ee2a9d2c771657168652e058477b81389c662b5e.patch"
        "https://github.com/openzfs/zfs/commit/3e0bc63e1b0ca03493b936e92e871ca7ae451a0a.patch"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('7d1344c5433b91823f02c2e40b33d181fa6faf286bea5591f4b1965f23d45f6c'
            'SKIP'
            'f91835f187f5210fd855ee929b8f893771874a456db2bee685f71c833c696db8'
            'd44e6e7b6a6aa5dc4422127f23524f315463fb9c042a519817b4f9cba5c483d1'
            'd07813f7e8427956cd9ae814540bca7a8d4638f1dbdea2fefc9c73bf2f553ba8'
            '5940e29e428e74df8ca4ed924259e86cef57226680f27675944d3fdcce9d8604'
            '9091d65ec611119778daa167177f6a634a8f4cd9fa4b0e819de32a60ea0137fc'
            '0b705a23f748b98a5d789d32aedd342ed61378f0b1c65539d8c6df510c587050'
            '780e590383fb00389c5e02ac15709b7a476d9e07d3c4935ed9eb67c951a88409')
b2sums=('7e4780092c0a87d5d187cd5734ddc736574db80b500f155287640ef2230e09335cc9b6b26ec1b7d8ab1b7942673ea49a3007a81da372a6d2ac36f3908913045c'
        'SKIP'
        '49724351c5a8e6ffa66762d5aac84ad89a3d04022d086d9f37ccd616b3e8e95852197b5333bdeeeab54fc51516d8254d0138a4422cc66214bb602e5ed72bbabf'
        'cfe0d17448f25ec649ca7cf0bb7ee4f2685d09b2fa693b411f31a4035e113627c8be73514b39f2460646b9a556a133afcbfc803675d93d1fd5d93d64d8b4e7b2'
        'b1012123a6d9ddd03b7db83075447eba99c8fb4e3bf4f4e8a54d9defe2c4e6b752bda70d8512a8da68f509fc832acbaf2eb73c6673123553ac38c99095d7f872'
        '556d3850a2c7f74370702ad354f64424170682f6499b6a5e1a58c45e20ddb082109a541b8613b815820569aeab5c322e180d8f0d0a6cea4799e11dd9afbe464e'
        '4454568cfcafa9b6b7ba6de94df728da349f1dff9803c21fc4d9613af17b65dc59ba2c7cf9584d1456cf454e4ba1bf9a9467e0b181d097861d649ffd32461bf4'
        'c32c94c233cc15f1db4166d293b7e0030f51c9ba6ba185293a2c068419a64c46288244e6096f69f55e5bd19006729b080cb95966519eb8db142a494d9f147878'
        '1fdae935043d979b9241f07f8baa25a9a0367c24c31c84a59dfe8d6b468a523d8f49b68da3c7fd3194db6638f9d7bef046fc5e2669ce25d73c65009c16bf6c50')
validpgpkeys=('4F3BA9AB6D1F8D683DC2DFB56AD860EED4598027'  # Tony Hutter (GPG key for signing ZFS releases) <hutter2@llnl.gov>
              'C33DF142657ED1F7C328A2960AB9E991C6AF658B') # Brian Behlendorf <behlendorf1@llnl.gov>

prepare() {
    cd "${srcdir}"/${pkgname%-dkms}-${pkgver}

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # Kernel 5.12 compat, https://github.com/openzfs/zfs/pull/12009
    patch -p1 -i ../f315d9a3ff3cc0b81c99dd9be5878a55d2e98d8e.patch
    patch -p1 -i ../77352db228c07ce8ba50478b9029820ca69c6c1b.patch

    # Kernel 5.12 backport "fixes for tmpiles and userns changes", https://github.com/openzfs/zfs/pull/12139
    patch -p1 -i ../6eced028dbbc2a44e32c4c0a76234ac2da9a365a.patch
    patch -p1 -i ../b3f8b103cb3a4bbb7ad41f6faf630be7baa4f585.patch

    # Kernel 5.12 backport "Fix dmu_recv_stream test for resumable", https://github.com/openzfs/zfs/pull/12141
    patch -p1 -i ../ee2a9d2c771657168652e058477b81389c662b5e.patch

    # Bugfix backport, "Remove iov_iter_advance() for iter_write", https://github.com/openzfs/zfs/pull/12178
    patch -p1 -i ../3e0bc63e1b0ca03493b936e92e871ca7ae451a0a.patch

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
