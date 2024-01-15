# Maintainer: Bin Jin <bjin@ctrl-d.org>
# Contributor: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

_pkgname=zfs
_git_repo=https://github.com/openzfs/zfs.git
_git_branch="$(/usr/bin/git ls-remote -h --sort=v:refname "${_git_repo}" 'zfs-*-staging' | tail -n 1)"
_git_branch=${_git_branch##*/}
_target_ver=${_git_branch#zfs-}
_target_ver=${_target_ver%-staging}

pkgname=${_pkgname}-dkms-staging-git
pkgver=2.2.2.r27.gac592318b8
pkgrel=1
pkgdesc="Kernel modules for the Zettabyte File System (release staging branch)."
arch=('any')
url="https://zfsonlinux.org/"
license=('CDDL-1.0')
provides=("ZFS-MODULE" "SPL-MODULE" "zfs-dkms")
conflicts=("zfs-dkms")
makedepends=("git")
source=("${_pkgname}::git+${_git_repo}#branch=${_git_branch}"
        "0001-only-build-the-module-in-dkms.conf.patch")
sha256sums=('SKIP'
            '8d5c31f883a906ab42776dcda79b6c89f904d8f356ade0dab5491578a6af55a5')
b2sums=('SKIP'
        '58dc2494e71b50833d44c126b72acad52e9817626542afbc245b7ba82009e8c8252ebde6023592aac42d9942207e7655c0a421da9067fbdd619746ebc372d791')

metaver() {
    if [[ -n "${srcdir}" ]]; then
        METAVER=$(grep -F Version "${srcdir}/${_pkgname}/META" | tr -d '[:space:]')
        printf "${METAVER##*:}"
    fi
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "%s.r%s.g%s" "$(metaver)" "$(git rev-list zfs-$(metaver)..HEAD --count)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    msg2 "Staging branch set to ${_git_branch}"

    patch -p1 -i ../0001-only-build-the-module-in-dkms.conf.patch

    # remove unneeded sections from module build
    sed -ri "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*|${_pkgname}.release|Makefile)/!d
}" configure.ac

    autoreconf -fi
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./scripts/dkms.mkconf -n ${_pkgname} -v $(metaver) -f dkms.conf
    ./scripts/make_gitrev.sh include/zfs_gitrev.h
    _meta_release=${pkgver#*.r}
    sed -i -e "s/Release:[[:print:]]*/Release:       ${_meta_release/./_}/" META
}

package() {
    depends=("zfs-utils>=$(metaver)" "zfs-utils<=${_target_ver}" 'dkms')

    cd "${srcdir}/${_pkgname}"

    dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -d "${dkmsdir}"/{config,scripts}
    cp -a configure dkms.conf Makefile.in META ${_pkgname}_config.h.in ${_pkgname}.release.in include/ module/ "${dkmsdir}"/
    cp config/compile config/config.* config/missing config/*sh "${dkmsdir}"/config/
    cp scripts/enum-extract.pl scripts/dkms.postbuild "${dkmsdir}"/scripts/
}
