pkgname=ntfs3-dkms-git
pkgver=5.15.r9.g52e00ea
pkgrel=5
epoch=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1."
arch=('any')
url="https://github.com/Paragon-Software-Group/linux-ntfs3"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('NTFS3-MODULE' 'ntfs3')
conflicts=('ntfs3')
options=('!strip' '!emptydirs')

_patches=(
    "kernel-5."{12,14,15}"-backport.patch"
    "kernel-5.16.patch"
)

source=(
    "Makefile.patch"
    "dkms.conf"
    "${_patches[@]}"
)

sha256sums=(
    'fd4cf0e2dc160efecc55d4ea99667669b870599e4e81be435ec2201381b7e2ac'
    '1c7c30b21878f15d5eacc2fda563d94fd7491f1681818b7ca7a377c588abf2f4'
    'b1674d6bb9b255a059efc4eae0846a426620a7a236dff19f4d0f85dfe2bbfd0d'
    'f176a508596d0021beae0af264f2ef92d46062c7b12e89e4f4e8104d91118d85'
    '69c315bbb37e831adacedaa5eff1b32571ef86a24dcdb2a312a015bf824f6569'
    'e61b3876ad3b474229ee6707cb7664783cdd6888676dfc433b49a45682083d5a'
)

_ver="5.15"
_since="1635713590"

# The whole kernel history is very huge, so downloading it is a pain.
# Also commits count is insane and we don't want to see all that in pkgver.
# Here is a tricky workaround.
# Make a shallow clone since the specified timestamp.

pkgver() {
    cd "${srcdir}/repo"
    local rev=$(git rev-list --count HEAD)
    local sha=$(git rev-parse HEAD)
    echo "${_ver}.r$((rev - 1)).g${sha:0:7}"
}

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --shallow-since="${_since}" --filter=tree:0 --no-checkout --single-branch "${url}" "repo"
    fi

    cd "repo"
    git fetch -f
    git sparse-checkout set "/fs/ntfs3"
    git reset --hard FETCH_HEAD

    cd "fs/ntfs3"
    patch -i "${srcdir}/Makefile.patch"

    # For testing
    # patch -i "${srcdir}/${_patches[-1]}"
    # patch -i "${srcdir}/${_patches[-2]}"
    # patch -i "${srcdir}/${_patches[-3]}"
    # patch -i "${srcdir}/${_patches[-4]}"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${_ver}"
    install -dm755 "${dest}"

    cd "${srcdir}"
    install -Dm644 -t "${dest}" "dkms.conf"
    install -Dm644 -t "${dest}/patches" "${_patches[@]}"

    cd "repo/fs/ntfs3"
    cp -rt "${dest}" *
}
