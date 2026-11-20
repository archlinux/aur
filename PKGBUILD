# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=ssl12-ctl
pkgname="$_pkgname-git"
pkgver=r5
pkgrel=3
pkgdesc='Control the Solid State Logic SSL 12 audio interface.'
arch=('x86_64')
url='https://github.com/john-baxter-dev/ssl12-ctl'
license=('Apache-2.0' 'MIT')
groups=(pro-audio)
source=(
	"git+https://github.com/john-baxter-dev/$_pkgname.git"
	"ssl12tui.desktop"
)
sha256sums=('SKIP'
            '2c08b1a1aa4e8f7f83228469f7d0a96a9fe5d7b6c35ba76de87016fc3c0a4306')
makedepends=(
	cargo
	git
)

pkgver() {
	cd $_pkgname
	echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --features="usb,tui,config" --frozen --release
}

check() {
	cd $_pkgname
	cargo test
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgname/target/release/ssl12tui"
	install -Dm0755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgname/target/release/ssl12ctl"
	install -Dm0755 -t "$pkgdir/etc/udev/rules.d" "$srcdir/$_pkgname/packaging/70-ssl12.rules"
	install -Dm0644 -T ${srcdir}/$_pkgname/ssl12ctl-icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ssl12ctl.png"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" ${srcdir}/ssl12tui.desktop
}

# vim:set ts=2 sw=2
