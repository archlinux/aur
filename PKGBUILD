# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=107.r8040
pkgrel=1
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
  'asciidoc'
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
  1387.patch::${url}/commit/919a337.patch # fix: load essential storage kernel modules in sloppy hostonly mode
  1425.patch::${url}/commit/8b993db.patch # fix(systemd-sysext): enable initrd-specific units
  kernel-install.sh
  90-kernel-install-add.hook
  40-kernel-install-remove.hook
)
conflicts=("${pkgname%-git}")
sha512sums=('SKIP' 'SKIP' 'SKIP'
            'e49b18780e1753cb8f5e6a978efc45712a82597437af7ce4ade5019fcd84269fae89fd36e16ea27f6a56f71001aecbe2653175bbff6c04eb88d38dfdc344bc6d'
            '564755b5a60d7ba4371c83429503a73fd04ea42011ba3e0c7f3e5df51108458afd6f75988a38d0ed0ceb626e4d7ba9c5e2a61fc6854463e05d51a91168b4b566'
            '1f1901712f168157c9caa25ba594e54a399125c554e3cda44aff8aa303b532038f52d10bd374a340e803ad0535e66ad2a1f2158361f6af2ebb4c7f56ef108592')
b2sums=('SKIP' 'SKIP' 'SKIP'
        'e99bcf7bdf4d5092c3928fc0bf77db1dffd1a827f35c71a1dd300982713daa8b9c8f68997bb95dddad16fff860ad0990faaa68b80334374eeef791cdedc34b78'
        '6e7d3a07074b46190e2d9c0bc94c11dc631cc86d8413a80d1ad49dfb1c973e98718dd241a0155eedbc1d7749880730066504a915bc175f67f7915372d62b9676'
        '3452b73ac812a225a218ff261e6105be7d2c6f9d9e2743d647ba2f209da21a5a7bd616f8a3a28c7967a715e7efcb9c84134d3e209c85785c2ef6f81109251681')

pkgver() {
  cd "${pkgname%-git}"

  # populate DRACUT_VERSION from upstream source
  source dracut-version.sh

  # use number of revisions since beginning of the history
  printf "%s.r%s" "$DRACUT_VERSION" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # apply all patches
  for p in ../*.patch ; do
    patch -Np1 < $p
    P=$(echo $p | sed 's/^\.\.\///g' | sed 's/\.patch$//g')
    S=$(cat ../$p | grep 'Subject:' | sed 's/^Subject:\ \[PATCH\]\ //g')
  done

  # remove dracut modules not meant for arch x86_64
  for f in cms cio_ignore ppcmac zipl \
    dasd dasd_mod dasd_rules dcssblk fcoe* \
    qeth_rules zfcp zfcp_rules znet; do
    rm -rf "modules.d/[0-9][0-9]$f"
  done
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
  install -Dm644 "${srcdir}"/90-kernel-install-add.hook "${srcdir}"/40-kernel-install-remove.hook \
    -t"${pkgdir}/usr/share/libalpm/hooks"
  install -Dm755 "${srcdir}"/kernel-install.sh "${pkgdir}/usr/share/libalpm/scripts/kernel-install"
}
