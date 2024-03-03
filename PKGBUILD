# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=060.r6794.4980bad
pkgrel=4
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
checkdepends=(
  'base-devel'
  'btrfs-progs'
  'connman'
  'dash'
  'dhclient'
  'dhcp'
  'dmraid'
  'linux'
  'lvm2'
  'mdadm'
  'multipath-tools'
  'nbd'
  'networkmanager'
  'nfsidmap'
  'nfs-utils'
  'ntfs-3g'
  'open-iscsi'
  'parted'
  'pigz'
  'qemu'
  'squashfs-tools'
  'strace'
  'tcpdump'
  'vi'
)
provides=("${pkgname%-git}" 'initramfs')
conflicts=("${pkgname%-git}")
backup=('etc/dracut.conf')
source=(
  'git+https://github.com/dracutdevs/dracut.git'
  2429.patch::https://github.com/dracutdevs/dracut/commit/71055058c0bdb6fec0dbebf2ec8bbfc968820b88.patch
  2527.patch::https://github.com/dracutdevs/dracut/commit/a2fe89116db4b286fbf515f26bd1773b5e6ee8ad.patch
  2610.patch::https://github.com/dracutdevs/dracut/commit/f68d056bd9d32f4fc0c15163b256d1811a552302.patch
  2613.patch::https://github.com/dracutdevs/dracut/commit/619de721cff44ed7c0b809bee80aee6986577e59.patch
)
sha512sums=(
  'SKIP'
  83c1f6ff6cdee619dfe8bc7dd6401797e427678701424c85c0dd91268575ce2dd8d164ff8bf029afcf884835bd220929d22a15ab5da2ddf3cfffdc80dbdcf3c3
  bba154e13463fb759e1cfd5f461b2b4e786ad8c6f4cacacbd918e911efc7d5a5368300676d6e6d8e9b7b2f4333314886bb1e34daac9f0c73c1c441baf7918063
  fdffc9362d72c98cd595f458b7a20157868e4f445ad692afde8337df77496bc905597d18d646b01ee58f9cdd3eefc848bfe04e9aa565fde6e4a2e65aa3fe75e0
  d55de661daadd47d2b08ae5d0bc7d651f5bc93a189b58d1f0fac2496b31069212e2e120f7ba56e3afa5cfe7360070a1afd3ed609760d812264829fb8ec9c246f
)

pkgver() {
  cd "${pkgname%-git}"

  # populate DRACUT_VERSION from upstream source
  source dracut-version.sh

  # use number of revisions since beginning of the history
  printf "%s.r%s.%s" "$DRACUT_VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # apply all patches
  for p in ../*.patch ; do
    patch -Np1 < ../$p
  done

  # remove dracut modules not meant for arch x86_64
  for f in 45ifcfg 80cms 81cio_ignore 91zipl 95dasd 95dasd_mod \
    95dasd_rules 95dcssblk 95qeth_rules 95zfcp \
    95zfcp_rules 95znet; do
    rm -rf modules.d/$f
  done
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

check() {
  cd "${pkgname%-git}/test"

  SKIP="18 20 30 35 40 50 60 62 63" KVERSION="$(cd /lib/modules && ls -1 | tail -1)" make check
}

package() {
  cd "${pkgname%-git}"

  DESTDIR="$pkgdir" make install
}
