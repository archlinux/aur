# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=firmware-manager-git
_app_id=com.system76.FirmwareManager
pkgver=0.1.5.r15.ga45bdc7
pkgrel=3
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
  'desktop-file-utils'
  'git'
)
checkdepends=('appstream')
optdepends=(
  'fwupd: Generic firmware updates'
  'system76-firmware: System76 firmware updates'
)
conflicts=('libfirmware-manager')
source=('git+https://github.com/pop-os/firmware-manager.git'
        'https://github.com/pop-os/firmware-manager/pull/166.patch'
        'https://github.com/pop-os/firmware-manager/pull/158.patch'
        "${_app_id}.policy"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '187bf684d9769bf15e20cde1fff21f069f200ce10e72db7ebc77c516c14a787f'
            'caf5a4b2e5d51e61c34623820988607569cba419337854563a79a99d443ced36'
            '3d268c7f9675af3d7f661f141ee165e4ed5471ba0961bf7755059a423cac5319'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # Enable LTO by default
  patch -Np1 -i ../158.patch

  # Update system76-firmware to fix builds
  patch -Np1 -i ../166.patch

  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export OPENSSL_NO_VENDOR=1
  export RUSTUP_TOOLCHAIN=stable
  make prefix=/usr

  # Set Exec & StartupWMClass
  desktop-file-edit \
    --set-key=Exec --set-value="${pkgname%-git}" \
    --set-key=StartupWMClass --set-value=Com.system76.FirmwareManager \
    "target/${_app_id}.desktop"
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "assets/${_app_id}.appdata.xml"
  desktop-file-validate target/*.desktop
}

package() {
  cd "${pkgname%-git}"
  make prefix=/usr DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/${_app_id}.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions/"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
