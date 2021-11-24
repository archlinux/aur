_repo="Paragon-Software-Group/linux-ntfs3"
_ver="5.15"
_base="8bb7eca972ad531c9b149c0a51ab43a417385813"
_head="master"

pkgname=ntfs3-dkms-git
pkgver=5.15.r9.g52e00ea
pkgrel=1
epoch=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1."
arch=('any')
url="https://github.com/${_repo}"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('NTFS3-MODULE' "ntfs3=${_ver}" "ntfs3-dkms=${_ver}")
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
    '139c88d394cf6372f539825ebd70024f2edbccca6f97eab15a8460aede38926b3aee0dce18bbdb129f91040878ed8dc6ef84064568e9b6404cfba86640bafc39'
    '1644192df72ce80d0244e21b2c429785106b0bba179a06c5babd92b6d1b09ad28771eeb63f953ecb65ed616ab2d6b1744f1465c905ae8080c6b01c8d7e164005'
    'c061d3d3b0e531f6d0eba533b884c168a3b057d96d68000cdb9e0fc736538cdc4e7e38d0168f58c3c1b8cb1a7c413f4fb32068847b8c4601dc0406f3fead7533'
)

pkgver() {
    local api="https://api.github.com/repos/${_repo}"
    local rev=$(curl "${api}/compare/${_base}...${_head}" | perl -ne'/"total_commits":\s?(\d+),?/ && print $1')
    local sha=$(curl -H "Accept: text/vnd.github.VERSION.sha" "${api}/commits/${_head}")
    echo "${_ver}.r${rev}.g${sha:0:7}"
}

prepare() {
    cd "${srcdir}"

    rm -rf "repo" "ntfs3"

    git clone --depth 1 --filter=tree:0 --sparse --no-checkout "${url}" "repo"

    cd "repo"

    git sparse-checkout set "/fs/ntfs3"
    git checkout "${_head}"

    ln -rs "fs/ntfs3" "${srcdir}/ntfs3"
}

build() {
    cd "${srcdir}/ntfs3"
    patch -p0 -N -i "${srcdir}/Makefile.patch"

    # For testing
    # patch -p1 -N -i "${srcdir}/kernel-5.15-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.14-backport.patch"
    # patch -p1 -N -i "${srcdir}/kernel-5.12-backport.patch"
}

package() {
    cd "${srcdir}"

    local dest=$(install -dm755 "${pkgdir}/usr/src/ntfs3-${_ver}" && echo "$_")

    cp -rt "${dest}" "ntfs3/"*

    install -Dm644 -t "${dest}" "dkms.conf"

    install -dm755 "${dest}/patches" && cp -t "$_" "kernel-"*.patch
}
