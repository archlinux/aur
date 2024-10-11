# Maintainer: Bin Jin <bjin@ctrl-d.org>
# Contributor: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

_pkgname=zfs
_git_repo=https://github.com/openzfs/zfs.git
_git_branch="$(/usr/bin/git ls-remote -h --sort=-v:refname "${_git_repo}" "zfs-*-*" | grep -E '[-](release|staging)$' | head -n 1)"
_git_branch=${_git_branch##*/}
_staging_ver=${_git_branch#zfs-}
if [[ ${_staging_ver} == *-staging ]]; then
    _staging_ver=${_staging_ver%-staging}
else
    _staging_ver=${_staging_ver%-release}.0
fi

if /usr/bin/git ls-remote -t --exit-code "${_git_repo}" "zfs-${_staging_ver}" >/dev/null; then
    _git_branch="tag=zfs-${_staging_ver}"
else
    _git_branch="branch=${_git_branch}"
fi

pkgname=${_pkgname}-dkms-staging-git
pkgver=2.3.0.rc1.g3a9fca901b
pkgrel=1
pkgdesc="Kernel modules for the Zettabyte File System (release staging branch)."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL-1.0')
groups=('zfs-staging-git')
provides=("ZFS-MODULE" "SPL-MODULE" "zfs-dkms" "zfs")
conflicts=("zfs-dkms")
makedepends=("git")
source=("${_pkgname}::git+${_git_repo}#${_git_branch}"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '8d5c31f883a906ab42776dcda79b6c89f904d8f356ade0dab5491578a6af55a5')

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
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*|${_pkgname}.release|Makefile)/!d
}" configure.ac
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    METAVER=$(grep -F Version: "${srcdir}/${_pkgname}/META" | tr -d '[:space:]')
    METAVER=${METAVER##*:}
    if git rev-parse --verify -q zfs-${METAVER} >/dev/null; then
        printf "%s.r%s.g%s" "${METAVER}" "$(git rev-list zfs-${METAVER}..HEAD --count)" "$(git rev-parse --short HEAD)"
    else
        METAREL=$(grep -F Release: "${srcdir}/${_pkgname}/META" | tr -d '[:space:]')
        METAREL=${METAREL##*:}
        printf "%s.%s.g%s" "${METAVER}" "${METAREL}" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${srcdir}/${_pkgname}"

    # modify META after pkgver() called
    sed -i -e "s/Version:[[:print:]]*/Version:       ${pkgver}/" META
    sed -i -e "s/Release:[[:print:]]*/Release:       ${pkgrel}/" META
    autoreconf -fi

    ./scripts/dkms.mkconf -n ${_pkgname} -v "${pkgver}" -f dkms.conf
    printf '#define\tZFS_META_GITREV "zfs-%s"\n' "${pkgver}" >include/zfs_gitrev.h

    # building against unsupported kernel version
    sed -i '/^PRE_BUILD=/a\  --enable-linux-experimental' dkms.conf
}

package() {
    depends=("zfs-utils>=${pkgver%%.r*}" "zfs-utils<=${_staging_ver}" 'dkms')

    cd "${srcdir}/${_pkgname}"

    dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure dkms.conf Makefile.in META ${_pkgname}_config.h.in ${_pkgname}.release.in include/ module/ "${dkmsdir}"/
    cp config/compile config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/dkms.postbuild "${dkmsdir}"/scripts/
}
