# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: H3rmt

# This is a fork of the original hyprswitch as it got renamed to hyprshell!

pkgname=hyprswitch
_pkgver=6.1.1
pkgver=${_pkgver//-/}	# needed for pre-releases
pkgrel=1
pkgdesc="A CLI/GUI that allows switching between windows in Hyprland"
arch=('any')
url="https://github.com/egnrse/hyprswitch/"
license=("MIT")
makedepends=('cargo')
depends=('hyprland' 'gtk4-layer-shell' 'gtk4')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/egnrse/hyprswitch/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('1b69eb62de6664a238334497a2c388ef293b7910600cb4ac34f95c57fdf0b936')
backup=('etc/default/hyprswitch')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "${pkgname}-${_pkgver}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "${pkgname}-${_pkgver}"
	cargo build --frozen --release
}

package() {
	cd "${pkgname}-${_pkgver}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "./target/release/${pkgname}"

	# systemd integration
	install -Dm0644 "./assets/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
	install -Dm0644 "./assets/${pkgname}-args" \
		"${pkgdir}/etc/default/${pkgname}"
}

post_install() {
	echo "Please restart the hyprswitch daemon!"
}
