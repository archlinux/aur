# Maintainer: Lex Childs <lexchilds@gmail.com>
# Contributor: éclairevoyant
# Contributor: VuiMuich <jm.spam@gmx.net>
# Contributor: mautam <mautam@usa.com>

pkgbase=leftwm
pkgname=(leftwm leftwm-nonsystemd)
pkgver=0.5.4
pkgrel=3
pkgdesc="A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
depends=(gcc-libs)
makedepends=('cargo' 'git')
optdepends=('bash: themes'
            'dmenu: default launcher'
            'eww: flexible status bar'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5889843e64377f8c09edae51cadeddb9e6dab599e51c96fcc8314ceb4a5a7f16')
install='readme.install'

prepare() {
	cd $pkgbase-$pkgver
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgbase-$pkgver

	export CARGO_TARGET_DIR=target_non_systemd
	cargo build --frozen --release --no-default-features --features=lefthk,sys-log,xlib

	export CARGO_TARGET_DIR=target_systemd
	cargo build --frozen --release
}

_package() {
	install -Dm755 leftwm{,-worker,-state,-check,-command} lefthk-worker -t "$pkgdir"/usr/bin/

	cd ../../
	install -Dm644 leftwm/doc/leftwm.1 -t "$pkgdir"/usr/share/man/man1/
	install -d "$pkgdir"/usr/share/leftwm
	cp -R themes "$pkgdir"/usr/share/leftwm
	install -Dm644 leftwm.desktop -t "$pkgdir"/usr/share/xsessions/
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/leftwm/LICENSE
}

package_leftwm-nonsystemd() {
	pkgdesc+=" (non-systemd init)"
  provides=('leftwm')
  conflicts=('leftwm')
	cd $pkgbase-$pkgver/target_non_systemd/release
	_package
}

package_leftwm() {
	pkgdesc+=" (systemd init)"
	depends+=(systemd)
	cd $pkgbase-$pkgver/target_systemd/release
	_package
}
