# Maintainer: Mark Wagie <mark.wagie@proton.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Corey Hinshaw <corey@electrickite.org>
pkgname=system76-firmware-git
pkgver=1.0.59.r6.gbd968bd
pkgrel=1
pkgdesc="System76 Firmware Tool and Daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL-3.0-or-later')
depends=(
  'ca-certificates'
  'dbus'
  'dfu-programmer'
  'gcc-libs'
  'glibc'
  'efibootmgr'
  'openssl'
  'xz'
)
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}" 'system76-firmware-daemon')
conflicts=("${pkgname%-git}" 'system76-firmware-daemon')
source=('git+https://github.com/pop-os/system76-firmware.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make VENDORED=1
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/etc/systemd "$pkgdir"/usr/lib/
}
