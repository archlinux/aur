#!/usr/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Nyameko Lisa <lisa dot nyameko at gmail dot com>

pkgname=('beegfs-utils')
_srcname='utils'
pkgdesc='Distributed, fault-tolerant cluster storage platfom formally known as FhGFS'
pkgver=7.1.3
_tag="$pkgver"
_ver='v7'
pkgrel=1
arch=('x86_64' 'i686')
url="https://git.beegfs.io/pub"
license=('BeeGFS END-USER LICENE AGREEMENT')

depends=('libutil-linux' 'attr' 'acl' 'openssl' 'zlib' 'sqlite' 'curl' 'elfutils' 'fuse-common' 'ld-lsb' 'lsb-release' 'rdma-core')
optdepends=('beegfs-utils' 'xfsprogs' 'btrfs-progs')
makedepends=('git' 'gcc' 'libsystemd' 'systemd' 'pkg-config' 'bash' 'boost-libs')
provides=('beegfs-utils')
provides=("${_provides[@]}")
conflicts=("${_provides[@]}")
replaces=("${_provides[@]}")

source=("$pkgname-$pkgver::git+${url}/${_ver}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver/ctl/source/"

    find toolkit -type f -exec sed --in-place \
        --expression='s|attr/xattr.h|sys/xattr.h|g' \
        '{}' '+'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make utils
}

package() {
    cd "$srcdir/$pkgname-$pkgver/$_srcname/scripts"
    install -D --mode=0644 etc/bash_completion.d/beegfs-ctl "${pkgdir}/etc/bash_completion.d/beegfs-ctl"
    install -D --mode=0755 beegfs-check-servers "${pkgdir}/usr/bin/beegfs-check-servers"
    install -D --mode=0755 beegfs-df "${pkgdir}/usr/bin/beegfs-df"
    install -D --mode=0755 beegfs-net "${pkgdir}/usr/bin/beegfs-net"

    cd "$srcdir/$pkgname-$pkgver"
    install -D --mode=0755 ctl/build/beegfs-ctl "${pkgdir}/usr/bin/beegfs-ctl"
    install -D --mode=0644 ctl/build/libCtl.a "${pkgdir}/usr/lib/beegfs/libCtl.a"
    install -D --mode=0755 fsck/build/beegfs-fsck "${pkgdir}/usr/bin/beegfs-fsck"
    install -D --mode=0644 fsck/build/libFsck.a "${pkgdir}/usr/lib/beegfs/libFsck.a"
    install -D --mode=0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
