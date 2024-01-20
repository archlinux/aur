# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=firmware-manager-git
_app_id=com.system76.FirmwareManager
pkgver=0.1.5.r7.g27633c6
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL-3.0-or-later')
depends=('dbus' 'gtk3' 'libgudev' 'openssl' 'polkit')
makedepends=('cargo' 'git')
optdepends=('fwupd: Generic firmware updates'
            'system76-firmware-daemon: System76 firmware updates')
conflicts=('libfirmware-manager')
replaces=('libfirmware-manager-git')
options=('!lto')
source=('git+https://github.com/pop-os/firmware-manager.git'
        "${_app_id}.policy"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make prefix=/usr
}

package() {
  cd "${pkgname%-git}"
  make prefix=/usr DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/${_app_id}.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions/"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

  desktop-file-edit --set-key=Exec --set-value="${pkgname%-git}" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
}

