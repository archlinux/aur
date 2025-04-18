# SPDX-License-Identifier: 0BSD
# Maintainer: M Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=wborder-git
pkgver=0.2.0.r0.g5a5cdf2
pkgrel=1
pkgdesc='Add a colored border to Wayland clients run under this program'
license=('GPL-3.0-or-later')
makedepends=('git' 'rust' 'cargo' 'python')
url='https://gitlab.freedesktop.org/mstoeckl/wborder'
source=('git+https://gitlab.freedesktop.org/mstoeckl/wborder.git')
sha512sums=('SKIP')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
provides=('wborder')
conflicts=('wborder')

pkgver() {
	cd wborder
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd wborder
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd wborder
	CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

package() {
	cd wborder
	install -D -m755 "target/release/wborder" "$pkgdir/usr/bin/wborder"
}
