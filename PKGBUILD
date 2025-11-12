# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=109.r8328
pkgrel=2
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://github.com/dracut-ng/dracut"
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
  'asciidoctor'
  'bash-completion'
  'git'
  'rust'
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
  'cryptsetup: support for encrypted with LUKS filesystems'
  'dash: allows use of dash (on your own risk)'
  'dbus: dbus-daemon dracut module'
  'dbus-broker: dbus-broker dracut module'
  'dhclient: legacy networking support'
  'dmraid: dmraid dracut module support'
  'e2fsprogs: ext2/3/4 filesystem support'
  'elfutils: strip binaries to reduce initramfs size'
  'erofs-utils: support for building an erofs initramfs'
  'f2fs-tools: fsfs filesystem support'
  'fuse3: live on NTFS (dmsquash-live-ntfs module)'
  'gnupg: gpg for crypto operations and smartcards'
  'gzip: gzip compression'
  'iproute2: legacy networking support'
  'iputils: networking support'
  'jq: NVMe-oF support (nvmf module)'
  'lvm2: support Logical Volume Manager'
  'lzop: lzop compression'
  'mdadm: support MD devices, also known as software RAID devices'
  'memstrack: memstrack module support'
  'multipath-tools: multipath dracut module support'
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
  'qrencode: systemd-bsod'
  'rng-tools: enable rngd service to help generating entropy early during boot'
  'rsyslog: enable logging with rsyslog'
  'sbsigntools: uefi_secureboot_cert/key configuration option support'
  'systemd-ukify: Unified Kernel Image'
  'squashfs-tools: support for building a squashed initramfs'
  'tar: live tar image'
  'tpm2-tools: tpm2 support for e.g. LUKS'
  'xz: xz compression'
)
provides=('initramfs')
backup=('etc/dracut.conf')
source=(
  git+${url}.git
  dracut-{install,remove}.script
  90-dracut-install.hook
  60-dracut-remove.hook
)
conflicts=("${pkgname%-git}")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
pkgver() {
  cd "${pkgname%-git}"

  # populate DRACUT_VERSION from upstream source
  source dracut-version.sh

  # use number of revisions since beginning of the history
  printf "%s.r%s" "$DRACUT_VERSION" "$(git rev-list --count HEAD)"
}

build() {
  cd "${pkgname%-git}"

  ./configure  \
    --sysconfdir=/etc

  make
}

package() {
  cd "${pkgname%-git}"

  DESTDIR="$pkgdir" make install

  # pacman hooks
  install -Dm755 "${srcdir}"/dracut-install.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-install
  install -Dm755 "${srcdir}"/dracut-remove.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-remove
  install -Dm644 -t "${pkgdir}"/usr/share/libalpm/hooks "${srcdir}"/*.hook
}
