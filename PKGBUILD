# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=100.r6891.136079d
pkgrel=1
pkgdesc='An event driven initramfs infrastructure'
arch=('x86_64')
url='https://github.com/dracut-ng/dracut-ng'
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'coreutils'
  'cpio'
  'findutils'
  'gawk'
  'grep'
  'kmod'
  'pkgconf'
  'procps'
  'sed'
  'systemd'
  'util-linux'
)
makedepends=(
  'asciidoc'
  'bash-completion'
  'git'
  'cargo'
)
optdepends=(
  'binutils: --uefi option support'
  'biosdevname: BIOS network device renaming'
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
  'iproute2: legacy networking support'
  'iputils: networking support'
  'jq: NVMe-oF support (nvmf module)'
  'lvm2: support Logical Volume Manager'
  'lzop: lzop compression'
  'mdadm: support MD devices, also known as software RAID devices'
  'memstrack: memstrack module support'
  'mksh: allows use of mksh'
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
  'rsyslog: enable logging with rsyslog'
  'sbsigntools: uefi_secureboot_cert/key configuration option support'
  'squashfs-tools: support for building a squashed initramfs'
  'tar: live tar image'
  'tpm2-tools: tpm2 support for e.g. LUKS'
  'xz: xz compression'
)
checkdepends=(
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
)
provides=("${pkgname%-git}" 'initramfs')
conflicts=("${pkgname%-git}")
backup=('etc/dracut.conf')

source=(
  git+${url}.git
)

sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"-ng

  # populate DRACUT_VERSION from upstream source
  source dracut-version.sh

  # use number of revisions since beginning of the history
  printf "%s.r%s.%s" "$DRACUT_VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"-ng

  # remove dracut modules not meant for arch x86_64
  for f in 45ifcfg 80cms 81cio_ignore 90ppcmac 91zipl \
    95dasd 95dasd_mod 95dasd_rules 95dcssblk 95fcoe* \
    95qeth_rules 95zfcp 95zfcp_rules 95znet; do
    rm -rf modules.d/$f
  done
}

build() {
  cd "${pkgname%-git}"-ng

  local prefix=/usr sysconfdir=/etc
  ./configure \
    --enable-dracut-cpio \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=${prefix}/lib/systemd/system \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

check() {
  cd "${pkgname%-git}-ng/test"

  SKIP=${SKIP-"20 50 60"} TESTS=${TESTS-"18"} KVERSION="$(cd /lib/modules && ls -1 | tail -1)" make check
}

package() {
  cd "${pkgname%-git}"-ng

  DESTDIR="$pkgdir" make install
}
