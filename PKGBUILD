# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=rusty-keys-git
pkgver=0.0.2.r18.g0ffc169
pkgrel=1
pkgdesc="uinput level keyboard mapper for linux"
url="https://code.moparisthebest.com/moparisthebest/rusty-keys"
makedepends=('cargo' 'systemd' 'git')
depends=('libsystemd')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('AGPL')
backup=('etc/rusty-keys/keymap.toml')
source=("$pkgname::git+https://code.moparisthebest.com/moparisthebest/rusty-keys.git")
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=(SKIP)
conflicts=(rusty-keys)
provides=(rusty-keys=$pkgver)

pkgver() {
  cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm644 systemd/rusty-keys.service "${pkgdir}/usr/lib/systemd/system/rusty-keys.service"
  install -Dm755 target/release/rusty-keys "$pkgdir/usr/bin/rusty-keys"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 keymap.toml "${pkgdir}/etc/rusty-keys/keymap.toml"
}
