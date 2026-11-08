# Maintainer: sfs <sfslinux at gmail dot com>

pkgname=webkvm-bin
_pkgname=webkvm
# Upstream tag without "v" (may contain "-", e.g. 0.1.8-fix01); pkgver is the same with "-" -> "."
_tag=0.1.11
pkgver=0.1.11
pkgrel=1
pkgdesc="Native libvirt + QEMU/KVM and Incus manager with embedded web UI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Slaker19/webkvm"
license=('AGPL-3.0-only')
depends=(
  bash glibc libvirt qemu-system-x86 qemu-img edk2-ovmf dnsmasq
  qemu-hw-display-virtio-vga qemu-hw-display-virtio-gpu  # default VM video model 'virtio'
  nftables iptables ca-certificates iproute2 procps-ng util-linux
  tar zstd xz e2fsprogs
)
optdepends=(
  'swtpm: virtual TPM 2.0/1.2 for q35 VMs (Windows 11)'
  'libisoburn: xorriso for cloud-init seed ISOs (Image Hub cloud images)'
  'qemu-ui-spice-core: SPICE graphics for VMs (browser SPICE console, .vv files)'
  'qemu-chardev-spice: SPICE agent channel (clipboard, display resize)'
  'qemu-hw-display-qxl: QXL video model'
  'qemu-hw-display-virtio-gpu-gl: 3D acceleration (virgl) for virtio video'
  'qemu-hw-display-virtio-vga-gl: 3D acceleration (virgl), primary virtio display'
  'qemu-ui-egl-headless: 3D acceleration (virgl) renderer, needs /dev/dri/renderD*'
  'qemu-audio-spice: guest audio over SPICE'
  'virt-viewer: open downloaded .vv files (remote-viewer)'
  'freerdp: open downloaded .rdp files (Windows guests with RDP enabled)'
  'incus: LXC system containers'
  'mdadm: software RAID management'
  'nfs-utils: NFS storage pools and backup targets'
  'cifs-utils: SMB/CIFS mounts'
  'smbclient: SMB share browsing'
  'gptfdisk: disk partitioning (sgdisk)'
  'parted: disk partitioning (fallback for sgdisk)'
  'xfsprogs: XFS formatting'
  'btrfs-progs: Btrfs formatting'
  'f2fs-tools: F2FS formatting'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/default/webkvm')
options=('!strip' '!debug')
install=$pkgname.install
source=("$url/releases/download/v$_tag/$_pkgname-$_tag.tar.gz")
sha256sums=('d8db7d695c57da70c792b1d6a8eca6c2a432ed41c7e1bd40ed63013cb04776f1')

prepare() {
  # Binary lives in /usr/bin; self-update would overwrite pacman-owned files, so disable it.
  sed -i -e 's|^ExecStart=/usr/local/bin/webkvm$|ExecStart=/usr/bin/webkvm|' \
         -e '/^Environment=WEBKVM_ALLOW_UPDATE=1$/d' scripts/webkvm.service
  # Fail loudly if a new upstream unit no longer matches the patterns above.
  grep -qx 'ExecStart=/usr/bin/webkvm' scripts/webkvm.service
  if grep -q 'WEBKVM_ALLOW_UPDATE' scripts/webkvm.service; then
    echo "webkvm.service: WEBKVM_ALLOW_UPDATE still present" >&2
    return 1
  fi
}

package() {
  install -Dm755 backend/webkvm "$pkgdir/usr/bin/webkvm"
  install -Dm755 backend/webkvm-cli "$pkgdir/usr/bin/webkvm-cli"
  install -Dm644 scripts/webkvm.service "$pkgdir/usr/lib/systemd/system/webkvm.service"
  install -Dm644 packaging/nfpm/webkvm.default "$pkgdir/etc/default/webkvm"
  install -Dm755 scripts/setup-network.sh "$pkgdir/usr/share/webkvm/setup-network.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The unit's ReadWritePaths fails with 226/NAMESPACE if these are missing.
  install -dm755 "$pkgdir/opt/webkvm/logs" "$pkgdir/etc/webkvm"
}
