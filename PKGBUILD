# Maintainer: CPT_Dawn <ping@cptdawn.dev>
#
# Builds Arch-Sense from the tagged GitHub release tarball. The release workflow
# (.github/workflows/release.yml) bumps pkgver and the tarball checksum (the FIRST
# sha256sums entry) with .github/scripts/bump-pkgbuild.sh and pushes this file to
# the AUR. The remaining sources are the packaged files next to this PKGBUILD.
# ./check.sh runs the packaging checks; ./check.sh --build also builds (from a
# tarball of the local checkout, since an unreleased version has none).

pkgname=arch-sense
pkgver=2.0.1
pkgrel=1
pkgdesc="Control center for Linuwu-Sense Acer laptops: thermal profiles, fans, battery and keyboard lighting"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Arch-Sense"
license=('MIT')
depends=('linuwu-sense-dkms-git' 'libusb' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('nvidia-utils: GPU temperature via nvidia-smi when hwmon has no GPU sensor')
install=arch-sense.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'arch-sense.service'
  'arch-sense.sysusers'
  'arch-sense.tmpfiles'
  '71-arch-sense.rules'
)
sha256sums=('3774f1f14bb83a738376438d97b405567a66563ca05485edd9d38068778a7645'
            'c14e3915fb71c2909e30217439ca9a2a2b275c787ccc9fefbdc1e4471c4eb1d7'
            'fda5d014e6980d2ae73a42366182fb46337022c0588a6e81c7635651673c6d67'
            '3bb028afeba660ee71b8510a05ef848d2700597b6083873578488fe9742cf3c1'
            '6552f52d9ffdd527f968e008fae47342d95309f868296f8190a43cb939ae7e74')

_tree="Arch-Sense-$pkgver"

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path "$srcdir/$_tree/Cargo.toml" --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --manifest-path "$srcdir/$_tree/Cargo.toml"
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --frozen --manifest-path "$srcdir/$_tree/Cargo.toml"
}

package() {
  install -Dm755 "$srcdir/target/release/arch-sense" "$pkgdir/usr/bin/arch-sense"
  install -Dm644 "$srcdir/arch-sense.service" "$pkgdir/usr/lib/systemd/system/arch-sense.service"
  install -Dm644 "$srcdir/arch-sense.sysusers" "$pkgdir/usr/lib/sysusers.d/arch-sense.conf"
  install -Dm644 "$srcdir/arch-sense.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/arch-sense.conf"
  install -Dm644 "$srcdir/71-arch-sense.rules" "$pkgdir/usr/lib/udev/rules.d/71-arch-sense.rules"
  install -Dm644 "$srcdir/$_tree/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
