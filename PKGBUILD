# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=one-kvm-bin
pkgver=0.2.8
_tag=261001
pkgrel=3
pkgdesc='Open and lightweight IP-KVM solution for BIOS-level remote management (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/mofeng-git/One-KVM'
license=('AGPL-3.0-only')
provides=("one-kvm=$pkgver")
conflicts=('one-kvm')
depends=(
  'alsa-lib'
  'gcc-libs'
  'glibc'
  'libdrm'
  'systemd-libs'
)
depends_x86_64=(
  'libmfx'
  'libva'
  'libx11'
)
optdepends=(
  'bluez: Bluetooth HID keyboard/mouse support'
  'ttyd: integrated web terminal'
  'easytier-core: P2P VPN mesh networking'
  'frpc: NAT traversal / port forwarding'
  'gostc: frp-based NAT traversal management'
  'xz: create Ventoy mass-storage USB drives'
  'networkmanager: USB OTG virtual NIC bridging'
)
optdepends_x86_64=(
  'intel-media-driver: Intel VA-API hardware encoding (Gen 8+)'
  'libva-intel-driver: Intel VA-API hardware encoding (older GPUs)'
  'libva-mesa-driver: AMD VA-API hardware encoding'
)
options=('!strip')

case "$CARCH" in
  aarch64) _debarch=arm64 ;;
  armv7h) _debarch=armhf ;;
  *) _debarch=amd64 ;;
esac

source_x86_64=(
  "one-kvm_${pkgver}_amd64.deb::https://github.com/mofeng-git/One-KVM/releases/download/v${_tag}/one-kvm_${pkgver}_amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/mofeng-git/One-KVM/v${_tag}/LICENSE"
)
sha256sums_x86_64=('759ffe077ba888e64a8b488e28e829392e55caae1167401d44e37537e600a8e9'
                   '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_aarch64=('c46d095a4c950edf9c95de4b0aae266edf2e2df2ba8fd74aaad57c1aa56d77ba'
                    '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_armv7h=('b81eba52483e83f5439a5219d05b5ac4074c8de7b533267fb01cdc6fc64d2223'
                   '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
source_aarch64=(
  "one-kvm_${pkgver}_arm64.deb::https://github.com/mofeng-git/One-KVM/releases/download/v${_tag}/one-kvm_${pkgver}_arm64.deb"
  "LICENSE::https://raw.githubusercontent.com/mofeng-git/One-KVM/v${_tag}/LICENSE"
)
source_armv7h=(
  "one-kvm_${pkgver}_armhf.deb::https://github.com/mofeng-git/One-KVM/releases/download/v${_tag}/one-kvm_${pkgver}_armhf.deb"
  "LICENSE::https://raw.githubusercontent.com/mofeng-git/One-KVM/v${_tag}/LICENSE"
)
noextract=("one-kvm_${pkgver}_${_debarch}.deb")

prepare() {
  cd "$srcdir"
  rm -rf deb
  mkdir -p deb/root
  bsdtar -xf "one-kvm_${pkgver}_${_debarch}.deb" -C deb
  bsdtar -xf deb/data.tar.* -C deb/root
}

package() {
  install -Dm755 "$srcdir/deb/root/usr/bin/one-kvm" \
    "$pkgdir/usr/bin/one-kvm"
  install -Dm644 "$srcdir/deb/root/lib/systemd/system/one-kvm.service" \
    "$pkgdir/usr/lib/systemd/system/one-kvm.service"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Pre-decompressed Ventoy resources shipped in the official deb.
  install -d "$pkgdir/etc/one-kvm/ventoy"
  install -m644 "$srcdir/deb/root/etc/one-kvm/ventoy/boot.img" \
    "$pkgdir/etc/one-kvm/ventoy/boot.img"
  install -m644 "$srcdir/deb/root/etc/one-kvm/ventoy/core.img" \
    "$pkgdir/etc/one-kvm/ventoy/core.img"
  install -m644 "$srcdir/deb/root/etc/one-kvm/ventoy/ventoy.disk.img" \
    "$pkgdir/etc/one-kvm/ventoy/ventoy.disk.img"
}
