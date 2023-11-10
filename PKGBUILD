# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=('firmware-manager' 'libfirmware-manager')
pkgbase=firmware-manager
pkgver=0.1.5
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'libgudev' 'openssl')
makedepends=('cargo' 'git' 'gtk3' 'setconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'com.system76.FirmwareManager.policy'
        "$pkgbase.sh")
sha256sums=('997a85aa60c4cc46eb5f42b7e46cf2d60ba8b39a24d4574f604bf7d78da8fd96'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

prepare() {
  cd "$pkgbase-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make prefix=/usr
}

package_firmware-manager() {
  pkgdesc="GTK application for managing system and device firmware."
  depends=('gtk3' 'libfirmware-manager' 'polkit')
  provides=("$pkgname-virtual")
  install="$pkgname.install"

  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" install-{bin,notify,icons}

  install -Dm644 "$srcdir/com.system76.FirmwareManager.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  setconf "$pkgdir/usr/share/applications/com.system76.FirmwareManager.desktop" Exec "$pkgname"
}

package_libfirmware-manager() {
  pkgdesc="Shared library for C which provides the firmware manager as a GTK widget."
  depends+=('fwupd')
  optdepends=('system76-firmware-daemon: For System76 firmware updates')
  provides=('libfirmware_manager.so')

  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" install-ffi
}
