#!/usr/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Nyameko Lisa <lisa dot nyameko at gmail dot com>

pkgname=('beegfs-client')
_srchelper='helperd'
_srcname='client'
pkgdesc='Distributed, fault-tolerant cluster storage platfom formally known as FhGFS'
pkgver=7.1.3
_tag="$pkgver"
_ver='v7'
pkgrel=1
arch=('x86_64' 'i686')
url="https://git.beegfs.io/pub"
license=('BeeGFS END-USER LICENE AGREEMENT' 'GPL2')

depends=('libutil-linux' 'attr' 'acl' 'openssl' 'zlib' 'sqlite' 'curl' 'elfutils' 'fuse-common' 'ld-lsb' 'lsb-release' 'rdma-core' 'rpcbind')
optdepends=('beegfs-utils' 'xfsprogs' 'btrfs-progs')
makedepends=('git' 'gcc' 'libsystemd' 'systemd' 'pkg-config' 'bash' 'boost-libs' 'linux-headers' 'kmod' 'gzip')
provides=('beegfs-helperd' 'beegfs-client')
provides=("${_provides[@]}")
conflicts=("${_provides[@]}")
replaces=("${_provides[@]}")

source=("$pkgname-$pkgver::git+${url}/${_ver}.git#tag=${_tag}"
        "http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt")
sha256sums=('SKIP'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')

prepare() {
    cd "$srcdir/$pkgname-$pkgver/${_srchelper}/build"
    find dist -type f -exec sed --in-place \
         --expression='s|/usr/libexec|/usr/lib/beegfs|g' \
         --expression='s|/usr/sbin|/usr/bin|g' \
         --expression='s|/sbin|/usr/bin|g' \
         --expression='s|/opt/beegfs/usr/bin|/usr/bin|g' \
         '{}' '+'

    cd "${srcdir}/$pkgname-$pkgver/${_srcname}_module/build/"
    find dist -type f -exec sed --in-place \
         --expression='s|/usr/libexec|/usr/lib/beegfs|g' \
         --expression='s|/usr/sbin|/usr/bin|g' \
         --expression='s|/sbin|/usr/bin|g' \
         --expression='s|/opt/beegfs/usr/bin|/usr/bin|g' \
         '{}' '+'

    find dist/etc/beegfs-mounts.conf -type f -exec sed --in-place \
         --expression='s|/mnt/beegfs|/mnt/beegfs/beegfs-mount|g' \
         '{}' '+'

    find dist/usr/lib/systemd/system/beegfs-client.service -type f -exec sed --in-place \
         --expression='s|/etc/init.d|/etc/beegfs/init.d|g' \
         '{}' '+'

    cd "$srcdir/$pkgname-$pkgver/${_srcname}_module/source/"

    # comment out deprecated current_fs_time definitions of timespec and timspec65 lines 155-166
    find common/Common.h -type f -exec sed --in-place \
         --expression='/KERNEL_HAS_64BIT_TIMESTAMPS/,+12 s!^!//!' \
         '{}' '+'

    # replace DEPRECATEED do_gettimeofday
    find common/toolkit/TimeAbs.c -type f -exec sed --in-place \
         --expression='s|timeval|timespec64|g'\
         --expression='s|do_gettimeofday|ktime_get_real_ts64|g' \
         --expression='s|= now.tv_usec|= now.tv_nsec/1000|g' \
         '{}' '+'

    # remove deprecated access_ok types
    find filesystem/ProcFs.c -type f -exec sed --in-place \
         --expression='s|access_ok(VERIFY_READ, |access_ok(|g' \
         '{}' '+'

    find filesystem/FhgfsOpsFile.c -type f -exec sed --in-place \
         --expression='s|access_ok(VERIFY_WRITE, |access_ok(|g' \
         '{}' '+'

    # replace deprecated current_fs_time(superblock) with current_time(directory inode)
    find filesystem/FhgfsOpsInode.c -type f -exec sed --in-place \
         --expression='s|dir->i_mtime = current_fs_time(sb);|dir->i_mtime = current_time(dir);|g' \
         --expression='s|inodeDirTo->i_mtime = current_fs_time(sb);|inodeDirTo->i_mtime = current_time(inodeDirTo);|g' \
         '{}' '+'

    find filesystem/FhgfsOpsSuper.c -type f -exec sed --in-place \
         --expression='s|MS_NODIRATIME|SB_NODIRATIME|g' \
         --expression='s|current_fs_time(sb);|current_time(kstat.ino);|g' \
         '{}' '+'

    #find filesystem/FhgfsOpsSuper.c -type f -exec sed --in-place \
    #     --expression='s|MS_NODIRATIME|SB_NODIRATIME|g' \
    #     --expression='s|kstat.atime = kstat.mtime = kstat.ctime = current_fs_time(sb);|struct timespec now;\
   #kstat.atime = kstat.mtime = kstat.ctime = ktime_get_real_ts(\&now);|g' \
    #     '{}' '+'

    find filesystem/FhgfsOpsIoctl.c -type f -exec sed --in-place \
         --expression='s|access_ok(VERIFY_WRITE, |access_ok(|g' \
         '{}' '+'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make helperd-all

    cd "$srcdir/$pkgname-$pkgver"

    make client
}

package() {
    cd "$srcdir/$pkgname-$pkgver/${_srchelper}/build"
    install -D --mode=0644 dist/etc/beegfs-helperd.conf "${pkgdir}/etc/beegfs/beegfs-helperd.conf"
    install -D --mode=0644 dist/usr/lib/systemd/system/beegfs-helperd.service "${pkgdir}/usr/lib/systemd/system/beegfs-helperd.service"
    install -D --mode=0644 dist/usr/lib/systemd/system/beegfs-helperd@.service "${pkgdir}/usr/lib/systemd/system/beegfs-helperd@.service"
    install -D --mode=0644 libHelperd.a "${pkgdir}/usr/lib/beegfs/libHelperd.a"
    install -D --mode=0755 beegfs-helperd "${pkgdir}/usr/bin/beegfs-helperd"

    cd "$srcdir/$pkgname-$pkgver/${_srcname}_module/build"
    install -D --mode=0644 dist/etc/beegfs-client-autobuild.conf "${pkgdir}/etc/beegfs/beegfs-client-autobuild.conf"
    install -D --mode=0644 dist/etc/beegfs-client.conf "${pkgdir}/etc/beegfs/beegfs-client.conf"
    install -D --mode=0644 dist/etc/beegfs-mounts.conf "${pkgdir}/etc/beegfs/beegfs-mounts.conf"
    install -D --mode=0644 dist/etc/init.d/beegfs-client.init "${pkgdir}/etc/beegfs/init.d/beegfs-client"
    install -D --mode=0644 dist/etc/beegfs-client-mount-hook.example "${pkgdir}/etc/beegfs/init.d/exec_mount_hook"
    install -D --mode=0644 dist/usr/lib/systemd/system/beegfs-client.service "${pkgdir}/usr/lib/systemd/system/beegfs-client.service"
    install -D --mode=0755 dist/sbin/beegfs-setup-client "${pkgdir}/usr/bin/beegfs-setup-client"
    gzip -fk beegfs.ko
    install -D --mode=0644 beegfs.ko.gz "${pkgdir}/usr/lib/modules/$(uname -r)/net/beegfs/beegfs.ko.gz"
    #depmod -a beegfs.ko
    #modprobe ./beegfs.ko
    #modprobe beegfs

    cd "$srcdir/$pkgname-$pkgver"
    install -D --mode=0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    cd "$srcdir"
    install -D --mode=0644 gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
}
