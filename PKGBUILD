#!/usr/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Nyameko Lisa <lisa dot nyameko at gmail dot com>
# Need to find out variant of GPLv2, include it in pakcage and copy it here as well.

pkgname=('beegfs-mon')
_srcname='mon'
pkgdesc='Distributed, fault-tolerant cluster storage platfom formally known as FhGFS'
pkgver=7.1.3
_tag="$pkgver"
_ver='v7'
pkgrel=1
arch=('x86_64' 'i686')
url="https://git.beegfs.io/pub"
license=('BeeGFS END-USER LICENE AGREEMENT')

depends=('libutil-linux' 'attr' 'acl' 'openssl' 'zlib' 'sqlite' 'curl' 'elfutils' 'fuse-common' 'ld-lsb' 'lsb-release')
optdepends=('beegfs-utils' 'xfsprogs' 'btrfs-progs' 'influxdb: timeseries data logging support' 'grafana: dashboard and graphing support')
makedepends=('git' 'gcc' 'libsystemd' 'systemd' 'pkg-config' 'bash' 'boost-libs')
provides=('beegfs-mon')
provides=("${_provides[@]}")
conflicts=("${_provides[@]}")
replaces=("${_provides[@]}")

source=("$pkgname-$pkgver::git+${url}/${_ver}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver/${_srcname}/build/"
    find dist -type f -exec sed --in-place \
         --expression='s|/usr/libexec|/usr/lib/beegfs|g' \
         --expression='s|/usr/sbin|/usr/bin|g' \
         --expression='s|/sbin|/usr/bin|g' \
         --expression='s|/opt/beegfs/usr/bin|/usr/bin|g' \
         '{}' '+'

    cd "$srcdir/$pkgname-$pkgver/ctl/source/"

    find toolkit -type f -exec sed --in-place \
        --expression='s|attr/xattr.h|sys/xattr.h|g' \
        '{}' '+'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make mon-all
}

package() {
    cd "$srcdir/$pkgname-$pkgver/${_srcname}/build"
    install -D --mode=0644 dist/etc/beegfs-mon.conf "${pkgdir}/etc/beegfs/beegfs-mon.conf"
    install -D --mode=0644 dist/usr/lib/systemd/system/beegfs-mon.service "${pkgdir}/usr/lib/systemd/system/beegfs-mon.service"
    install -D --mode=0644 dist/usr/lib/systemd/system/beegfs-mon@.service "${pkgdir}/usr/lib/systemd/system/beegfs-mon@.service"
    install -D --mode=0644 libMon.a "${pkgdir}/usr/lib/beegfs/libMon.a"
    install -D --mode=0755 beegfs-mon "${pkgdir}/usr/bin/beegfs-mon"

    cd "$srcdir/$pkgname-$pkgver/${_srcname}/scripts/grafana"
    install -D --mode=0644 client_ops_node.json "${pkgdir}/etc/beegfs/grafana/client_ops_node.json"
    install -D --mode=0644 client_ops_user.json "${pkgdir}/etc/beegfs/grafana/client_ops_user.json"
    install -D --mode=0644 influxdb.json "${pkgdir}/etc/beegfs/grafana/influxdb.json"
    install -D --mode=0644 meta.json "${pkgdir}/etc/beegfs/grafana/meta.json"
    install -D --mode=0644 storage.json "${pkgdir}/etc/beegfs/grafana/storage.json"
    install -D --mode=0644 storage_targets.json "${pkgdir}/etc/beegfs/grafana/storage_targets.json"
    install -D --mode=0755 import-dashboards "${pkgdir}/etc/beegfs/grafana/import-dashboards"

    cd "$srcdir/$pkgname-$pkgver"
    install -D --mode=0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
