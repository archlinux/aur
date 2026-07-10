# Maintainer: AlanD20 <aland20@pm.me>
pkgname=mvmctl-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="MicroVM Manager - Container speed, VM isolation"
arch=('x86_64' 'aarch64')
url="https://github.com/AlanD20/mvmctl"
license=('MIT')
depends=(
  'iproute2' 'nftables' 'iptables' # networking
  'qemu-img'                       # image conversion
  'openssh'                        # ssh-keygen
  'e2fsprogs' 'util-linux'         # filesystem tools
  'kmod'                           # modprobe, lsmod
  'sudo' 'shadow'                  # privilege management
  'tar'                            # archive extraction
  'fakeroot'
)
optdepends=(
  'cloud-image-utils: cloud-init ISO mode (--cloud-init-mode iso)'
  'libguestfs: alternative rootfs provisioning backend (slower, more capable)'
)
makedepends=()
provides=('mvmctl')
conflicts=('mvmctl')

# Release binaries: mvm (x86_64) and mvm-arm64 (aarch64).
# Arch Linux $CARCH is "x86_64" or "aarch64".
_arch_suffix=""
if [[ "$CARCH" == "aarch64" ]]; then
  _arch_suffix="-arm64"
fi
source=("mvm-${pkgver}::https://github.com/AlanD20/mvmctl/releases/download/v${pkgver}/mvm${_arch_suffix}"
  "mvm.1-${pkgver}::https://raw.githubusercontent.com/AlanD20/mvmctl/v${pkgver}/docs/mvm.1")
sha256sums=('dc2c1863d2bd6cd7e5dabcfcb39265fe430b36fae1eb2bf12ef38bc0b9b3ddca' '07f67bfad8a40379b603cf77001ecac12b0f74093116160485e556841329c239')

package() {
  # Install binary
  install -Dm755 "${srcdir}/mvm-${pkgver}" "${pkgdir}/usr/bin/mvm"

  # Install man page
  install -Dm644 "${srcdir}/mvm.1-${pkgver}" "${pkgdir}/usr/share/man/man1/mvm.1"
  gzip -9 "${pkgdir}/usr/share/man/man1/mvm.1"
}
