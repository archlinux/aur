# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=('firmware-manager' 'libfirmware-manager')
pkgbase=firmware-manager
pkgver=0.1.2
pkgrel=5
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl' 'libgudev')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'com.system76.FirmwareManager.policy'
        "$pkgname.sh")
sha256sums=('5bde56704ef8542f84ab9a8d6739cbfbcfcaaa26e089421fe0a527c5c9013f8d'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

prepare() {
  cd "$pkgbase-$pkgver"
#  make toml-gen

#  export RUSTUP_TOOLCHAIN=stable
#  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase-$pkgver"
#  export RUSTUP_TOOLCHAIN=stable
  export RUSTUP_TOOLCHAIN=1.41.0
  make prefix=/usr
}

package_firmware-manager() {
  pkgdesc="GTK application for managing system and device firmware."
  depends+=('libfirmware-manager' 'polkit')
  provides=("$pkgname-virtual")
  install="$pkgname.install"

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir/" install-{bin,notify,icons} prefix=/usr

  install -Dm644 "$srcdir/com.system76.FirmwareManager.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

package_libfirmware-manager() {
  pkgdesc="Shared library for C which provides the firmware manager as a GTK widget."
  optdepends=('fwupd' 'system76-firmware-daemon')
  provides=('libfirmware_manager.so')

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir/" install-ffi prefix=/usr
}
