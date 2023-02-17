# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=('system76-firmware' 'system76-firmware-daemon')
pkgbase=system76-firmware
pkgver=1.0.50+4+gd24f401
pkgrel=1
pkgdesc="System76 CLI tool for installing firmware updates and systemd service that exposes a DBUS API for handling firmware updates"
arch=('x86_64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL3')
makedepends=('cargo' 'dbus' 'git')
_commit=d24f401e382affec462b8b21382d003b23cd3bcc
source=("git+https://github.com/pop-os/system76-firmware.git#commit=${_commit}")
sha256sums=('SKIP')
#validpgpkeys=('D3FB3AF9711C1CD12639C9F587F211AF2BE4C2FE') # Jeremy Soller (https://soller.dev) <jackpot51@gmail.com>

pkgver() {
  cd "$srcdir/$pkgbase"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgbase"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgbase"
  export RUSTUP_TOOLCHAIN=stable
  make
}

package_system76-firmware() {
  pkgdesc="System76 CLI tool for installing firmware updates"
  depends=('ca-certificates' 'efibootmgr' 'openssl' 'xz')

  cd "$srcdir/$pkgbase"
  make DESTDIR="$pkgdir" install-cli
}

package_system76-firmware-daemon() {
  pkgdesc="System76 systemd service that exposes a DBUS API for handling firmware updates"
  depends=('dbus' 'dfu-programmer' 'system76-firmware' 'systemd')
  install="$pkgname.install"

  cd "$srcdir/$pkgbase"
  make DESTDIR="$pkgdir" install-daemon

  install -d "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/etc/systemd/system/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
  rm -rf "$pkgdir/etc/systemd"
}
