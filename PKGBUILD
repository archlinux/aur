# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=107.r8031
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
  'udev'
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
  'systemd: systemd'
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
sha512sums=('SKIP'
            '1935e69f9992ae3e693c4c1e402f4459cbc3b75f379e2781db63dc7b1a5ba2520fa53cc3b4397276610e07df23ea1be0eb2b56da79c0574b55c4e3fb16a4e44b'
            '8f8c3a892094dca621db8f18c73501b4f316692d82bb05fc193d772d51c935eb85e0e8a45a2ae6285432421d3733077e74ab4803a722507147cc6e012b374b6d'
            'eea03d26c34b54984cf04a30fd4166814757258d67cd0cd72bbc9d69f0ebae8cd181290b0f2a1d43c24b39b19b802936ff6374205fa721d34e152db0aca5179e'
            '5f8f6f04081061d36cd331737b40a8f523319f0d05d92308c0967de97266c27d3dd901da49ce0850f12c2cd95e5eb19ba6219b5d8a1d075c010420be1900f803')
b2sums=('SKIP'
        '8f60cac605eea34d663c7ca22b616ba07c70a81d61135b364793d31ce294ce49a32452ea109b73fe36b83784587c7bfcf6f5d3cd7e6efc002f8e7ee63c0225ab'
        '43657d862aa6c1d7fae4f511b0715ad56a2988e43890921ffaf0ee3e1ac9418aaae789524c5cf50d1dc44a4164525a9cbc590a2e41336037115b3409902e8ecd'
        '402a6d72fd2acf28e2d6745e7e2a34bd17b551e56be412895f76aeeaeace67daa754351a8430151dbd6979b329fea93a610dc4f48114d4a8b503e519adfe8298'
        'a3bc75e55af379ddd3fee1dd7c6855fcb42366f42d9e10c1725b8e38f81c3eee0a4131badcf6ba2c4addf78aae4084528407af38295ab2b7e62ab16e3fe0b599')

pkgver() {
  cd "${pkgname%-git}"

  # populate DRACUT_VERSION from upstream source
  source dracut-version.sh

  # use number of revisions since beginning of the history
  printf "%s.r%s" "$DRACUT_VERSION" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

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
  install -Dm755 "${srcdir}"/dracut-install.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-install
  install -Dm755 "${srcdir}"/dracut-remove.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-remove
  install -Dm644 -t "${pkgdir}"/usr/share/libalpm/hooks "${srcdir}"/*.hook
}
