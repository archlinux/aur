pkgname=ntfs3-dkms-git
_pkgver=27.0.0
pkgver=27.0.0.96b1804
pkgrel=1
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
    '374c6fa524defb5dcac093493bc7526e43ca9fe07602357fb51df4a26b02280ba4f2d764d3ba2ba2b32d5318ef466f3e0b6cbfdad1cdac0b04c31e8543114e33'
    '081b19b271ed89c47a9306874827a0c15feba6dda6d7c8a085f634a72a6691a78fdeccf47488ed141b979f7bfbf3df2d117301f09ba2da8416449460d4711d34'
    'SKIP'
)

pkgver() {
    local sha=$(curl -H "Accept: text/vnd.github.VERSION.sha" "https://api.github.com/repos/Paragon-Software-Group/linux-ntfs3/commits/master")
    echo "${_pkgver}.${sha:0:7}"
}

prepare() {
    mkdir -p "${_pkgver}"
    cd "${_pkgver}"

    patch -p3 -t -N -i "${srcdir}/ntfs3-v${pkgver}.patch" || true

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
