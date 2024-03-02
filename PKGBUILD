# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=059.r214.4980bad3
pkgrel=3
pkgdesc='An event driven initramfs infrastructure'
arch=('x86_64')
url='https://github.com/dracutdevs/dracut'
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'coreutils'
  'cpio'
  'filesystem'
  'findutils'
  'gawk'
  'grep'
  'kmod'
  'pkgconf'
  'procps-ng'
  'sed'
  'systemd'
  'util-linux'
)
makedepends=(
  'git'
  'bash-completion'
  'asciidoc'
)
optdepends=(
  'binutils: --uefi option support'
  'bluez: bluetooth (keyboard)'
  'btrfs-progs: scan for Btrfs on block devices'
  'busybox: allows use of busybox (on your own risk)'
  'bzip2: bzip2 compression'
  'cifs-utils: support CIFS'
  'connman: support for connman networking'
  'dash: allows use of dash (on your own risk)'
  'dhclient: legacy networking support'
  'dmraid: dmraid dracut module support'
  'e2fsprogs: ext2/3/4 filesystem support'
  'elfutils: strip binaries to reduce initramfs size'
  'f2fs-tools: fsfs filesystem support'
  'fuse3: live on NTFS (dmsquash-live-ntfs module)'
  'gzip: gzip compression'
  'hardlink: --hardlink option support'
  'iproute2: legacy networking support'
  'iputils: networking support'
  'lvm2: support Logical Volume Manager'
  'lzop: lzop compression'
  'mdadm: support MD devices, also known as software RAID devices'
  'memstrack: memstrack module support'
  'multipath-tools: dmraid dracut module support'
  'nbd: support network block devices'
  'ndctl: NVDIMM support'
  'networkmanager: networkmanager support'
  'nfs-utils: support NFS'
  'ntfs-3g: live on NTFS (dmsquash-live-ntfs module)'
  'nvme-cli: NVMe-oF support (nvmf module)'
  'open-iscsi: support iSCSI (iscsi module)'
  'openssh: install ssh and scp along with config files and specified keys (ssh-client module)'
  'pigz: faster gzip compression'
  'plymouth: plymouth boot splash'
  'rng-tools: enable rngd service to help generating entropy early during boot'
  'sbsigntools: uefi_secureboot_cert/key configuration option support'
  'squashfs-tools: support for building a squashed initramfs'
  'tar: live tar image'
  'tpm2-tools: tpm2-tss module support'
  'xz: xz compression'
)
provides=("${pkgname%-git}" 'initramfs')
conflicts=("${pkgname%-git}")
backup=('etc/dracut.conf')
source=(
  'git+https://github.com/dracutdevs/dracut.git'
  2527.patch::https://github.com/dracutdevs/dracut/commit/a2fe89116db4b286fbf515f26bd1773b5e6ee8ad.patch
)
sha512sums=(
  'SKIP'
  bba154e13463fb759e1cfd5f461b2b4e786ad8c6f4cacacbd918e911efc7d5a5368300676d6e6d8e9b7b2f4333314886bb1e34daac9f0c73c1c441baf7918063
)

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 < ../*.patch
}

build() {
  cd "${pkgname%-git}"
  local prefix=/usr sysconfdir=/etc
  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=${prefix}/lib/systemd/system \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
