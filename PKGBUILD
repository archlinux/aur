# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('firmware-manager-git' 'libfirmware-manager-git')
pkgbase=firmware-manager-git
pkgver=0.1.2.r32.g0bbeb12
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'libgudev' 'openssl')
makedepends=('cargo' 'git')
source=('git+https://github.com/pop-os/firmware-manager.git'
        'com.system76.FirmwareManager.policy'
        "${pkgbase%-git}.sh")
sha256sums=('SKIP'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
  cd "$srcdir/${pkgbase%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgbase%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${pkgbase%-git}"
  export RUSTUP_TOOLCHAIN=stable
  make prefix=/usr
}

package_firmware-manager-git() {
  pkgdesc="GTK application for managing system and device firmware."
  depends+=('libfirmware-manager-git' 'polkit')
  provides=("${pkgname%-git}" "${pkgname%-git}-virtual")
  conflicts=("${pkgname%-git}")
  install="${pkgname%-git}.install"

  cd "$srcdir/${pkgbase%-git}"
  make DESTDIR="$pkgdir/" install-{bin,notify,icons} prefix=/usr

  install -Dm644 "$srcdir/com.system76.FirmwareManager.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}

package_libfirmware-manager-git() {
  pkgdesc="Shared library for C which provides the firmware manager as a GTK widget."
  optdepends=('fwupd' 'system76-firmware-daemon')
  provides=("${pkgname%-git}" 'libfirmware_manager.so')
  conflicts=("${pkgname%-git}")

  cd "$srcdir/${pkgbase%-git}"
  make DESTDIR="$pkgdir/" install-ffi prefix=/usr
}
