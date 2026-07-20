# Maintainer: Viet Anh Nguyen <vietanh.dev@gmail.com>
pkgname=thinkutils
pkgver=0.2.0
pkgrel=1
pkgdesc="ThinkPad fan control, battery care and system monitoring for Linux"
# Both, and the reasoning is narrower than it looks. thinkpad_acpi IS x86-only,
# so fan control genuinely cannot work on aarch64 -- but ThinkUtils is not only
# fan control. Battery charge thresholds go through the generic kernel
# power_supply API, and the CPU governor and system monitor are not ThinkPad
# specific at all. Those work on an X13s (Snapdragon 8cx) exactly as they do on
# an x86 machine.
#
# The app already detects an absent /proc/acpi/ibm/fan and reports degraded
# rather than failing, which is asserted by the container launch tests on both
# arches -- so this is a supported configuration rather than a hopeful one.
arch=('x86_64' 'aarch64')
url="https://github.com/vietanhdev/ThinkUtils"
license=('LGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'polkit')
makedepends=('cargo' 'pkgconf' 'nodejs' 'npm')
optdepends=(
  'lm_sensors: temperature readings and the fan curve'
  'clamav: virus scanning on the Security page'
  'power-profiles-daemon: power profile switching'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee93ca9f5c927f421b8308a3f6984f610c0ff271361601397f4b3e5517441f8d')

prepare() {
  cd "ThinkUtils-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "ThinkUtils-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Plain cargo, not `tauri build`: the bundler downloads linuxdeploy and emits
  # .deb/.AppImage artifacts that are meaningless inside a PKGBUILD.
  cargo build --frozen --release
}

package() {
  cd "ThinkUtils-$pkgver"
  install -Dm0755 src-tauri/target/release/thinkutils "$pkgdir/usr/bin/thinkutils"

  # Privileged fan helper: package-owned, root:root, and NOT in /usr/local --
  # Arch packages may not write there. Matches HELPER_CANDIDATES[0].
  install -Dm0755 packaging/helper/thinkutils-fan-control \
    "$pkgdir/usr/lib/thinkutils/thinkutils-fan-control"

  # Vendor polkit rules belong under /usr/share; /etc is the admin's namespace.
  install -Dm0644 packaging/polkit/50-thinkutils.rules \
    "$pkgdir/usr/share/polkit-1/rules.d/50-thinkutils.rules"

  install -Dm0644 thinkutils.desktop "$pkgdir/usr/share/applications/thinkutils.desktop"
  install -Dm0644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/thinkutils.png"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
