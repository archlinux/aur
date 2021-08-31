pkgname=ntfs3-dkms-git
pkgver=r32.gd362446
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://github.com/Paragon-Software-Group/linux-ntfs3'
license=('GPL2')
depends=('dkms')
provides=('NTFS3-MODULE' 'ntfs3' 'ntfs3-dkms')
conflicts=('ntfs3')
options=('!strip')

local rev=$(curl "https://api.github.com/repos/torvalds/linux/compare/master...Paragon-Software-Group:master" | perl -ne'/"total_commits":\s?(\d+),?/ && print $1')
local sha=$(curl -H "Accept: text/vnd.github.VERSION.sha" "https://api.github.com/repos/Paragon-Software-Group/linux-ntfs3/commits/master")
_pkgver="r${rev}.g${sha:0:7}"

source=(
    Makefile.patch
    dkms.conf
    kernel-5.12-backport.patch
    kernel-5.14-backport.patch
    "ntfs3-${_pkgver}.patch::https://github.com/torvalds/linux/compare/master...Paragon-Software-Group:master.diff"
)

sha512sums=(
    '533c249f0f6bd4833faf02d0d92ca1b5802a49afc5feb2e46a7d37275cfca7896db76cd83593f4f313977d278a9a7e92eda550667be2b93910c49cfb68ead4fb'
    'ac00adb4a6d7fc685c39af054474631c930455e9ad0838338e6b3622b72451e81397506866b83a4a51dd0e34ed7752963c0fed9e8b017da5122e0dca3d345fb6'
    '6f6190825febee219e10be6583718afc9360b3b4c69e06f8d59715da8f73a855d4f652b1ef77064ca100fd15678e13a0ef10bb7837f10c0784530eff1694340d'
    '5f04690f57fea1b4db18dd7723d9e21c23ed382935988fd9e192e07a80216efbcb06e1ff6a2ff3286bd824c19da5de1ccad68667dd06d7cc686611c0a93d6691'
    'SKIP'
)

pkgver() {
    echo "${_pkgver}"
}

prepare() {
    mkdir -p "${_pkgver}"
    cd "${_pkgver}"

    patch -p3 -t -N -i "${srcdir}/ntfs3-${_pkgver}.patch" || true

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
