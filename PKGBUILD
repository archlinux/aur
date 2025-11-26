# Maintainer: Bin Jin <bjin@protonmail.com>
# Maintainer: Niccolò Belli <niccolo.belli@linuxsystems.it>
# Contributor: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

_pkgname=zfs
_git_repo=https://github.com/openzfs/zfs.git

if command -v git > /dev/null; then
    _git_branch="$(git ls-remote -h --sort=-v:refname "${_git_repo}" 'zfs-*-staging' | head -n 1)"
    _git_branch=${_git_branch##*/}
    _staging_ver=${_git_branch#zfs-}
    _staging_ver=${_staging_ver%-staging}

    if git ls-remote -t --exit-code "${_git_repo}" "zfs-${_staging_ver}" >/dev/null; then
        _git_branch="tag=zfs-${_staging_ver}"
        _base_ver="${_staging_ver}"
    else
        _git_branch="branch=${_git_branch}"
        _base_ver="$(git ls-remote -t --sort=-v:refname "${_git_repo}" "zfs-${_staging_ver%.*}.*[0-9]" | grep -F '.99' -v | head -n 1)"
        _base_ver="${_base_ver##*/zfs-}"
        _base_ver="${_base_ver:=${_staging_ver%.*}.$((${_staging_ver##*.}-1))}"
    fi
else
    # We are probably inside a clean chroot environment, use fixed version info instead
    _git_branch="branch=zfs-2.3.6-staging"
    _staging_ver="2.3.6"
    _base_ver="2.3.5"
fi

pkgname=${_pkgname}-dkms-staging-git
pkgver=2.3.5.r0.gab38521f31
pkgrel=2
pkgdesc="Kernel modules for the Zettabyte File System (release staging branch) with compatibility patches for latest stable kernel."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL-1.0')
groups=('zfs-staging-git')
provides=("ZFS-MODULE" "SPL-MODULE" "zfs-dkms" "zfs")
conflicts=("zfs-dkms")
makedepends=("git")
source=("${_pkgname}::git+${_git_repo}#${_git_branch}"
        "0001-only-build-the-module-in-dkms.conf.patch"
        "69-zfs-dkms-check.hook"
        "zfs-dkms-check"
        "Fix-LLVM-21-Wuninitialized-const-pointer-warning.patch::https://github.com/openzfs/zfs/commit/9acedbaceec362d08a33ebfe7c4c7efcee81d094.patch?full_index=1"
        "linux618-replace_nth_page.patch::https://github.com/darkbasic/zfs/commit/9ae69e2f11c7ff12a8a14f24d49c12d0c6f7b4d5.patch?full_index=1"
        "linux618-convert_ida_simple_calls.patch::https://github.com/darkbasic/zfs/commit/2525b7726e3547af6e1a9ddc2b55b03b0eb51b32.patch?full_index=1"
        "linux618-block_device_operations_getgeo_takes_struct_gendisk.patch::https://github.com/darkbasic/zfs/commit/a8b443445897daf82883abec3f95cbf762908f0f.patch?full_index=1"
        "linux618-replace_write_cache_pages.patch::https://github.com/darkbasic/zfs/commit/72e04819f2382150d3be5f890fe9e270af13b995.patch?full_index=1"
        "linux618-namespace_type_moved_to_ns_common.patch::https://github.com/darkbasic/zfs/commit/74c39c4171b8a5098529c029e04b1a24433099a7.patch?full_index=1"
        "linux618-sha256_generic_make_internal_functions_a_little_more_private.patch::https://github.com/darkbasic/zfs/commit/fa694e8bde3717f6a070835eb854340b4293e843.patch?full_index=1"
        "linux618-generic_drop_inode_and_generic_delete_inode_renamed.patch::https://github.com/darkbasic/zfs/commit/13c6a707958493df8fc6a7909072e0a311660af2.patch?full_index=1")
sha256sums=('SKIP'
            '8d5c31f883a906ab42776dcda79b6c89f904d8f356ade0dab5491578a6af55a5'
            '6c793cdbcf0c758b7bc78dcac85d116052b7a66416e4c54179cb0955687b3875'
            '59656435058e41620f15b5691ef1f753355fe81c01a562d92b7c8028aa527b1f'
            'd4c85e438f8bc9619b4980bdc460074a581058e3043cb1c493eab1b19c560cdb'
            'ff5c0fabcb4762f2bc3d98110b3a378f3feb785ad4a710966747bdf22dd1d6f5'
            'd7ef11ca273e0012505df302cb7a5906b097e72735919701886493b903b20f02'
            'facd4ccee7bd4528afd18d7728fae2c9884537acb3bf528e0a63a7c9f3e9d3fa'
            'd509392d54e4c53fa356bae8b891327a3b52acb7755d15e49652e64cc2b421ca'
            '1ae844cf50c763dcf003fc112cead50a2b7c8de74e4d3faacc7665aad2f3ce1a'
            '7c268cd7b87b832dde2e692b443ca2162aa62082a3c2c0aae1488a88c7e453e7'
            'ca1f4c1fc3da7f0de50e5b5db1680e2bb5d3f9db989a0738ba5967b805cdb79f')

prepare() {
    cd "${srcdir}/${_pkgname}"

    msg2 "Staging branch set to ${_git_branch}"

    local -a patches
    patches=($(printf '%s\n' "${source[@]}" | grep -F '.patch'))
    patches=("${patches[@]%%::*}")
    patches=("${patches[@]##*/}")

    for patch in "${patches[@]}"; do
        if patch -p1 -R -i "../$patch" --dry-run -sf >/dev/null; then
            msg2 "Ignoring patch $patch..."
        else
            msg2 "Applying patch $patch..."
            patch -p1 -N -i "../$patch"
        fi
    done

    # remove unneeded sections from module build
    sed -ri '/^AC_CONFIG_FILES\(\[$/,/^\]\)$/{
/^AC_CONFIG_FILES\(\[$/n
/^\]\)$/n
/^\s*(module\/.*|zfs.release|Makefile)$/!d
}' configure.ac

    sed -i -e "s/Version:[[:print:]]*/Version:       ${pkgver}/" META
    sed -i -e "s/Release:[[:print:]]*/Release:       ${pkgrel}/" META
    autoreconf -fi
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "%s.r%s.g%s" "${_base_ver}" "$(git rev-list zfs-${_base_ver}..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./scripts/dkms.mkconf -n ${_pkgname} -v "${pkgver}" -f dkms.conf
    printf '#define\tZFS_META_GITREV "zfs-%s"\n' "${pkgver}" >include/zfs_gitrev.h

    # ignore "Linux-Maximum" section in META file
    sed -i '/^PRE_BUILD=/a\  --enable-linux-experimental' dkms.conf
}

package() {
    depends=("zfs-utils>=${_base_ver}" "zfs-utils<=${_staging_ver}" 'dkms')

    cd "${srcdir}/${_pkgname}"

    dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure dkms.conf Makefile.in META zfs_config.h.in zfs.release.in include/ module/ "${dkmsdir}"/
    cp config/compile config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/dkms.postbuild scripts/objtool-wrapper.in "${dkmsdir}"/scripts/

    install -D -m755 -t "${pkgdir}/usr/share/libalpm/scripts" ../zfs-dkms-check
    install -D -m644 -t "${pkgdir}/usr/share/libalpm/hooks" ../69-zfs-dkms-check.hook
}
