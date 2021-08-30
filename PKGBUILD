pkgname=ntfs3-dkms-git
_pkgver=27.0.0
pkgver=27.0.0
pkgrel=2
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://github.com/Paragon-Software-Group/linux-ntfs3'
license=('GPL2')
depends=('dkms')
provides=('NTFS3-MODULE' "ntfs3=${_pkgver}" "ntfs3-dkms=${_pkgver}")
conflicts=('ntfs3')
options=('!strip')

source=(
    Makefile.patch
    dkms.conf
    kernel-5.12-backport.patch
    kernel-5.14-backport.patch
    "ntfs3-v${_pkgver}.patch::https://github.com/torvalds/linux/compare/master...Paragon-Software-Group:master.diff"
)

sha512sums=(
    '533c249f0f6bd4833faf02d0d92ca1b5802a49afc5feb2e46a7d37275cfca7896db76cd83593f4f313977d278a9a7e92eda550667be2b93910c49cfb68ead4fb'
    'ac00adb4a6d7fc685c39af054474631c930455e9ad0838338e6b3622b72451e81397506866b83a4a51dd0e34ed7752963c0fed9e8b017da5122e0dca3d345fb6'
    '60dac24871a5da1c2649e47af5fa215efcc74949e15130cdd2b240fa7ae6d5c557b10be2b1c2b6871e2cb49b578e63e144dea5b16945e5b90361abd229821c06'
    '7a438bdc8bf8d1a681c3277ce6ed263c5bdf77c5986ccd66a35ca7111d8c673c5d59250ba9607b07157452c2337eb9aa68fac8c7bc300b79aa22c453f34c4550'
    'SKIP'
)

pkgver() {
    local sha=$(curl -H "Accept: text/vnd.github.VERSION.sha" "https://api.github.com/repos/Paragon-Software-Group/linux-ntfs3/commits/master")
    echo "${_pkgver}.${sha:0:7}"
}

prepare() {
    mkdir -p "${_pkgver}"
    cd "${_pkgver}"

    patch -p3 -t -N -i "${srcdir}/ntfs3-v${_pkgver}.patch" || true

    patch -p0 -N -i "${srcdir}/Makefile.patch"

    # For testing
    # patch -p1 -N -i "${srcdir}/kernel-5.12-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.14-backport.patch"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${_pkgver}"
    mkdir -p "${dest}"
    cd "${dest}"
    cp -r "${srcdir}/${_pkgver}/"* ./
    cp "${srcdir}/dkms.conf" ./
    mkdir -p "./patches"
    cp "${srcdir}/kernel-"*.patch "./patches/"
}
