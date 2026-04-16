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
        _base_ver="$(git ls-remote -t --sort=-v:refname "${_git_repo}" "zfs-${_staging_ver%.*}.*[0-9]" | grep -E 'rc|99' -v | head -n 1)"
        _base_ver="${_base_ver##*/zfs-}"
        _base_ver="${_base_ver:=${_staging_ver%.*}.$((${_staging_ver##*.}-1))}"
    fi
else
    # We are probably inside a clean chroot environment, use fixed version info instead
    _git_branch="branch=zfs-2.4.2-staging"
    _staging_ver="2.4.2"
    _base_ver="2.4.1"
fi

pkgname=${_pkgname}-dkms-staging-git
pkgver=2.4.1.r0.g1c702dda34
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
        "linux700-explicitly_set_setlease_handler_to_kernel_implementation.patch::https://github.com/CachyOS/zfs/commit/e964a2ccb6cc8829d7fcbdb3136d4eb8b8bed1be.patch?full_index=1"
        "linux700-add_shims_for_the_fs_context-based_mount_API.patch::https://github.com/CachyOS/zfs/commit/d5424b0b9751a338d3ec83408464aa44d08b10e2.patch?full_index=1"
        "linux700-posix_acl_to_xattr_now_allocates_memory.patch::https://github.com/CachyOS/zfs/commit/b5687c3e8fc81a1fb5676ac36a0521138f8850c4.patch?full_index=1"
        "linux700-blk_queue_nonrot_renamed_to_blk_queue_rot.patch::https://github.com/CachyOS/zfs/commit/716112ac9c43e8b98b3bf2c3b5346ac591118bb7.patch?full_index=1"
        "linux700-also_set_setlease_handler_on_directories.patch::https://github.com/CachyOS/zfs/commit/c42200d1a5a18e5a8b0390735bbb842ea1e74e22.patch?full_index=1"
        "linux700-autoconf_Remove_copy-from-user-inatomic_API_checks.patch::https://github.com/CachyOS/zfs/commit/ce77a691604b1a1b89250728190ac2fbc9b5ab96.patch?full_index=1"
        "linux700-ensure_LSMs_get_to_process_mount_options.patch::https://github.com/CachyOS/zfs/commit/0ff5af776a5c048f6a0b19bca6aa78ebce9d74be.patch?full_index=1"
        "linux700-META.patch::https://github.com/CachyOS/zfs/commit/0829cf892b5d7b3a0e8aa76cc7aca02b84f62557.patch?full_index=1"
       )
sha256sums=('SKIP'
            '8d5c31f883a906ab42776dcda79b6c89f904d8f356ade0dab5491578a6af55a5'
            '6c793cdbcf0c758b7bc78dcac85d116052b7a66416e4c54179cb0955687b3875'
            '59656435058e41620f15b5691ef1f753355fe81c01a562d92b7c8028aa527b1f'
            '788b5225fd75412db99af8121ab774d2aae71421f4af7a38abff41eee898f5b6'
            '3c0db1cf4e7218cc33bc0cb2a4b5ff9fbf0bdf53f29c7852a74080a26a34f90c'
            '5f6e35721c8ed4ef77ae8e7912950c0a65cac511ab15d78e846dea20be201eba'
            '8ebdaf224d540c289e39082812dcae2549df4f4beb7c559ddc9459aeaf2377bc'
            '23e5fb575eaebb9acc274e52af19c7572762c58b5aa8d8c20670bad4b403b0a5'
            'efbd221abae6a8d8a4df24a43d6046d5b5e3ac8916e85a7bea49fce78b1f13d7'
            '846a8f5f5287acab6e45fd1217526228465851307684fbdf0090000d021600df'
            '07a80ae9c2408522b8261252b2cb11c9ceea5429a8bd336e86a5a17178641e40')

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
