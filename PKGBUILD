# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=firmware-manager
_app_id=com.system76.FirmwareManager
pkgver=0.1.5+15+ga45bdc7
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
install="$pkgname.install"
_commit=a45bdc7ba6fe5a9ae640ebe72d81641eec4a8003  # branch/master
source=("git+https://github.com/pop-os/firmware-manager.git#commit=${_commit}"
        "${_app_id}.policy"
        "$pkgname.sh")
sha256sums=('d7527cc3d8e527ebcd9b7f179ed0748c89a62dc2f99b7779cd66dcc202c96a8b'
            '3d268c7f9675af3d7f661f141ee165e4ed5471ba0961bf7755059a423cac5319'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  make prefix=/usr
}

package() {
  cd "$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/${_app_id}.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions/"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  desktop-file-edit --set-key=Exec --set-value="$pkgname" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
}
