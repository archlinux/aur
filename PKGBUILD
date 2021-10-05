pkgname=ntfs3-dkms-git
pkgver=r98.g95dd8b2
pkgrel=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1."
arch=('any')
url='https://github.com/Paragon-Software-Group/linux-ntfs3'
license=('GPL2')
depends=('dkms')
makedepends=('subversion')
provides=('NTFS3-MODULE' 'ntfs3' 'ntfs3-dkms')
conflicts=('ntfs3')
options=('!strip')

source=(
    Makefile.patch
    dkms.conf
    kernel-5.12-backport.patch
    kernel-5.14-backport.patch
    "ntfs3::svn+https://github.com/Paragon-Software-Group/linux-ntfs3/branches/devel/fs/ntfs3"
)

sha512sums=(
    '533c249f0f6bd4833faf02d0d92ca1b5802a49afc5feb2e46a7d37275cfca7896db76cd83593f4f313977d278a9a7e92eda550667be2b93910c49cfb68ead4fb'
    'ac00adb4a6d7fc685c39af054474631c930455e9ad0838338e6b3622b72451e81397506866b83a4a51dd0e34ed7752963c0fed9e8b017da5122e0dca3d345fb6'
    'fc81e387bdd109177483d0e63d6e8d08034479be7712f506c1b7c053feb0ec796b030418b15d1bc408e5ca7292b9653dd15878dff627c4e98a739d44b900a6a0'
    '61a1948e3e607dabaca47742777b4ea92fadf9f5416ebaef8c06f1e17aab0f3ced34e900c0cf1ed462303f391f4a4713b5b30a488b349839780bde3248e19f3c'
    'SKIP'
)

pkgver() {
    local rev=$(curl "https://api.github.com/repos/Paragon-Software-Group/linux-ntfs3/compare/6abaa83c7352b31450d7e8c173f674324c16b02b...devel" | perl -ne'/"total_commits":\s?(\d+),?/ && print $1')
    local sha=$(curl -H "Accept: text/vnd.github.VERSION.sha" "https://api.github.com/repos/Paragon-Software-Group/linux-ntfs3/commits/devel")
    echo "r${rev}.g${sha:0:7}"
}

prepare() {
    cd "ntfs3"

    patch -p0 -N -i "${srcdir}/Makefile.patch"

    # For testing
    # patch -p1 -N -i "${srcdir}/kernel-5.12-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.14-backport.patch"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${pkgver}"
    mkdir -p "${dest}"
    cd "${dest}"
    cp -r "${srcdir}/ntfs3/"* ./
    cp "${srcdir}/dkms.conf" ./
    mkdir -p "./patches"
    cp "${srcdir}/kernel-"*.patch "./patches/"
}
