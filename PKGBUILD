# Maintainer: Tiago Correia
#
# AUR package built from source. scripts/aur.sh fills in pkgver and the
# checksum of the release tarball and writes .SRCINFO; see docs/RELEASE.md.
pkgname=virsh-tui
pkgver=0.2.0
pkgrel=1
pkgdesc="Keyboard-driven terminal UI for libvirt/virsh with vim keys and live graphs"
arch=('x86_64' 'aarch64')
url="https://github.com/SyscallBrain/virsh-tui"
license=('MIT')
depends=('glibc' 'libgcc' 'libvirt')
makedepends=('cargo')
optdepends=('virt-install: the new domain wizard'
            'virt-viewer: the graphical viewer')
# The release profile already strips the binary: a -debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6f287f86c326190550d404d4a5a991ed70c4a86f54d807b9a27d55f2fd31422')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/virsh-tui "$pkgdir/usr/bin/virsh-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
