# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Corey Hinshaw <corey@electrickite.org>
pkgname=system76-firmware-git
pkgver=1.0.74.r2.g79a2dc8
pkgrel=1
pkgdesc="System76 Firmware Tool and Daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL-3.0-only')
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
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  ARGS+=" --frozen" make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/etc/systemd "$pkgdir"/usr/lib/
}
