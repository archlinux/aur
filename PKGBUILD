# Maintainer: Bin Jin <bjin@ctrl-d.org>
# Maintainer: Niccolò Belli <niccolo.belli@linuxsystems.it>
# Contributor: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

_pkgname=zfs
_git_repo=https://github.com/openzfs/zfs.git
_git_branch="$(/usr/bin/git ls-remote -h --sort=-v:refname "${_git_repo}" 'zfs-*-staging' | head -n 1)"
_git_branch=${_git_branch##*/}
_staging_ver=${_git_branch#zfs-}
_staging_ver=${_staging_ver%-staging}

if /usr/bin/git ls-remote -t --exit-code "${_git_repo}" "zfs-${_staging_ver}" >/dev/null; then
    _git_branch="tag=zfs-${_staging_ver}"
else
    _git_branch="branch=${_git_branch}"
fi

pkgname=${_pkgname}-dkms-staging-git
pkgver=2.2.6.r0.gbaa5031456
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
       "linux610-fix-tracepoints-definitions.patch::https://github.com/openzfs/zfs/commit/90af1e83e8abb89668b82d859940a596b195fe75.patch?full_index=1"
       "linux610-zfs_log-add-flex-array-fields-to-log-record-structs.patch"
       "linux610-lua-add-flex-array-field-to-TString-type.patch::https://github.com/openzfs/zfs/commit/c84a37ae93b5f2b32d30bee1cb942627c4c6caab.patch?full_index=1"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '46448a080544be0492d4a4e45af9871f6fc773f49d594fcab8deb5df63b0e5ff'
            '1887592564e682353cd2049b6595c0a1fcfbb662c06feb9757251a8e551eee12'
            '0750502bece069b82189347e6530fb569ace8a708246f2c4ec5c54e221950bcb'
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

    METAVER=$(grep -F Version "${srcdir}/${_pkgname}/META" | tr -d '[:space:]')
    METAVER=${METAVER##*:}
    printf "%s.r%s.g%s" "${METAVER}" "$(git rev-list zfs-${METAVER}..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    # modify META after pkgver() called
    sed -i -e "s/Version:[[:print:]]*/Version:       ${pkgver}/" META
    sed -i -e "s/Release:[[:print:]]*/Release:       ${pkgrel}/" META
    autoreconf -fi

    ./scripts/dkms.mkconf -n ${_pkgname} -v "${pkgver}" -f dkms.conf
    printf '#define\tZFS_META_GITREV "zfs-%s"\n' "${pkgver}" >include/zfs_gitrev.h

}

package() {
    depends=("zfs-utils>=${pkgver%%.r*}" "zfs-utils<=${_staging_ver}" 'dkms')

    cd "${srcdir}/${_pkgname}"

    dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure dkms.conf Makefile.in META ${_pkgname}_config.h.in ${_pkgname}.release.in include/ module/ "${dkmsdir}"/
    cp config/compile config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/enum-extract.pl scripts/dkms.postbuild "${dkmsdir}"/scripts/
}
