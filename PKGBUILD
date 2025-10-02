# Maintainer: Niccolò Belli <niccolo.belli@linuxsystems.it>
# Contributor: Bin Jin <bjin@ctrl-d.org>
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
    _git_branch="branch=zfs-2.3.5-staging"
    _staging_ver="2.3.5"
    _base_ver="2.3.4"
fi

pkgname=${_pkgname}-dkms-staging-compat-git
pkgver=2.3.4.r0.g34f96a15c7
pkgrel=1
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
        "linux617-d_set_d_op_is_no_longer_available.patch::https://github.com/openzfs/zfs/commit/0df91abe821e52bc63c59f4fd0548835081dc3ad.patch?full_index=1")
sha256sums=('SKIP'
            '8d5c31f883a906ab42776dcda79b6c89f904d8f356ade0dab5491578a6af55a5'
            '6c793cdbcf0c758b7bc78dcac85d116052b7a66416e4c54179cb0955687b3875'
            '59656435058e41620f15b5691ef1f753355fe81c01a562d92b7c8028aa527b1f'
            'aed996fed71d0b82c8d5245555b3a2500a325028d1b6726e72605924fe32e563')

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
