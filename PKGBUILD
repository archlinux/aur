pkgname=ntfs3-dkms-git
pkgver=5.15.r9.g52e00ea
pkgrel=3
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
    "kernel-5.16.patch"
)

sha256sums=(
    'fd4cf0e2dc160efecc55d4ea99667669b870599e4e81be435ec2201381b7e2ac'
    '55db2894a265ec5ba50ea3edc05259f9260b5819a8fe65dbb4e0ab5aa58b3ee7'
    'b1674d6bb9b255a059efc4eae0846a426620a7a236dff19f4d0f85dfe2bbfd0d'
    'f176a508596d0021beae0af264f2ef92d46062c7b12e89e4f4e8104d91118d85'
    '69c315bbb37e831adacedaa5eff1b32571ef86a24dcdb2a312a015bf824f6569'
    '62bdd84924a189b24912cf7a938c61fff6bd5aa314359e62bdd6efffc49b907b'
)

_ver="5.15"
_branch="master"
_base="8bb7eca972ad531c9b149c0a51ab43a417385813"

# The whole kernel history is very huge, so downloading it is a pain.
# Also commits count is insane and we don't want to see all that in pkgver.
# Here is a tricky workaround.
# Use the latest merge point and request info via GitHub API.

pkgver() {
    cd "${srcdir}/repo"

    local rev=$(curl -sS "https://api.github.com/repos/${_repo}/compare/${_base}...${_branch}" | perl -ne'/"total_commits":\s?(\d+),?/ && print $1')
    test "${rev}"

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

    cd "fs/ntfs3"
    patch -p0 -N -i "${srcdir}/Makefile.patch"

    # For testing
    # patch -p1 -N -i "${srcdir}/kernel-5.16.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.15-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.14-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.12-backport.patch"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${_ver}"
    install -dm755 "${dest}"

    cd "${srcdir}"
    install -Dm644 -t "${dest}" "dkms.conf"
    install -dm755 "${dest}/patches" && cp -t "$_" "kernel-"*.patch

    cd "repo/fs/ntfs3"
    cp -rt "${dest}" *
}
