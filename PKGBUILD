# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=firmware-manager-git
_app_id=com.system76.FirmwareManager
pkgver=0.1.5.r15.ga45bdc7
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'gtk3'
  'libgudev'
  'openssl'
  'polkit'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  'fwupd: Generic firmware updates'
  'system76-firmware-daemon: System76 firmware updates'
)
conflicts=('libfirmware-manager')
source=('git+https://github.com/pop-os/firmware-manager.git'
        "${_app_id}.policy"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '3d268c7f9675af3d7f661f141ee165e4ed5471ba0961bf7755059a423cac5319'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
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
