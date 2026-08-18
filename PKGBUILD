# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Corey Hinshaw <corey@electrickite.org>
pkgname=system76-firmware-git
pkgver=1.0.78.r0.gb3395ae
pkgrel=1
pkgdesc="System76 Firmware Tool and Daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL-3.0-only')
depends=(
  'ca-certificates'
  'dbus'
  'dfu-programmer'
  'efibootmgr'
  'glibc'
  'libgcc'
  'openssl'
  'xz'
)
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}" 'system76-firmware-daemon')
conflicts=("${pkgname%-git}" 'system76-firmware-daemon')
source=('git+https://github.com/pop-os/system76-firmware.git'
        'makefile.patch')
sha256sums=('SKIP'
            'eb2cbdbb9eced1073c325ac3d7f3f9e33778ee98152020b725e0472e26f08c71')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple

  # Install Systemd & Dbus service to proper directories
  patch -Np1 -i ../makefile.patch
}

build() {
  cd "${pkgname%-git}"
  export OPENSSL_NO_VENDOR=1
  export RUSTUP_TOOLCHAIN=stable
  ARGS+=" --frozen" make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
