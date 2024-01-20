# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=firmware-manager
_app_id=com.system76.FirmwareManager
pkgver=0.1.5+3+gf3ead34
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
replaces=('libfirmware-manager')
options=('!lto')
install="$pkgname.install"
_commit=f3ead34e243025eb1ae39d19b5844f91e17f3c31  # branch/master
source=("git+https://github.com/pop-os/firmware-manager.git#commit=${_commit}"
        "${_app_id}.policy"
        "$pkgname.sh")
sha256sums=('SKIP'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
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

