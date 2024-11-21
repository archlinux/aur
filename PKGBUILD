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
pkgrel=4
pkgdesc="Kernel modules for the Zettabyte File System (release staging branch) with compatibility patches for latest stable kernel."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL-1.0')
groups=('zfs-staging-git')
provides=("ZFS-MODULE" "SPL-MODULE" "zfs-dkms" "zfs")
conflicts=("zfs-dkms")
makedepends=("git")
source=("${_pkgname}::git+${_git_repo}#${_git_branch}"
	"linux610-zfs_log-add-flex-array-fields-to-log-record-structs.patch::https://github.com/darkbasic/zfs/commit/a296afc40d2a3666545a5689a438eb85ad06652b.patch?full_index=1"
	"linux610-fix-tracepoints-definitions-bp.patch::https://github.com/darkbasic/zfs/commit/ccf64c2c577e346603e4e301d9f1e55cba03cbd7.patch?full_index=1"
	"linux610-lua-add-flex-array-field-to-TString-type-bp.patch::https://github.com/darkbasic/zfs/commit/1480930a764dc6fb752d9ea4efc730d23719d2e4.patch?full_index=1"
	"linux612-avoid-kmem_cache_create-redefinition.patch::https://github.com/darkbasic/zfs/commit/25ca775c0ef72a6e2a1e09cf8531605f54268a08.patch?full_index=1"
	"linux612-support-3arg-dequeue_signal-without-task-param.patch::https://github.com/darkbasic/zfs/commit/2999a90d2b75bf08a18f0ce5574461c3c1074436.patch?full_index=1"
	"linux612-FMODE_UNSIGNED_OFFSET-is-now-FOP_UNSIGNED_OFFSET.patch::https://github.com/darkbasic/zfs/commit/6850e8ad5b561e2754fb6328239885a367aeba29.patch?full_index=1"
	"linux612-f_version-removed-from-struct-file.patch::https://github.com/darkbasic/zfs/commit/f72a302a04af3618adfc0235ebaff9a76093817b.patch?full_index=1"
	"linux612-PG_error-flag-was-removed.patch::https://github.com/darkbasic/zfs/commit/e66472495cc3a97f715edb7935ccecef459f19f0.patch?full_index=1"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '1887592564e682353cd2049b6595c0a1fcfbb662c06feb9757251a8e551eee12'
            'a7ec0f62024c6644117786d30589e0d6ca3ad5993a3837f2b31afb42bdd5c0a2'
            'd8a4101f7c3c4809d8c9b9b8195296331eaaa34c48c3176b3d654a808a8b466d'
            'd760602951c48c7968cf5cad046fe8595c742abc225829e7b2b70844185e70bf'
            'cd05bcaedda55c83d03bbe0ef8561dc6e86f8ec977297af831de8d245cf8eebe'
            '7c45ab517dde1571a4fe3f13708fec930e922596cf0e81f4fad04edb7f2aa0f1'
            '9db4e43925488aa76a5b4f4a779adacc77f88c19a72aca42e0be4dacf98eb379'
            'a831262f11a663700b979f397d41e6b6fcaaed42dce08bb6db4563d003f79636'
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
