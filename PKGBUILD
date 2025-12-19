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
    _git_branch="branch=zfs-2.4.1-staging"
    _staging_ver="2.4.1"
    _base_ver="2.4.0"
fi

pkgname=${_pkgname}-utils-staging-git
pkgver=2.4.0.r0.g743334913e
pkgrel=1
pkgdesc="Userspace utilities for the Zettabyte File System (release staging branch)."
arch=("i686" "x86_64" "aarch64")
url="https://zfsonlinux.org/"
license=('CDDL-1.0')
groups=('zfs-staging-git')
optdepends=('python: for arcstat/arc_summary/dbufstat')
conflicts=("${_pkgname}-utils")
makedepends=("git")
source=("${_pkgname}::git+${_git_repo}#${_git_branch}"
        "zfs-node-permission.conf"
        "zfs.initcpio.install"
        "zfs.initcpio.hook"
        "zfs.initcpio.zfsencryptssh.install")
sha256sums=('SKIP'
            '7ad45fd291aa582639725f14d88d7da5bd3d427012b25bddbe917ca6d1a07c1a'
            '2f09c742287f4738c7c09a9669f8055cd63d3b9474cd1f6d9447152d11a1b913'
            '15b5acea44225b4364ec6472a08d3d48666d241fe84c142e1171cd3b78a5584f'
            '93e6ac4e16f6b38b2fa397a63327bcf7001111e3a58eb5fb97c888098c932a51')
backup=('etc/default/zfs'
        'etc/zfs/zed.d/zed.rc')

prepare() {
    cd "${srcdir}/${_pkgname}"

    msg2 "Staging branch set to ${_git_branch}"

    # pyzfs is not built, but build system tries to check for python anyway
    ln -sf /bin/true python3-fake

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
    provides=("${_pkgname}-utils=${_base_ver}")

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
    install -D -m644 "${srcdir}"/zfs.initcpio.zfsencryptssh.install "${pkgdir}"/usr/lib/initcpio/install/zfsencryptssh
}
