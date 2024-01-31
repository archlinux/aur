# Maintainer: Bin Jin <bjin@ctrl-d.org>
# Contributor: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

_pkgname=zfs
_git_repo=https://github.com/openzfs/zfs.git
_git_branch="$(/usr/bin/git ls-remote -h --sort=-v:refname "${_git_repo}" 'zfs-*-staging' | head -n 1)"
_git_branch=${_git_branch##*/}

pkgname=${_pkgname}-utils-staging-git
pkgver=2.2.2.r73.ge6ca28c970
pkgrel=1
pkgdesc="Userspace utilities for the Zettabyte File System (release staging branch)."
arch=("i686" "x86_64" "aarch64")
url="https://zfsonlinux.org/"
license=('CDDL-1.0')
optdepends=('python: for arcstat/arc_summary/dbufstat')
conflicts=("${_pkgname}-utils")
source=("${_pkgname}::git+${_git_repo}#branch=${_git_branch}"
        "zfs-node-permission.conf"
        "zfs.initcpio.install"
        "zfs.initcpio.hook")
sha256sums=('SKIP'
            '7ad45fd291aa582639725f14d88d7da5bd3d427012b25bddbe917ca6d1a07c1a'
            '2f09c742287f4738c7c09a9669f8055cd63d3b9474cd1f6d9447152d11a1b913'
            '15b5acea44225b4364ec6472a08d3d48666d241fe84c142e1171cd3b78a5584f')
backup=('etc/default/zfs'
        'etc/zfs/zed.d/zed.rc')

prepare() {
    cd "${srcdir}/${_pkgname}"

    msg2 "Staging branch set to ${_git_branch}"

    # pyzfs is not built, but build system tries to check for python anyway
    ln -sf /bin/true python3-fake
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

    # Disable tree vectorization. Related issues:
    # https://github.com/openzfs/zfs/issues/13605
    # https://github.com/openzfs/zfs/issues/13620
    export CFLAGS="$CFLAGS -fno-tree-vectorize"
    export CXXFLAGS="$CXXFLAGS -fno-tree-vectorize"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --sbindir=/usr/bin \
                --with-mounthelperdir=/usr/bin \
                --with-udevdir=/usr/lib/udev \
                --libexecdir=/usr/lib \
                --localstatedir=/var \
                --with-python="$PWD/python3-fake" \
                --enable-pyzfs=no \
                --enable-systemd \
                --with-config=user
    make
}

package() {
    provides=("${_pkgname}-utils=${pkgver%%.r*}")

    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install
    install -D -m644 contrib/bash_completion.d/zfs "${pkgdir}"/usr/share/bash-completion/completions/zfs

    # Fix for permissions being overwritten on /dev/zfs. Related issues:
    # https://github.com/openzfs/zfs/issues/15146
    # https://github.com/systemd/systemd/issues/28653
    install -D -m644 "${srcdir}"/zfs-node-permission.conf "${pkgdir}"/usr/lib/tmpfiles.d/zfs-node-permission.conf

    # Remove uneeded files
    rm -r "${pkgdir}"/etc/init.d
    rm -r "${pkgdir}"/etc/sudoers.d #???
    # We're experimenting with dracut in [extra], so start installing this.
    #rm -r "${pkgdir}"/usr/lib/dracut
    rm -r "${pkgdir}"/usr/lib/modules-load.d
    rm -r "${pkgdir}"/usr/share/initramfs-tools
    rm -r "${pkgdir}"/usr/share/zfs/*.sh
    rm -r "${pkgdir}"/usr/share/zfs/{runfiles,test-runner,zfs-tests}

    install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
    install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
}
