pkgname=ntfs3-dkms-git
pkgver=r45.g15b2ae7
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://github.com/Paragon-Software-Group/linux-ntfs3'
license=('GPL2')
depends=('dkms')
provides=('NTFS3-MODULE' 'ntfs3' 'ntfs3-dkms')
conflicts=('ntfs3')
options=('!strip')

local rev=$(curl "https://api.github.com/repos/torvalds/linux/compare/6abaa83c7352b31450d7e8c173f674324c16b02b...Paragon-Software-Group:devel" | perl -ne'/"total_commits":\s?(\d+),?/ && print $1')
local sha=$(curl -H "Accept: text/vnd.github.VERSION.sha" "https://api.github.com/repos/Paragon-Software-Group/linux-ntfs3/commits/devel")
_pkgver="r${rev}.g${sha:0:7}"

source=(
    Makefile.patch
    dkms.conf
    kernel-5.12-backport.patch
    kernel-5.14-backport.patch
    "ntfs3-${_pkgver}.patch::https://github.com/torvalds/linux/compare/6abaa83c7352b31450d7e8c173f674324c16b02b...Paragon-Software-Group:devel.diff"
)

sha512sums=(
    '533c249f0f6bd4833faf02d0d92ca1b5802a49afc5feb2e46a7d37275cfca7896db76cd83593f4f313977d278a9a7e92eda550667be2b93910c49cfb68ead4fb'
    'ac00adb4a6d7fc685c39af054474631c930455e9ad0838338e6b3622b72451e81397506866b83a4a51dd0e34ed7752963c0fed9e8b017da5122e0dca3d345fb6'
    '1b428ec1e74c14a4e6840359707625c4dcd9b6a0664fcaa2d7a5d406d7db233834e32e7ae38201cdd0254a05d9c968a93dc960b47fbb2b5f80dc950df9f60145'
    '0392b665aced96aa92cd6e0f72c2276c0233e661c7cc3b6fe8e074c2be654f2c8836b1d0468a8a665f43fac08704896d0ef0dcbb8826b4deef88a3a894bdf050'
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
