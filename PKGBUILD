pkgname=ntfs3-dkms-git
pkgver=5.15.r9.g52e00ea
pkgrel=1
epoch=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1."
arch=('any')
_repo="Paragon-Software-Group/linux-ntfs3"
url="https://github.com/${_repo}"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('NTFS3-MODULE' 'ntfs3')
conflicts=('ntfs3')
options=('!strip' '!emptydirs')

source=(
    "Makefile.patch"
    "dkms.conf"
    "kernel-5.12-backport.patch"
    "kernel-5.14-backport.patch"
    "kernel-5.15-backport.patch"
)

sha512sums=(
    '533c249f0f6bd4833faf02d0d92ca1b5802a49afc5feb2e46a7d37275cfca7896db76cd83593f4f313977d278a9a7e92eda550667be2b93910c49cfb68ead4fb'
    '5e2f2493fbf7a4d12e7cd7d3c0bb8fc3d8bd5d290f990e5b73c52bfa4ab58127c08eeff09fab7b0ba3a2c4ab1861fec68ce711b1cb57867bb61a81785f312677'
    'bed04edd0de7fd1f5675689e24b77f7d7a1b6eb8075c0fb20fa7ac8f2ca569aa3ea1685ddde5f1800958e21be96b8afaae68f49d7855b97915eb1c9c3352a66e'
    '1644192df72ce80d0244e21b2c429785106b0bba179a06c5babd92b6d1b09ad28771eeb63f953ecb65ed616ab2d6b1744f1465c905ae8080c6b01c8d7e164005'
    '45b44d0d235e1fe0853c2b095843ec5d795dacc8437585d84250b7be4793aeb538152f032fc998d7073e62b11251d9f345679f912a6cb54b87b56aa85173dc22'
)

_ver="5.15"
_branch="master"
_base="8bb7eca972ad531c9b149c0a51ab43a417385813"

# The whole kernel history is very huge, so downloading it is a pain.
# Also commits count is insane and we don't want to see all that in pkgver.
# Here is tricky workaround.
# Use latest merge as base commit and request info via GitHub API.

pkgver() {
    cd "${srcdir}/repo"

    local rev=$(curl "https://api.github.com/repos/${_repo}/compare/${_base}...${_branch}" | perl -ne'/"total_commits":\s?(\d+),?/ && print $1')
    local sha=$(git rev-parse HEAD)
    echo "${_ver}.r${rev}.g${sha:0:7}"
}

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --depth=1 --filter=tree:0 --sparse --no-checkout --single-branch -b "${_branch}" "${url}" "repo"
    fi

    cd "repo"

    git fetch -f --depth=1 --filter=tree:0
    git sparse-checkout set "/fs/ntfs3"
    git reset --hard "origin/${_branch}"
}

package() {
    cd "${srcdir}"

    local dest=$(install -dm755 "${pkgdir}/usr/src/ntfs3-${_ver}" && echo "$_")

    install -Dm644 -t "${dest}" "dkms.conf"

    install -dm755 "${dest}/patches" && cp -t "$_" "kernel-"*.patch

    cd "repo/fs/ntfs3"

    patch -p0 -N -i "${srcdir}/Makefile.patch"

    # For testing
    # patch -p1 -N -i "${srcdir}/kernel-5.15-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.14-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.12-backport.patch"

    cp -rt "${dest}" *
}
