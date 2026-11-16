# Maintainer: François Bernier <frankbernier at gmail dot com>
# Contributor: Maxim Baz <wluma at maximbaz dot com>

pkgname=wluma-git
_pkgname=wluma
pkgver=5.0.4.r6.gba70dbb
pkgrel=1
pkgdesc='Automatic brightness adjustment based on screen contents and ALS'
arch=('x86_64' 'aarch64')
url='https://github.com/max-baz/wluma'
license=('ISC')
depends=(
  'dbus'
  'glibc'
  'libgcc'
  'libpipewire'
  'systemd-libs'
  'v4l-utils'
  'vulkan-icd-loader'
)
makedepends=(
  'cargo'
  'clang'
  'git'
)
optdepends=(
  'vulkan-driver: screen content analysis'
  'wayland: Wayland screen capture and idle detection'
  'xdg-desktop-portal: PipeWire screen capture through the ScreenCast portal'
  'iio-sensor-proxy: ambient light sensor access over D-Bus'
  'upower: separate idle dimming settings on AC and battery'
  'ddcutil-service: preferred DDC/CI backend for external monitors'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
# makepkg's -flto turns the libspa C shim into GCC bitcode that lld cannot link.
options=('!lto')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${_pkgname}"
  install -Dm755 target/release/wluma -t "${pkgdir}/usr/bin"
  install -Dm644 wluma.service -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 90-wluma-backlight.rules -t "${pkgdir}/usr/lib/udev/rules.d"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
