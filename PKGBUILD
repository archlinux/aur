#!/usr/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Nyameko Lisa <lisa dot nyameko at gmail dot com>

pkgname=('beegfs-common')
_srcname='common'
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
makedepends=('git' 'gcc' 'libsystemd' 'systemd' 'pkg-config' 'bash' 'boost-libs' 'linux-headers' 'kmod' 'gzip')
provides=('beegfs-common')
provides=("${_provides[@]}")
conflicts=("${_provides[@]}")
replaces=("${_provides[@]}")

source=("$pkgname-$pkgver::git+${url}/${_ver}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver/${_srcname}_module/build/"
    find dist -type f -exec sed --in-place \
         --expression='s|/usr/libexec|/usr/lib/beegfs|g' \
         --expression='s|/usr/sbin|/usr/bin|g' \
         --expression='s|/sbin|/usr/bin|g' \
         --expression='s|/opt/beegfs/usr/bin|/usr/bin|g' \
         '{}' '+'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make ccommon
}

package() {
    cd "$srcdir/$pkgname-$pkgver/${_srcname}/build"
    install -D --mode=0644 libbeegfs-common.a "${pkgdir}/usr/lib/beegfs/libbeegfs-common.a"
    install -D --mode=0755 libbeegfs_ib.so "${pkgdir}/usr/lib/beegfs/libbeegfs_ib.so"

    cd "$srcdir/$pkgname-$pkgver"
    install -D --mode=0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
