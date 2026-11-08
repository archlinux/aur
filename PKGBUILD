# Maintainer: sfs <sfslinux at gmail dot com>

pkgname=virtomir-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='A web control deck for KVM, QEMU and libvirt'
arch=('x86_64' 'aarch64')
url='https://github.com/onurbaydas/VirtoMir'
license=('AGPL-3.0-or-later')
depends=('glibc' 'pam' 'libvirt' 'qemu-base' 'dnsmasq')
depends_x86_64=('edk2-ovmf')
depends_aarch64=('edk2-armvirt')
optdepends=(
  'swtpm: virtual TPM 2.0/1.2 for q35 VMs (Windows 11)'
  'ipmitool: IPMI BMC host fencing'
  'restic: encrypted off-site backups'
  'zfs-utils: ZFS pools and replication'
)
provides=('virtomir')
conflicts=('virtomir')
backup=('etc/pam.d/virtomir')
install=virtomir.install
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/virtomir_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/virtomir_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('85dabce4cf59ad8a3ea38c30580bdd5c44aab394d05bb649e411df908b004f5b')
sha256sums_aarch64=('1618972dcaaded8ab75e6da8ce777123fe97159ccfa36a9323b771d6729c9abd')

package() {
  local goarch=amd64
  if [[ $CARCH == aarch64 ]]; then
    goarch=arm64
  fi
  cd "${srcdir}/virtomir_v${pkgver}_linux_${goarch}"

  install -Dm755 virtomird "${pkgdir}/usr/bin/virtomird"
  install -Dm644 virtomird.service "${pkgdir}/usr/lib/systemd/system/virtomird.service"
  sed -i 's|/usr/local/bin/virtomird|/usr/bin/virtomird|' \
    "${pkgdir}/usr/lib/systemd/system/virtomird.service"

  install -Dm644 /dev/stdin "${pkgdir}/etc/pam.d/virtomir" <<'PAM'
auth      include    system-auth
account   include    system-auth
PAM
}
